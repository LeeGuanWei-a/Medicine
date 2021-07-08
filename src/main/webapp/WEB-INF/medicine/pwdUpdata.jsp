<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加新图书</title>
    <link href="${basePath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${basePath}/js/jquery.min.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
    function checkPassword(){
        let password=document.getElementById("password").value;
        let password2=document.getElementById("password2").value;
        if(password==password2){
            return true;//返回baitrue提交du表zhi单
        }else{
            alert("两次密码不一致")
            return false;//返回false阻止dao提交表单
        }
    }
</script>
<body>
<form name="form1" action="editPwd" method="post" onsubmit="return checkPassword()">
    <table class="table  table-bordered">
        <tr>

            <td colspan="2" align="center"><h3>修改密码</h3></td>
        </tr>

        <tr>
            <td>旧密码</td>
            <td><input type="password" name="old_pwd" style="width:300px"  required="required"/></td>
        </tr>
        <tr>
            <td>新密码</td>
            <td><input type="password" name="password" id="password" style="width:300px" required="required"/></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input type="password" name="password2" id="password2"  style="width:300px" required="required"/></td>
        </tr>

        <tr>

            <td colspan="3" align="center">
                <input type="submit" value="添加" style="color: blue"/>&nbsp;   &nbsp;   &nbsp;   &nbsp;
                <input type = "button" value = "取消" onclick = "window.location.href = 'showAllBooksServlet'" style="color: #999999">
            </td>
        </tr>
    </table>

</form>
</body>
</html>