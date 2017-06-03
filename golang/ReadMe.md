2017年6月3日  开始学习golang语言
以下为学习过程整理的相关笔记

go特点：
    静态编译
    垃圾回收
    简洁的符号和语法
    平坦的类型系统
    基于CSP的并发模型
    高效简单的工具链
    丰富的标准库

go语言的应用：
    Docker，火热的容器化技术
    Kubernets，Goole Borg的开源实现
    Etcd，类似Zookeeper的高可用key-value存储

运行和编译
    go run hellO.go
    go build hello.go
    ./hello
    file hello #可以使用file命令查看该文件隶属于的系统

    linux下编译：
    编译成linux版本：GOOS=linux go build hello.go   生成hello
    编译成windows版本：GOOS=windows go build hello.go   生成hello.exe
    编译成mac版本：GOOS=darwin go build hello.go   生成hello.mac

    windows下编译
    set GOOS=windows

缩进问题
    gofmt -w hello.go   自动缩进
    goimports -w hello.go  自动引入包


