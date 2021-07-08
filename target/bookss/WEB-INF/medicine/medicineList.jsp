<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <script type="text/javascript">
        function deleteMedicine(id) {
            window.location.reload = "deleteMedicineServlet?id=" + id;

        }
        function editMedicine() {
            $('form').submit();

        }
        function go() {
            var inputs=	document.getElementsByName("account");//通常获取的是表单标签name
            if(inputs[0].value==''||inputs[0].value==' '){
                window.location.href = "showAllMedicine"
            }else{
                window.location.href = "showSomeMedicine?word=" + inputs[0].value;

            }
        }
    </script>
    <style type="text/css">
        body{
            width:100%;
            heigth:100%;
            bgcolor:"#4A374A"
        }
        ul li{
            list-style: none;
        }
        .left{
            float:left;
        }
        .right{
            float:right;
        }
        .right2{
            float:right;
            margin:0 0 0 50px;
        }
    </style>
    <link href="${basePath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${basePath}/js/jquery.min.js"></script>
    <script src="${basePath}/js/bootstrap.min.js"></script>
</head>
<body>
<h2 align="center">药品管理</h2>

<div class="topMenu" style="background-color: #1b6d85">
    <ul>
        <li><a href="medicineAdd" class="left" ><img src="${basePath}/img/add.png"></a>
        <li><a class="right2" href="logout" name="">注销</a></li>
        <li><a class="right2" href="pwdUpdata" name="">更改密码</a></li>
        <li>
            <input  type="button" class="right" style="color: blue" name="js" value="搜索"  onclick="go()"/>
            <input type="text" class="right" name="account" placeholder="输入药品名称" onblur="col1()" required="required"/>
        </li>

    </ul>
</div>
<table class="table  table-bordered">
    <thead style="background-color: #66afe9">
    <tr>
        <th scope="col">药品编号</th>
        <th scope="col">药品名称</th>
        <th scope="col">价格</th>
        <th scope="col">生产商</th>
        <th scope="col">药品国标（YB）</th>
        <th scope="col">图片</th>
        <th scope="col">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${medicine}" var="medicine" varStatus="s">
        <form name='form' action='showAllMedicine'>
            <input type="hidden" name="id" value="${medicine.id}" />
            <tr>
                <th scope="row">${s.index+1 }</th>
                <td>${medicine.name }</td>
                <td>${medicine.price }</td>
                <td>${medicine.press }</td>
                <td>${medicine.YB }</td>
                <td><a href="download?filename=${URLEncoder.encode(medicine.pic,"utf-8")}" style="text-decoration:none">
                    <img src="<%=request.getContextPath() %>/upload/${medicine.pic}" alt="药品图片" width="100" height="100"/></a></td>
                <td><a href='showOneMedicine?id=${medicine.id}'><img src="${basePath}/img/edit.png"></a><a href='delMedicine?id=${medicine.id}' onClick="return confirm('确定删除?');"><img src="${basePath}/img/delete.png"></a></td>
            </tr>
        </form>
    </c:forEach>
    </tbody>
</table>
<!-- 添加分页链接 -->
<div align="center" width="50%">
    共${pageCount }页    当前是第${currentPageIndex }页&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="showAllMedicine?pageIndex=1">首页</a>
    <c:if test="${currentPageIndex!=1}">
        <a href="showAllMedicine?pageIndex=${currentPageIndex-1}">上一页</a>
    </c:if>

    <c:if test="${currentPageIndex!=pageCount}">
        <a href="showAllMedicine?pageIndex=${currentPageIndex+1}">下一页</a>
    </c:if>
    <a href="showAllMedicine?pageIndex=${pageCount}">尾页</a>
</div>


</body>
</html>