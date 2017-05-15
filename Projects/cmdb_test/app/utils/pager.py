# encoding:utf-8
# 后端分页工具
# 统一接口
# by 2017-05-15




class Pager(object):
    def __init__(self, current_page, avg_page):
        self.current_page = int(current_page)
        self.avg_page = int(avg_page)

    # 本身只是类方法,通过装饰器property把方法伪造成属性,
    @property
    def start_page(self):
        return (self.current_page - 1) * self.avg_page

    @property
    def end_page(self):
        return self.current_page * self.avg_page

    def page_str(self, all_items, base_url):
        all_page, div = divmod(all_items, self.avg_page)  # 通过divmod来计算需要分多少页
        if div > 0:
            all_page += 1  # 如果div大于0,及divmod计算结果有余数,表示剩余的数据还需再添加一页来展示
        page_list = []  # 定义页面只能显示页面数量,这里先定义个空的list
        if all_page <= 11:
            start = 1
            end = all_page
        else:
            if self.current_page <= 6:
                start = 1
                end = 11 + 1
            else:
                start = self.current_page - 5
                end = self.current_page + 6
                if self.current_page + 6 > all_page:
                    start = all_page - 10
                    end = all_page + 1
        for i in range(start, end):
            # 判断是否为当前页
            if i == self.current_page:
                # page_temp = '<a style="color:red;font-size:16px;padding: 5px" href="%s?page=%d">%d</a>' % (base_url,i,i)
                page_temp = '<li> <a href="%s?page=%d" class="label label-success">%d</a> </li>' % (base_url, i, i)
            else:
                # page_temp = '<a style="padding: 5px" href="%s?page=%d">%d</a>' % (base_url,i,i)
                page_temp = '<li> <a href="%s?page=%d">%d</a> </li>' % (base_url, i, i)
            # 将标签页凭借展示给前端
            page_list.append(page_temp)

        # 上一页
        if self.current_page > 1:
            up_page = '<li> <a href="%s?page=%d">上一页</a> </li>' % (base_url, self.current_page - 1)
        else:
            up_page = '<li class="disabled"> <a href="javascript:void(0);">上一页</a> </li>'
        # 下一页
        if self.current_page >= all_page:
            next_page = '<li class="disabled"> <a href="javascript:void(0);">下一页</a> </li>'
        else:
            next_page = '<li> <a href="%s?page=%d">下一页</a> </li>' % (base_url, self.current_page + 1)

        page_list.insert(0, up_page)
        page_list.append(next_page)

        return ''.join(page_list)
