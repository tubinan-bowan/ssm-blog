<%--
  Created by IntelliJ IDEA.
  User: 17672
  Date: 2020/2/29
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户添加</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <!-- 所有的 css & js 资源 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.13.0/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="../../statics/admin/static/sa.css">
    <script src="https://unpkg.com/vue@2.6.10/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui@2.13.0/lib/index.js"></script>
    <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js"></script>
    <script src="https://www.layuicdn.com/layer-v3.1.1/layer.js"></script>
    <script src="../../statics/admin/static/sa.js"></script>
</head>
<body>
<!-- 防止margin向下击穿 -->
<div style="margin-top: -1em;"><br></div>
<div class="vue-box" style="display: none;" :style="'display: block;'">
    <!-- 参数栏 -->
    <div class="c-panel">
        <div class="c-title">用户添加</div>
        <el-form size="mini" v-if="m">
            <el-form-item label="昵称：">
                <el-input v-model="m.name"></el-input>
            </el-form-item>
            <el-form-item label="密码：">
                <el-input v-model="m.password"></el-input>
            </el-form-item>
            <%--<el-form-item label="手机：">
                <el-input v-model="m.phone"></el-input>
            </el-form-item>--%>
<%--            <el-form-item label="角色：">--%>
<%--                <el-select v-model="m.role_id">--%>
<%--                    <el-option label="管理员" :value="1"></el-option>--%>
<%--                    <el-option label="公告管理员" :value="2"></el-option>--%>
<%--                    <el-option label="普通用户" :value="3"></el-option>--%>
<%--                </el-select>--%>
<%--            </el-form-item>--%>
            <el-form-item label="性别：">
                <el-radio-group v-model="m.sex" size="mini">
                    <el-radio :label="1">男</el-radio>
                    <el-radio :label="2">女</el-radio>
                </el-radio-group>
            </el-form-item>
            <el-form-item label="&emsp;">
                <el-button type="primary" icon="el-icon-plus" size="mini" @click="ok">确定</el-button>
            </el-form-item>
        </el-form>
    </div>
</div>
<script type="text/javascript">
    new Vue({
        el: '.vue-box',
        data: {
            m: {	// 查询参数
                username: '',
                password: '',
                phone: '',
                sex: 1,
            }
        },
        methods: {
            // ok
            ok: function() {
                $.ajax({
                    url: "../../userAdd", //请求的url地址
                    dataType: "json",   //返回格式为html
                    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                    data: { "name": this.m.name, "password": this.m.password, "sex": this.m.sex},    //参数值
                    type: "POST",   //请求方式
                    beforeSend: function() {  //请求前的处理

                    },
                    success: function(req) {   //请求成功时处理
                        alert(req.msg)
                    },
                    complete: function() {   //请求完成的处理

                    },
                    error: function() {   //请求出错处理
                        alert("请求失败")
                    }
                });
            }
        }
    })
</script>
</body>
</html>

