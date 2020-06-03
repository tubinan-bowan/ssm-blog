<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>主页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.13.0/lib/theme-chalk/index.css">
    <style type="text/css">
        * {padding: 0;margin: 0;}
        body {background-color: #EEE;font-size: 14px;}
        .app {
            font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
        }
        .content-box {margin: 1em;padding: 1em;background-color: #FFF;color: #666;}
        .el-tag{border-radius: 1px;}
        /*800之下*/
        @media(max-width: 800px) {
            .kapian {
                width: 100% !important;
                margin-right: 0px !important;
            }
            .saoma {
                display: none;
            }
        }
        /* markdown格式 */
        .md-contetn{padding-left: 1.5em; line-height: 26px;}
        /* 多个ul时，切换那个啥 */
        .md-contetn h4{margin-left: -0.5em;}
        .md-contetn ul,.md-contetn ol{padding-left: 1em;}
    </style>
</head>
<body>
<div class="app">
    <div class="content-box">
        <div style="padding: 1em; border-left: 5px #2D8CF0 solid; background-color: #EEE;">
            <big><big>Welcome to study 博客后台 </big></big>
            <span style="display: inline-block; margin-left: 1em; color: #888;"> —— 一个多窗口后台，流畅、易上手、提高生产力</span>
        </div>
    </div>
    <div class="content-box">
        <div class="saoma" style="width: 20%; float: left; margin-right: 4%;">
            <el-divider content-position="left">
                <big><big>扫码加入QQ群交流</big></big>
            </el-divider>
            <div style="text-align: left;">
                <img src="http://dev33-yxzj.oss-cn-beijing.aliyuncs.com/dyc/img/2020/01/17/157924554064970545739.png" style="width: 60%; margin-left: 10%;">
            </div>
        </div>
        <div class="kapian" style="width: 35%; float: left; margin-right: 4%;">
            <el-divider content-position="left">
                <big><big>SA-ADMIN</big></big>
            </el-divider>
            <!-- <ul style="margin-bottom: 1em;">
                <li>上手简单：提供完整彻底的封装，不用修改一行源代码即可轻松集成</li>
                <li>示例全面：提供大量常见增删改查示例，提高你的生产力</li>
            </ul> -->
            <div>
                <p>
                    虽然已经用过不少优秀的后台模板，但是一直都感觉不尽完美，于是在经过激烈的思想斗争后，我决定牺牲五一假期，亲自做一个尝试一下，
                    一来正好给以后自己的项目中使用，二来也算是为开源界做一点自己的贡献吧
                </p>
                <br>
                <ul style="padding-left: 1em; line-height: 1.5em;">
                    <li>
                        <b>QQ群：</b>
                        <el-link type="primary" href="https://jq.qq.com/?_wv=1027&k=5DHN5Ib" target="_blank">782974737 点击加入</el-link>
                    </li>
                    <li>
                        <b>码云地址：</b>
                        <el-link type="primary" href="https://gitee.com/sz6/sa-admin" target="_blank">https://gitee.com/sz6/sa-admin</el-link>
                    </li>
                    <li>
                        <b>GitHub地址：</b>
                        <el-link type="primary" href="https://github.com/click33/sa-admin" target="_blank">https://github.com/click33/sa-admin</el-link>
                    </li>
                    <li>
                        <b>新增在线论坛：</b>
                        <el-link type="primary" href="javascript:parent.sa_admin.showMenuById('1-11');">点击打开，在线快速提交意见反馈(新)</el-link>
                    </li>
                    <li>
                        <b>开源不易，求鼓励，给个star吧</b>
                    </li>
                </ul>
                <br>
            </div>

        </div>
        <div class="kapian" style="width: 35%; float: left;">
            <el-divider content-position="left">
                <big><big>技术选型</big></big>
            </el-divider>
            <ul style="padding-left: 1em; line-height: 1.5em;">
                <li><el-link type="primary" href="https://cn.vuejs.org/" target="_blank">JS引擎：Vue @2.6.10</el-link></li>
                <li><el-link type="primary" href="https://element.eleme.cn/#/zh-CN" target="_blank">UI框架：Element-UI @2.13.0</el-link></li>
                <li><el-link type="primary" href="http://layer.layui.com/" target="_blank">web弹层：layer @3.1.1</el-link></li>
                <li><el-link type="primary" href="https://www.swiper.com.cn/" target="_blank">切页动画：Swiper @4.5.0</el-link></li>
                <li><el-link type="primary" href="https://echarts.baidu.com/" target="_blank">图表引擎：ECharts @4.2.1</el-link></li>
                <li><el-link type="primary" href="http://www.wangeditor.com/" target="_blank">富文本编辑器：wangEditor @3.1.1</el-link></li>
                <li><el-link @click="meile">没了：占空</el-link></li>
                <li>以上几个框架即使你都没接触过，只要你阅读以下文档，也可以快速上手</li>
            </ul>
        </div>
        <div style="clear: both;"></div>
    </div>

</div>


<script src="https://unpkg.com/vue@2.6.10/dist/vue.js"></script>
<script type="text/javascript">Vue.config.productionTip = false;</script>
<script src="https://unpkg.com/element-ui@2.13.0/lib/index.js"></script>
<script src="https://unpkg.com/marked@0.8.0/marked.min.js"></script>
<script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js"></script>
<script type="text/javascript">
    new Vue({
        el: '.app',
        data: {

        },
        methods: {
            // 没了
            meile: function() {
                this.$message({
                    message: '没了还点',
                    type: 'warning'
                });
            },
            // 显示文档页面
            openDoc: function() {
                parent.sp.selectMenu(11);
            }

        }
    })

    //
    $('.md-contetn').each(function() {
        var html = marked($(this).html());
        $(this).html(html);
    })

</script>
</body>
</html>
