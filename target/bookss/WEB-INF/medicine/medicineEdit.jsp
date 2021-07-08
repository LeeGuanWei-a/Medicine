<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改药品</title>
    <link href="${basePath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${basePath}/js/jquery.min.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
</head>
<body>
<form name="form1" action="editMedicine" enctype="multipart/form-data" method="post">
    <input type="hidden" name="id" value="${medicine.id}" />
    <table class="table  table-bordered">
        <tr>

            <td colspan="2" align="center" style="color: #1b6d85"><h3>修改药品</h3></td>
        </tr>

        <tr>
            <td style="color: #66afe9">药品名称</td>
            <td><input type="text" name="name" style="width:300px"  value="${medicine.name}"/></td>
        </tr>
        <tr>
            <td style="color: #66afe9">价格</td>
            <td><input type="text" name="author"  style="width:300px" value="${medicine.author}"/></td>
        </tr>
        <tr>
            <td style="color: #66afe9">生产商</td>
            <td><input type="text" name="price" style="width:300px"  value="${medicine.price}"/></td>
        </tr>
        <tr>
            <td style="color: #66afe9">药品国标（YB）</td>
            <td><input type="text" name="press"  style="width:300px" value="${medicine.press}"/></td>
        </tr>

        <tr>

            <td colspan="3" align="center">
                <input type="submit" value="添加" style="color: blue"/>&nbsp;   &nbsp;   &nbsp;   &nbsp;
                <input type = "button" value = "取消" onclick = "window.location.href = '/medicineList'" style="color: #999999">
            </td>
        </tr>
    </table>

</form>
</body>
</html>