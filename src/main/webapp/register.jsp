<%--
  Created by IntelliJ IDEA.
  User: Eleven
  Date: 2020/6/28
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <link type="text/css" rel="stylesheet" href="css/register.css">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/decorate.css">
    <link rel="stylesheet" href="css/Shuffling_figure.css">
    <link rel="stylesheet" href="css/Mouse_hover.css">
    <link rel="stylesheet" href="css/share.css">

    <style type="text/css">
        .tab2{
            width:100%;
            padding-top:100px;
            color:#000;
        }
        .i1{
            box-sizing: border-box;
            text-align:center;
            font-size:14px;
            height:2.7em;
            border-radius:4px;
            border:1px solid #c8cccf;
            color:#6a6f77;
            -web-kit-appearance:none;
            -moz-appearance: none;
            display:block;
            outline:0;
            padding:0 1em;
            text-decoration:none;
            width:220px;
            height:30px;
        }
        .i1:focus{
            border:1px solid #ff7496;
        }

        .bb1{ /* 按钮美化 */
            width: 110px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background:#06D725; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 12px; /* 字体大小 */

        }
        .bb1:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
        }

    </style>
    <script type="text/javascript" >
        //onblur失去焦点事件，用户离开输入框时执行 JavaScript 代码：
        //函数1：验证邮箱格式
        function validate_username(username){
            //定义正则表达式的变量:邮箱正则
            var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            //console.log(username);
            if(username !="" && username.search(emailReg) != -1)
            {
                document.getElementById("test_user").innerHTML = "<font color='green' size='3px'>√邮箱格式正确</font>";
            }else{
                document.getElementById("test_user").innerHTML = "<font color='red' size='3px'>邮箱格式错误</font>";
            }
        }

        //函数2：验证密码是否符合要求：匹配6位密码，由数字和字母组成：
        function validate_password(password){
            //^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6-10}$
            //测试密码：12345y
            var passwordReg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6}$/;
            if(password != "" && password.search(passwordReg) != -1)
            {
                document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>√密码格式正确</font>";
            }else{
                document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>密码格式错误</font>";
                alert("密码有6位，由数字和字母组成!");
            }
        }

        //函数3：验证两次输入的密码是否一样
        function validate_password2(password2){
            var password = document.getElementById("password").value;
            //测试：console.log(password);
            //测试：console.log(password2);
            if (password == ""){
                document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>密码不为空</font>";
            }else if(password==password2){
                document.getElementById("is_test_pw").innerHTML = "<font color='green' size='3px'>√两次输入的密码相同</font>";
            }else{
                document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>两次输入的密码不相同</font>";
                console.log("密码有6位，由数字和字母组成!");
            }
        }

        //函数4：验证表单是否已经填好
        function validate_form(){
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            //console.log("表单填写正确，可以正常提交！");

            //这三个，如果任何一个有问题，都返回false
            //18128@qq.com		12345y
            var emailReg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            var passwordReg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6}$/;

            if(username != "" && emailReg.test(username)){
                if(password !="" && passwordReg.test(password)){
                    if(password2==password){
                        alert("信息填写正确，可以正常提交！");
                        console.log("信息填写正确，可以正常提交！");
                        return true;
                    }else{
                        alert("密码不一致，提交失败，请重新填写！");
                        console.log("密码不一致，提交失败，请重新填写！");
                        return false;
                    }
                }else{
                    alert("密码格式错误，提交失败，请重新填写！");
                    console.log("密码格式错误，提交失败，请重新填写！");
                    return false;
                }
            }else{
                alert("注册的账号不符合要求，提交失败，请重新填写！");
                console.log("注册的账号不符合要求，提交失败，请重新填写！");
                return false;
            }
        }
    </script>

</head>
<body>
<div  id="box1">
    <div class="nav">
        <ul class="navbar">
            <li  ><a href="index.html" class="fc" >首页</a></li>
            <li  ><a href="" class="fc">全部课程</a>		</li>
            <li  ><a href="" class="fc">Unity</a>
                <ul>
                    <li ><a href=""  class="ec">Unity全部课程</a></li>
                    <li ><a href="" class="ec">Unity A计划(永久)</a></li>
                    <li><a href=""  class="ec">Unity B计划(一年)</a></li>
                </ul>
            </li>
            <li  ><a href=" " class="fc">虚幻</a>
                <ul>
                    <li ><a href="" class="ec">虚幻全部课程</a></li>
                    <li ><a href="" class="ec">虚幻 A计划(永久)</a></li>
                    <li ><a href="" class="ec">虚幻 B计划(一年)</a></li>

                </ul>
            </li>
            <li  ><a href="" class="fc">Java</a>
                <ul>

                    <li><a href=""  class="ec">JavaEE全部课程</a></li>
                    <li ><a href="" class="ec">JavaEE A计划(永久)</a></li>
                    <li ><a href="" class="ec">JavaEE 学习计划</a></li>

                </ul>
            </li>
            <li ><a href="" class="fc" > • • • </a>
                <ul>
                    <li ><a href="" class="ec">关于我们</a></li>
                    <li ><a href="Snake.html" class="ec">点我看看</a></li>
                    <li ><a href="Test.html" class="ec">这里有份小测验</a></li>
                </ul>
            </li>
        </ul>


    </div>
</div>


<div class="tab2">

    <form  class="f1" action="UserRegister" method="post" name="form" >
        <table width="500px" height="400px"    cellpadding="0" cellspacing="0" style="background-color:#90EE90; border-radius:5px; border: 1px solid #06D725">
            <tr align="center"><td colspan="3">用户注册</td></tr>
            <tr>
                <td>请输入账号：</td>
                <td><input  class="i1" type="text" id="username" name="username" placeholder="只能用邮箱注册" onblur="validate_username(this.value)"/></td>
                <td id="test_user"></td>
            </tr>
            <tr>
                <td>请输入密码：</td>
                <td><input class="i1" type="password" id="password" name="password" placeholder="6位密码由数字和字母组成" onblur="validate_password(this.value)"/></td>
                <td id="test_pw"></td>
            </tr>
            <tr>
                <td>请确认密码：</td>
                <td><input class="i1" type="password" id="password2" name="password2" onblur="validate_password2(this.value)" /></td>
                <td id="is_test_pw"></td>
            </tr>
            <tr>
                <td></td>
                <td ><input  class="bb1" type="submit" id="submit_form" value="注册" onclick="return validate_form()"/>
                    <input  class="bb1" type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="box5">
    <div  align="center" style=" padding-top:35px;">
        <img src="image/123.png"  paading-left="100px">
    </div>
</div>
<div id="box6">
    <table class="toi" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>这</td>
            <td>是</td>
            <td>一</td>
            <td>个</td>
            <td>调</td>
        </tr>
        <tr>
            <td>皮</td>
            <td>的</td>
            <td>网</td>
            <td>站</td>
            <td>嘻嘻</td>
        </tr>
    </table>
    <div class="tou">
        <img  src="image/siki.png" ></br></br>
        <a  class="a2" href=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  src="image/wb.png" width="50" height="50"></a>
        <a  class="a2" href="">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  src="image/wx.png" width="50" height="50"></a>
    </div>
</div>
<div id="box7">
    <table width="500" class="toq" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center" width="500px"><a class="a3"  href="readme.html" title="read me">Web实训<br></a>
            <td rowspan="2"><a  class="a2" href=""> <img  src="image/yx.png" width="50" height="50"></td>
        </tr>
        <tr>
            <td align="center"><a class="a3" href="resume.html"  title="resume">沈国藤-20172203003-软工1702</a></td>
        </tr>
    </table>



</div>
<div class="divu"><a href="" title="联系我"> <img src="image/QQ.jpg" width="60px" height="60px;"  style="position:inherit; margin-top:-15px; margin-left:-15px"></a> </div>

</body>
</html>
