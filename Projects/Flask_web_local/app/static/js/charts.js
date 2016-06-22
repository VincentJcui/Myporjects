$(function () {
    $.getJSON('/idc/info/data/',function (data) {

    $('#container').highcharts({
        title: {
            text: '2016年IDC成本趋势',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: 烈焰畅游运维部',
            x: -20
        },
        xAxis: {
            categories: ['1月', '2月', '3月', '4月', '5月', '6月',
                '7月', '8月', '9月', '10月', '11月', '12月']
        },
        yAxis: {
            title: {
                text: '成本支出(元)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '元'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: data.all_data     /*直接读取后端返回的json*/
    });
        console.log(data.all_data)  //调试使用
    })
    
    $("td:contains('未结清')").css("color","red");
    
    
    
});
