dataTables排序问题

1.禁止排序

    'ordering'  :false

    例：$('#id').DataTable({

               'ordering':false,

　　　 })

2.规定某一列排序

　　order的属性值有两个，asc为升序，desc为降序

    'order' : [7,'desc']    //与数组下标一样，第一列从0开始，表格初始化时，第八列默认降序

   例：

　　　　$('#example').dataTable( {
       "order": [[ 3, "desc" ]]
    } );
    
3.规定某列不排序
　　columnDefs:[{
　　　　'targets' : [0,1,2,3,4,7,8],    //除第六，第七两列外，都默认不排序
　　　　'orderable' : false
　　}]

补充：

$('#example').dataTable( {
 
    columnDefs: [ {
      targets: [ 0 ],
      orderData: [ 0, 1 ]  //如果第一列进行排序，有相同数据则按照第二列顺序排列
    }, {
      targets: [ 1 ],
      orderData: [ 1, 0 ]  //如果第二列进行排序，有相同数据则按照第一列顺序排列
    }, {
      targets: [ 4 ],
      orderData: [ 4, 0 ]  //如果第五列进行排序，有相同数据则按照第一列顺序排列
    } ]
  } );