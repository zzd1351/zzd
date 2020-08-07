<%--
  Created by IntelliJ IDEA.
  User: 86183
  Date: 2020/8/7
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-3.5.0.js"></script>
</head>
<script type="text/javascript">
    $(function (){
        $.ajax({
            async : false,
            url : "selectType",
            dataType : "json",
            type : "post",
            success : function (obj){
                for (let x in obj) {
                    $("[name='type']").append("<option value='" + obj[x].id + "'>" + obj[x].name + "</option>")
                }
            }
        })
        $.ajax({
            async : false,
            url : "selectServer",
            dataType: "json",
            type: "post",
            success : function (obj){
                for (let x in obj) {
                    $("[name='server']").append("<input type='checkbox' name='sid' value='" + obj[x].id + "'>" + obj[x].name)
                }
            }
        })
        $.ajax({
            async : false,
            url : "selectOne",
            data : {"id":${param.id}},
            dataType : "json",
            type : "post",
            success : function (obj){
                $("[name='code']").val(obj.code);
                $("[name='type']").val(obj.type);
                $("[name='name']").val(obj.name);
                $("[name='startTime']").val(obj.startTime);
                $("[name='endTime']").val(obj.endTime);
                for (let x in obj.sid) {
                    $("[name='sid'][value='" + obj.sid[x] + "']").prop("checked",true);
                }
            }
        })
    })
</script>
<body>
<form action="#">
    <input type="hidden" name="id" value="${param.id}">
    会议编号: <input type="text" name="code"><br>
    会议类型: <select name="type">
    <option value="0">请选择</option>
</select><br>
    会议名称: <input type="text" name="name"><br>
    会议时间: <input type="date" name="startTime">--<input type="date" name="endTime"><br>
    会议服务: <div name="server"></div><br>
    <input type="button" value="修改" onclick="update()">
</form>
</body>
<script type="text/javascript">
    function update(){
        $.ajax({
            url : "updateMeet",
            data: $("form").serialize(),
            dataType : "json",
            type : "post",
            success : function (obj){
                if (obj > 0){
                    alert("修改成功")
                    location = "list";
                }else {
                    alert("修改失败,请重新尝试")
                    location = "list";
                }
            }
        })
    }
</script>
</html>
