<%--
  Created by IntelliJ IDEA.
  User: 86183
  Date: 2020/8/7
  Time: 9:58
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
            url : "selectServer",
            dataType: "json",
            type: "post",
            success : function (obj){
                for (let x in obj) {
                    $("[name='server']").append("<input type='checkbox' name='sid' value='" + obj[x].id + "'>" + obj[x].name)
                }
            }
        })
    })
</script>
<body>
<form action="insertMeet" method="post">
    会议编号: <input type="text" name="code"><br>
    会议类型: <select name="type">
                <option value="0">请选择</option>
            </select><br>
    会议名称: <input type="text" name="name"><br>
    会议时间: <input type="date" name="startTime">--<input type="date" name="endTime"><br>
    会议服务: <div name="server"></div><br>
    <input type="submit" value="添加">
</form>
</body>
</html>
