<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

},<!DOCTYPE html>
<html>
<head>
    <title>用户列表</title>
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
    <div class="c-panel">
        <!-- 参数栏 -->
        <div class="c-title">用户列表</div>
        <el-form :inline="true" size="mini">
            <el-form-item label="用户昵称：">
                <el-input v-model="p.username" placeholder="模糊查询"></el-input>
            </el-form-item>
            <el-form-item label="注册日期：">
                <el-date-picker v-model="p.start_time" type="date" value-format="yyyy-MM-dd" placeholder="开始日期"></el-date-picker> -
                <el-date-picker v-model="p.end_time" type="date" value-format="yyyy-MM-dd" placeholder="结束日期"></el-date-picker>
            </el-form-item>
            <el-form-item style="min-width: 0px;">
                <el-button type="primary" icon="el-icon-search" @click="p.pageNo = 1; f5()">查询</el-button>
            </el-form-item>
            <br />
            <el-form-item label="综合排序：" class="s-radio-text">
                <el-radio-group v-model="p.sort_type">
                    <el-radio :label="1">注册时间</el-radio>
                    <el-radio :label="2">最近登录</el-radio>
                    <el-radio :label="3">登陆次数</el-radio>
                    <el-radio :label="4">最近签到</el-radio>
                    <el-radio :label="5">签到次数</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-form>
        <!-- <div class="c-title">数据列表</div> -->
        <el-table :data="dataList" size="mini">
            <el-table-column label="编号" prop="id" width="70px" > </el-table-column>
            <el-table-column label="昵称" prop="name" width="200px"></el-table-column>
            <el-table-column label="性别" prop="sex"> </el-table-column>
            <el-table-column label="密码" prop="password"></el-table-column>
            <el-table-column label="注册于" prop="create_time"></el-table-column>
            <el-table-column prop="address" label="操作">
                <template slot-scope="s">
                    <el-button class="c-btn" type="success"  icon="el-icon-view" @click="get(s.row)">详情</el-button>
                    <el-button class="c-btn" type="danger" icon="el-icon-delete" @click="del(s.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
    <!-- 给layer打一波广告 -->
    <div class="c-panel" style="background-color: rgba(0,0,0,0);">
        layer：<el-link type="primary" href="http://layer.layui.com/" target="_blank">
        一个可以让你想到即可做到的JavaScript弹窗（层）解决方案
    </el-link>
    </div>
</div>
<script src="../../statics/admin/user/data-list.js"></script>
<script type="text/javascript">
    var app = new Vue({
        el: '.vue-box',
        data: {
            p: {	// 查询参数
                username: '',
                create_type: 0,
                sort_type: 1,
                start_time: new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-1',	// 本月一号
                end_time: new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate(),	// 本月当日
                pageNo: 1,
                pageSize: 10,
            },
            dataCount: 1422,
            dataList: []
        },
            methods: {
                // 数据刷新
                f5: function() {
                    var that = this
                    $.ajax({
                        url: "../../userList", //请求的url地址
                        dataType: "json",   //返回格式为html
                        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                        data: {},    //参数值
                        type: "POST",   //请求方式
                        beforeSend: function() {  //请求前的处理

                        },
                        success: function(req) {   //请求成功时处理
                            that.dataList = req.data
                        },
                        complete: function() {   //请求完成的处理

                        },
                        error: function() {   //请求出错处理
                            alert("请求失败")
                        }
                    });
                },
                // 删除
                del: function(data) {
                    sa.confirm('是否删除，此操作不可撤销', function() {
                        $.ajax({
                            url: "../../userList", //请求的url地址
                            dataType: "json",   //返回格式为html
                            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                            data: {"id": data.id},    //参数值
                            type: "GET",   //请求方式
                            beforeSend: function() {  //请求前的处理

                            },
                            success: function(req) {   //请求成功时处理
                                sa.ok('删除成功');
                            },
                            complete: function() {   //请求完成的处理

                            },
                            error: function() {   //请求出错处理
                                alert("请求失败")
                            }
                        });
                    }.bind(this));
                },
                // 查看
                get: function(data) {
                    var str = '<div>';
                    str += '<p>编号：' + data.id + '</p>';
                    str += '<p>昵称：' + data.username + '</p>';
                    str += '<p>性别：' + data.sex + '</p>';
                    str += '<p>当前状态：<b>' + (data.status == 1 ? '正常' : '禁用') + '</b></p>';
                    str += '<p>注册方式：' + data.create_type + '</p>';
                    str += '<p>注册时间：' + data.create_time + '</p>';
                    str += '</div>';
                    sa.alert(str);
                }
            },
            created: function(){
                this.f5()
            }
        })

</script>
</body>
</html>

