<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>登录注册页面</title>
    <link rel="stylesheet" href="statics/css/style.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
</head>

<body>
<script type="text/javascript">
    function register() {
        //js中通过元素的id获取对应元素输入框中的值
        var name = document.getElementById("rname").value;
        var password = document.getElementById("rpassword").value;
        console.log(name);
        console.log(password);
        //发起Ajax请求
        $.ajax({
            url: "register", //请求的url地址
            dataType: "json",   //返回格式为html
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: { "name": name, "password": password},    //参数值
            type: "POST",   //请求方式
            // contentType:"application/json",//请求格式
            beforeSend: function() {  //请求前的处理

            },
            success: function(req) {   //请求成功时处理
               if (req.code == 0){
                   alert("注册成功 ，请重新登陆")
                   window.location.reload(true);//强制刷新当前页面
                   console.log("强制刷新了")
               }else{
                   alert(req.msg)
               }
            },
            complete: function() {   //请求完成的处理

            },
            error: function() {   //请求出错处理
            }
        });
    }
    function login() {
        //js中通过元素的id获取对应元素输入框中的值
        var name = document.getElementById("lname").value;
        var password = document.getElementById("lpassword").value;
        console.log(name);
        console.log(password);
        //发起Ajax请求
        $.ajax({
            url: "login", //请求的url地址
            dataType: "json",   //返回格式为html
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: { "name": name, "password": password},    //参数值
            type: "POST",   //请求方式
            beforeSend: function() {  //请求前的处理

            },
            success: function(req) {   //请求成功时处理
                if (req.code == 0){
                    alert("登录成功了")
                    location.href = "admin"
                }else{
                    alert(req.msg)
                }
            },
            complete: function() {   //请求完成的处理

            },
            error: function() {   //请求出错处理
                alert("请求失败")
            }
        });
    }
</script>
<div class="content">
    <div class="form sign-in">
        <h2>欢迎回来</h2>
        <label>
            <span>用户名</span>
            <input id="lname" type="email" />
        </label>
        <label>
            <span>密码</span>
            <input id="lpassword" type="password" />
        </label>
        <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
        <button type="button" class="submit" onclick="login()">登 录</button>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>还未注册？</h2>
                <p>立即注册，发现大量机会！</p>
            </div>
            <div class="img__text m--in">
                <h2>已有帐号？</h2>
                <p>有帐号就登录吧，好久不见了！</p>
            </div>
            <div class="img__btn">
                <span class="m--up">注 册</span>
                <span class="m--in">登 录</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>立即注册</h2>
            <label>
                <span>用户名</span>
                <input id="rname" type="text" />
            </label>
            <label>
                <span>密码</span>
                <input id="rpassword" type="password" />
            </label>
            <button type="button" class="submit" onclick="register()">注 册</button>
        </div>
    </div>
</div>

<script src="statics/js/script.js"></script>
</body>

</html>