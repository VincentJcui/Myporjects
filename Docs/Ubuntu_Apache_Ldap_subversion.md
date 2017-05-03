    apache2 2.2
（1）查找apache和ldap相关模块
	sudo apt-cache search apache2 ldap 
（2）验证 cn是否可用，是做第（4）步的前提（如果没有，可以在phpLDAPadmin 中的建一个cn，直接把admin那个cn：Copy or move this entry即可。貌似只有cn可以登录phpLDAPadmin：Logged in as: cn=admin）
	
	ldapsearch -h 10.0.10.159 -p 389 -x -b "ou=People,dc=corp,dc=ppweb,dc=com,dc=cn" -D "cn=readproxy,dc=corp,dc=ppweb,dc=com,dc=cn" -w operation
	如果能列出一堆信息就说明正确了
（3）安装ldap和apache2相关模块儿
	sudo apt-get install subversion
	sudo apt-get install apache2
	sudo apt-get install libapache2-svn
	sudo apt-get install libapache2-mod-ldap-userdir
	sudo apt-get install libapache2-mod-vhost-ldap    （apache2 2.4.10不需要这个，带上反而日志报错，去掉就好了）
（4）增加apache+ldap认证信息配置文件
	vim /etc/apache2/mods-available/dav_svn.conf
	<Location />
	DAV svn
	SVNPath /data/repos/ppweb
	#会去找 仓库目录下的format文件，所以上面的路径指的是repos
	AuthType Basic
	AuthName "ppweb subversion repository"
	#AuthUserFile /etc/subversion/passwd
	AuthzSVNAccessFile /etc/apache2/dav_svn.authz   #用户ldap+svn的账户权限验证文件
	#以下为LDAP服务配置
	AuthBasicProvider ldap
	AuthzLDAPAuthoritative off   （apache2 2.4.10 需要注销这一行，否则一直报错，说有语法错误）
	#LDAP连接
	#AuthLDAPURL "ldap://10.0.10.159/ou=People,dc=corp,dc=ppweb,dc=com,dc=cn?sAMAccountName?sub?(objectClass=user)"
	AuthLDAPURL "ldap://10.0.10.159/ou=People,dc=corp,dc=ppweb,dc=com,dc=cn?uid?sub?(objectClass=*)"    #uid可用，上面那个在这台服务器用不了
	#邦定用户
	AuthLDAPBindDN "cn=readproxy,dc=corp,dc=ppweb,dc=com,dc=cn"
	#邦定密码
	AuthLDAPBindPassword "operation"
	#<LimitExcept GET PROPFIND OPTIONS REPORT>
	Require valid-user
	#</LimitExcept>
	</Location>
（5）添加ldap认证模块儿（否则会报错 Unknow Authn provider:ldap 这个错误）
	sudo vim /etc/apache2/mods-enabled/dav_svn.load  （加最后两后，变成4行）
	# Depends: dav
	LoadModule dav_svn_module /usr/lib/apache2/modules/mod_dav_svn.so
	LoadModule authz_svn_module /usr/lib/apache2/modules/mod_authz_svn.so
	LoadModule ldap_module /usr/lib/apache2/modules/mod_ldap.so
	LoadModule authnz_ldap_module /usr/lib/apache2/modules/mod_authnz_ldap.so    
（6）重启apache并验证
	sudo /etc/init.d/apache2 restart
	验证：http://10.0.10.52/
		此时弹出ldap验证框，输入ldap中的用户名和密码即可。此时，TortoiseSVN也可以使用了，用户名密码也是通过ldap认证的                                             
（7）使用SSL认证(https)
	sudo apt-get install openssl ssl-cert
	sudo a2enmod ssl
	sudo mkdir /etc/apache2/ssl
	cd /etc/apache2/ssl
	sudo openssl genrsa -des3 -out svn-server.key 1024   # 创建私钥，密码：qingdao0613
	sudo openssl req -x509 -newkey rsa:1024 -keyout /etc/apache2/ssl/svn-apache.pem -out /etc/apache2/ssl/svn-apache.pem -nodes -days 3650   # 创建证书

	创建站点文件：
	sudo vim /etc/apache2/sites-available/ssl
		NameVirtualHost *:443
		<VirtualHost *:443>
		        ServerSignature On
		        SSLEngine On
		        SSLCertificateFile /etc/apache2/ssl/svn-apache.pem
		        ServerAdmin webmaster@localhost

		        DocumentRoot /var/www
		        <Directory />
		                Options FollowSymLinks
		                AllowOverride None
		        </Directory>
		        <Directory /var/www/>
		                Options Indexes FollowSymLinks MultiViews
		                AllowOverride None
		                Order allow,deny
		                allow from all
		        </Directory>

		        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
		        <Directory "/usr/lib/cgi-bin">
		                AllowOverride None
		                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		                Order allow,deny
		                Allow from all
		        </Directory>

		        ErrorLog /var/log/apache2/ssl-error.log

		        # Possible values include: debug, info, notice, warn, error, crit,
		        # alert, emerg.
		        LogLevel warn

		        CustomLog /var/log/apache2/ssl-access.log combined

		    Alias /doc/ "/usr/share/doc/"
		    <Directory "/usr/share/doc/">
		        Options Indexes MultiViews FollowSymLinks
		        AllowOverride None
		        Order deny,allow
		        Deny from all
		        Allow from 127.0.0.0/255.0.0.0 ::1/128
		    </Directory>

		</VirtualHost>

	ssl站点设为可运行,用下面的命令确保ssl模块已经加载进apache了：
	sudo a2ensite ssl
	sudo vim /etc/apache2/ports.conf
		#NameVirtualHost *:80        # 当做80端口跳转443的时候，80端口总是起不来，就是因为在/etc/apache2/ports.conf中把80端口给禁用了
		#Listen 80

		<IfModule mod_ssl.c>
		    # If you add NameVirtualHost *:443 here, you will also have to change
		    # the VirtualHost statement in /etc/apache2/sites-available/default-ssl
		    # to <VirtualHost *:443>
		    # Server Name Indication for SSL named virtual hosts is currently not
		    # supported by MSIE on Windows XP.
		    Listen 443
		</IfModule>

		<IfModule mod_gnutls.c>
		    Listen 443
		</IfModule>

（8）重启apache2，并使用https验证ldap登录svn
	sudo /etc/init.d/apache2 restart
	https://10.0.10.52/

（9）实现访问svn的 80 到 443 的跳转，做完之后就可以使用域名访问svn了，而且是基于https的
	如果 http 不能跳转到 https 的话，可能是rewrite模块没有的原因：op@svn:/etc/apache2/mods-enabled$ sudo ln -sv ../mods-available/rewrite.load ./
	前提：把/etc/apache2/ports.conf中的80和443端口都打开
	sudo vim /etc/apache2/sites-enabled/svn.lieyan.corp.ppweb.com.cn （即上面第7步的/etc/apache2/sites-available/ssl）
	<VirtualHost *:80>
	        # this is not necessary to include, all traffic will be redirected to https
	        Include global/svn.lieyan.com.cn-common

	        RewriteEngine On
	        RewriteCond %{HTTPS} !=on
	        RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]
	</VirtualHost>

	<VirtualHost *:443>
	        ServerName svn.lieyan.com.cn
	        ServerAlias svn
	        Include global/svn.lieyan.com.cn-common

	        SSLEngine on

	        SSLCertificateFile /etc/apache2/ssl/svn.lieyan.com.cn.pem

	        BrowserMatch "MSIE [2-6]" \
	                nokeepalive ssl-unclean-shutdown \
	                downgrade-1.0 force-response-1.0
	        # MSIE 7 and newer should be able to use keepalive
	        BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
	</VirtualHost>

	<VirtualHost *:443>
	        ServerName xingyun.lieyan.com.cn
	        Include global/svn.lieyan.com.cn-common

	        SSLEngine on

	        SSLCertificateFile /etc/apache2/ssl/svn.lieyan.com.cn.pem

	        BrowserMatch "MSIE [2-6]" \
	                nokeepalive ssl-unclean-shutdown \
	                downgrade-1.0 force-response-1.0
	        # MSIE 7 and newer should be able to use keepalive
	        BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
	</VirtualHost>
