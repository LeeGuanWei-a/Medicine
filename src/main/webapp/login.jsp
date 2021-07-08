<%@ page language="java" contentType="text/html; charset=utf-8"
         import="java.util.Date"  pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta  charset="utf-8" />
    <title>登录页面</title>
    <style type="text/css">
        body{
            width:100%;
            height:100%;
            color: #fff;
        }

        h2{
            color: #fff;
            text-shadow:0 0 10px;
            letter-spacing: 1px;
            text-align: center;
        }
        #btn_submit{
            width: 200px;
            height: 45px;
            margin: 0px 4px;
            border-radius: 8px; /*圆角矩形*/
            text-indent: 5px; /*里面隐形的字体首行缩进*/
            margin: 5px auto;
        }
        table{
            text-align:center;
        }
        tr{
            align:center;
        }
        #table_div{
            width:800px;
            margin:0 auto;
            position: absolute;
            height:400px;
            left:20%;
            top:20%;
        }
        img{
            vertical-align: middle;
            position: relative;
        }
        input{
            width: 278px;
            height: 18px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            text-shadow:0.4px 0.4px 0.4px;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            text-indent: 10px; /*里面隐形的字体首行缩进*/
            margin: 10px auto;
        }
        .code{
            width: 170px;
            height: 18px;
            margin-bottom: 10px;
            outline: none;
            padding: 10px;
            font-size: 13px;
            text-shadow:0.4px 0.4px 0.4px;
            border-top: 1px solid #312E3D;
            border-left: 1px solid #312E3D;
            border-right: 1px solid #312E3D;
            border-bottom: 1px solid #56536A;
            border-radius: 4px;
            text-indent: 10px; /*里面隐形的字体首行缩进*/
            margin: 10px 10px;
        }
        #btn_submit{
            width: 300px;

            min-height: 20px;
            display: block;
            background-color: #4a77d4;
            border: 1px solid #3762bc;
            color: #fff;
            padding: 9px 14px;
            font-size: 15px;
            line-height: normal;
            border-radius: 5px;
            margin: 0 80px;
        }
    </style>
    <script type="text/javascript">
        //刷新验证码
        function refresh(){
            /* loginForm.imgValidate.src =encodeURI("/verificationCodeServlet?id="+new Date().getTime());	 */
            loginForm.imgValidate.src =encodeURI("code.jsp?id="+new Date().getTime());
        }

        function my(id){
            return document.getElementById(id);
        }

        function col1(){
            var inputs=	document.getElementsByName("account");//通常获取的是表单标签name
            if(inputs[0].value==''||inputs[0].value==' '){
                inputs[0].style.border="1px solid red";
            }else{
                inputs[0].style.border="1px solid black";
            }
        }
        function col2(){
            var inputs=	document.getElementsByName("password");//通常获取的是表单标签name
            if(inputs[0].value==''||inputs[0].value==' '){
                inputs[0].style.border="1px solid red";
            }else{
                inputs[0].style.border="1px solid black";
            }
        }
        /*
        function col3(){
            var inputs=	document.getElementsByName("code");//通常获取的是表单标签name
            if(inputs[0].value==''||inputs[0].value==' '){
                inputs[0].style.border="1px solid red";
            }else{
                inputs[0].style.border="1px solid black";
            }
        }

         */

    </script>
    <base href="<%=basePath%>">
</head>
<body bgcolor="#6495ed">
<form action="login" name="loginForm"  method="post">
    <div id="table_div">
        <table align="center">
            <tr>
                <td colspan="2"><h2>XX医院药品管理系统</h2></td>
            </tr>
            <tr>
                <td>账号：</td>
                <td><input type="text" name="account" placeholder="账号" onblur="col1()" required="required"/></td>
            </tr>
            <tr >
                <td>密码：</td>
                <td><input type="password" name="password" placeholder="密码" onblur="col2()" required="required"/></td>
            </tr>
            <tr >
                <!-- 添加验证码 -->
                <td>验证码：</td>
                <td vertical-align="middle">
                    <input class="code"  type="text" name="code" placeholder="验证码" onblur="col3()" required="required"/>
                    <img name="imgValidate"  src="<%=basePath%>/code.jsp"
                         alt="验证码"  onclick="refresh()" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><input id="btn_submit" type="submit" value="登录" />	<font color="red" >${msg}</font></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>