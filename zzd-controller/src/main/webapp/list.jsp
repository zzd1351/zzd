<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86183
  Date: 2020/8/7
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-3.5.0.js"></script>
</head>
<script type="text/javascript">
    function fenye(cpage){
        $("[name='cpage']").val(cpage);
        $("form").submit();
    }
    function toAdd(){
        location = "toAdd";
    }
    function del(id){
        $.ajax({
            url : "deleteMeet",
            data : {"id":id},
            dataType: "json",
            type: "post",
            success : function (obj){
                if (obj > 0){
                    alert("删除成功")
                    location = "list";
                }else {
                    alert("删除失败,请重新尝试")
                    location = "list";
                }
            }
        })
    }
    function toUpd(id){
        location = "toUpd?id=" + id;
    }
</script>
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
                $("[name='type']").val(${map.type})
            }
        })
    })
</script>
<body>
<form action="list" method="post">
    <input type="hidden" name="cpage">
    会议名称: <input type="text" name="name" value="${map.name}">
    会议类型: <select name="type" ><option value="0">请选择</option> </select><br>
    会议时间: <input type="date" name="startTime" value="${map.startTime}">--<input type="date" name="endTime" value="${map.endTime}"><br>
    <input type="submit" value="搜索" onclick="type()">
</form>
<input type="button" value="新增" onclick="toAdd()">
<table>
    <tr>
        <td>会议编号</td>
        <td>会议名称</td>
        <td>会议类型</td>
        <td>会议开始时间</td>
        <td>会议结束时间</td>
        <td>会议服务</td>
        <td>会议创建时间</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${list}" var="l">
        <tr>
            <td>${l.code}</td>
            <td>${l.types}</td>
            <td>${l.name}</td>
            <td>${l.startTime}</td>
            <td>${l.endTime}</td>
            <td>${l.server}</td>
            <td>${l.createTime}</td>
            <td>
                <input type="button" value="删除" onclick="del(${l.id})">
                <input type="button" value="修改" onclick="toUpd(${l.id})">
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="11">
            <input type="button" value="首页" onclick="fenye(1)">
            <input type="button" value="上一页" onclick="fenye(${pi.isIsFirstPage()?1:pi.getPrePage()})">
            <input type="button" value="下一页" onclick="fenye(${pi.isIsLastPage()?pi.getPages():pi.getNextPage()})">
            <input type="button" value="尾页" onclick="fenye(${pi.getPages()})">
        </td>
    </tr>
</table>
</body>
</html>
