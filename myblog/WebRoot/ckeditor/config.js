/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
config.language = 'zh-cn';//设置中文语言  
    config.uiColor = '#AADC6E';//编辑器颜色  
    config.font_names = '宋体;楷体_GB2312;新宋体;黑体;隶书;幼圆;微软雅黑;Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana';  
    config.width =600;  
    config.height = 400; 
    config.toolbar_Full =  
    [  
       //设置工具栏
       //['Source','-','Preview','-','Templates'],  
       //['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],  
       //['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],  
       //['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],  
       //'/',  
       ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],  
       //['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],  
       //['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],  
       //['Link','Unlink','Anchor'],  
         ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],  
       //工具栏分组标志
       '/',  
       ['Styles','Format','Font','FontSize'],  
       //['TextColor','BGColor'],  
       //['Maximize', 'ShowBlocks','-','About']  
    ];  
    config.toolbar_Basic =  
    [  
        ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']  
    ];  
  

//上传文件按钮设置
//上传文件时浏览服务文件夹
config.filebrowserBrowseUrl = '/myblog/ckfinder/ckfinder.html'; 
//上传图片时浏览服务文件夹
config.filebrowserImageBrowseUrl = '/myblog/ckfinder/ckfinder.html?Type=Images'; 
//上传Flash时浏览服务文件夹  
config.filebrowserFlashBrowseUrl = '/myblog/ckfinder/ckfinder.html?Type=Flash';  
//上传文件按钮(标签)
config.filebrowserUploadUrl = '/myblog/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';  
//上传图片按钮(标签)
config.filebrowserImageUploadUrl = '/myblog/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images'; 
//上传Flash按钮(标签)
    config.filebrowserFlashUploadUrl = '/myblog/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'; 
};

