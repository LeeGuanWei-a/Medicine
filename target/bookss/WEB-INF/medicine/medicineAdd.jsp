<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加药品</title>
    <link href="${basePath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${basePath}/js/jquery.min.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

    function col1(){
        var inputs=	document.getElementsByName("name");//通常获取的是表单标签name
        if(inputs[0].value==''||inputs[0].value==' '){
            inputs[0].style.border="1px solid red";
        }else{
            inputs[0].style.border="1px solid black";
        }
    }
    function col2(){
        var inputs=	document.getElementsByName("author");//通常获取的是表单标签name
        if(inputs[0].value==''||inputs[0].value==' '){
            inputs[0].style.border="1px solid red";
        }else{
            inputs[0].style.border="1px solid black";
        }
    }
    function col3(){
        var inputs=	document.getElementsByName("price");//通常获取的是表单标签name
        if(inputs[0].value==''||inputs[0].value==' '){
            inputs[0].style.border="1px solid red";
        }else{
            inputs[0].style.border="1px solid black";
        }
    }
    function col4(){
        var inputs=	document.getElementsByName("press");//通常获取的是表单标签name
        if(inputs[0].value==''||inputs[0].value==' '){
            inputs[0].style.border="1px solid red";
        }else{
            inputs[0].style.border="1px solid black";
        }
    }
    function col5(){
        var inputs=	document.getElementsByName("ISBN");//通常获取的是表单标签name
        if(inputs[0].value==''||inputs[0].value==' '){
            inputs[0].style.border="1px solid red";
        }else{
            inputs[0].style.border="1px solid black";
        }
    }
</script>
<body>
<form name="form1" action="addMedicine" enctype="multipart/form-data" method="post">
    <table class="table  table-bordered">
        <tr>
            <td colspan="2" align="center"><h3>添加新药品</h3></td>
        </tr>

        <tr>
            <td>药品名称</td>
            <td><input type="text" name="name"  onblur="col1()"  required="required"/></td>
        </tr>
        <tr>
            <td>价格</td>
            <td><input type="text" name="price"  onblur="col3()" required="required"/></td>
        </tr>
        <tr>
            <td>生产商</td>
            <td><input type="text" name="press"  onblur="col4()" required="required"/></td>
        </tr>
        <tr>
            <td>药品国标（YB）</td>
            <td><input type="text" name="YB"  onblur="col4()" required="required"/></td>
        </tr>
        <tr>
            <td>图片</td>
            <td>
                <input type="file" name="file"  accept="image/*"  required="required"/>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center"><input type="submit" value="添加"  style="color: blue"/>&nbsp;   &nbsp;   &nbsp;   &nbsp;
                <input type="reset" value="清空" style="color: #999999"/></td>
        </tr>
    </table>

</form>
</body>
</html>