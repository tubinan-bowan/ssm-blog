<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>帖子发包</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <!-- 所有的 css & js 资源 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.13.0/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="../../statics/admin/static/sa.css">
    <script src="https://unpkg.com/vue@2.6.10/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui@2.13.0/lib/index.js"></script>
    <script src="https://unpkg.com/jquery@3.4.1/dist/jquery.min.js"></script>
    <script src="https://www.layuicdn.com/layer-v3.1.1/layer.js"></script>
    <script src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
    <script src="../../statics/admin/static/sa.js"></script>
    <style>

        /* wang富文本编辑器 */
        .editor-item{width: 100%; height: auto;}
        .editor-item .c-label{float: left;}
        .editor-item .editor-box{float: left; width: 80%; margin-top: 0px; margin-left: 0px;}
        .editor-item #editor{min-height: 300px; background-color: #FFF;}
        .editor-item .w-e-toolbar{padding-top: 5px !important;}
        /* 尽量小点 */
        .editor-item .editor-box{float: left; width: 700px;}
        .editor-item .editor-box img{max-width: 200px !important;}
    </style>
</head>
<body>
<!-- 防止margin向下击穿 -->
<div style="margin-top: -1em;"><br></div>
<div class="vue-box" style="display: none;" :style="'display: block;'">
    <!-- 参数栏 -->
    <div class="c-panel">
        <div class="c-title">文章编辑</div>
        <el-form size="mini" v-if="m">
            <el-form-item label="文章标题：">
                <el-input size="mini" v-model="m.title" style="width: 700px;" placeholder="例如：2002年的第一场雪"></el-input>
            </el-form-item>
            <el-form-item label="文章内容：" class="editor-item">
                <div class="editor-box">
                    <div id="editor"></div>
                </div>
            </el-form-item>
            <el-form-item label="是否公开：">
                <el-switch v-model="m.is_public" :active-value="1" :inactive-value="2"></el-switch>
                <span class="c-remark">关闭后，别人将不能看到你的发表</span>
            </el-form-item>
            <el-form-item label="&emsp;">
                <el-button type="primary" icon="el-icon-plus" size="mini" @click="ok">确定</el-button>
            </el-form-item>
            <div style="margin-top: 10px;"></div>
        </el-form>
    </div>

    <!-- 给wangEditor打一波广告 -->
    <div class="c-panel" style="background-color: rgba(0,0,0,0);">
        wangEditor：<el-link type="primary" href="http://www.wangeditor.com/" target="_blank">
        基于javascript和css开发的 Web富文本编辑器， 轻量、简洁、易用、开源免费
    </el-link>
    </div>
</div>
<script src="../../statics/admin/article/data-list.js"></script>
<script type="text/javascript">
    // 创建一个空的 m
    function create_m() {
        return {
            title: '江雪',
            content: '<p>千山鸟飞绝，万径人踪灭。</p><p>孤舟蓑笠翁，独钓寒江雪。</p>',
            is_public: 1
        }
    }
    // 创建编辑器
    function create_editor(content) {
        var E = window.wangEditor
        window.editor = new E('#editor');

        editor.customConfig.menus = [
            'head', 'fontSize', 'fontName', 'italic', 'underline', 'strikeThrough', 'foreColor', 'backColor', 'link', 'list',
            'justify', 'quote', 'emoticon', 'image', 'table', 'code', 'undo', 'redo' // 重复
        ]
        editor.customConfig.debug = true; // debug模式
        editor.customConfig.uploadFileName = 'file'; // 图片流name
        editor.customConfig.withCredentials = true; // 跨域携带cookie
        editor.customConfig.uploadImgShowBase64 = true   	// 使用 base64 保存图片
        editor.create(); // 创建
        editor.txt.html(content);	// 为编辑器赋值
        //监听编辑器内容的变化，变化之后重新赋值给content变量
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            content = html;
        }
    }
</script>
<script>
    var app = new Vue({
        el: '.vue-box',
        data: {
            id: 0,	// 从url中获取传值
            m: create_m(),
        },
        methods: {
            // 提交
            ok: function() {
                // 开始增加或修改
                if(this.id == 0) {
                    //新增
                    $.ajax({
                        url: "../../blogAdd", //请求的url地址
                        dataType: "json",   //返回格式为html
                        async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                        data: { "title": this.m.title, "content": window.editor.txt.html()},    //参数值
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

                } else {
                    sa.ajax2('/url/api', this.m, function(res){
                        sa.alert('修改成功', function(){
                            parent.app.f5();
                            sa.closeCurrIframe();
                        }.bind(this));
                    }.bind(this));
                }
            },
        },
        mounted: function() {
            // 如果是添加
            if(this.id == 0){
                create_editor(this.m.content);		// 创建富文本编辑器
            } else {
                // id 非 0 代表 是要修改
                mockData.data.forEach(function(item) {
                    if(item.id == this.id) {
                        this.m = item;
                    }
                }.bind(this));
                create_editor(this.m.content);		// 创建富文本编辑器
            }
        }
    })

</script>
</body>
</html>
