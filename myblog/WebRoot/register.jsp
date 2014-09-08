<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的博客</title>
<link href="CSS/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {margin: 0px;}
a.f12white:link {font-size: 12px;color: #FFFFFF;text-decoration: none;}
a.f12white:visited {font-size: 12px;color: #FFFFFF;text-decoration: none;}
a.f12white:hover {font-size: 12px;color: #FFFFFF;text-decoration: none;}
a.f16white:link {font-size: 16px;color: #FFFFFF;text-decoration: none;}
a.f16white:visited {font-size: 16px;color: #FFFFFF;text-decoration: none;}
a.f16white:hover {font-size: 16px;color: #FFFFFF;text-decoration: none;}
.key {color: #202020;background-color: #E8E8E8;	height: 19px;	width: 170px;border: 1px solid #000000;}
</style>
<!-- 导入banner资源开始 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easySlider1.5.js"></script>
<script type="text/javascript" charset="utf-8">
// <![CDATA[
$(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});	
});
// ]]>
</script>
<style type="text/css">
.gallery { width:900px; height:306px; margin:0 auto; padding:0; }
#slider { margin:0; padding:0; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
#slider li { width:900px; height:306px; overflow:hidden; }
p#controls { margin:0; padding:0; position:relative; }
#prevBtn { display:block; margin:0; overflow:hidden; width:26px; height:32px; position:absolute; left: -30px; top:-150px; }
#nextBtn { display:block; margin:0; overflow:hidden; width:26px; height:32px; position:absolute; left: 910px; top:-150px; }
#prevBtn a { display:block; width:26px; height:32px; background:url(img/c_left.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:26px; height:32px; background:url(img/c_right.gif) no-repeat 0 0; }
</style>

</head>

<body>
<%@include file="header.jsp" %>
<!--正文开始-->
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="680" valign="top">



<table width="680" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
      <tr>
        <td height="350" align="center" bgcolor="#fcfcfc"><table width="500" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="500" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="10"><img src="images/topleft.gif" width="10" height="28" /></td>
                <td width="480" bgcolor="#ddddcc">注册新用户</td>
                <td width="10"><img src="images/topright.gif" width="10" height="28" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="500" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="1" bgcolor="#ddddcc">
				</td>
                <td width="498" height="250" align="center"><form id="form2" name="form2" method="post" action="doprocess/doregister.jsp">
                  <table width="250" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="100" height="30" align="right">用户名：</td>
                      <td><label>
                        <input name="loginId" type="text" class="inputTextW110H22" id="loginId" />
                      </label></td>
                    </tr>
                    
                    <tr>
                      <td height="30" align="right">密码：</td>
                      <td><input name="loginPwd" type="password" class="inputTextW110H22" id="loginPwd" /></td>
                    </tr>
                    <tr>
                      <td height="30" align="right">确认密码：</td>
                      <td><input name="loginPwd" type="password" class="inputTextW110H22" id="loginPwd1" /></td>
                    </tr>
                    <tr>
                      <td height="30" align="right">真实姓名：</td>
                      <td><input name="trueName" type="text" class="inputTextW110H22" id="trueName" /></td>
                    </tr>
                    <tr>
                      <td height="30" colspan="2" align="center"><label>
                        <input type="image" name="imageField2" src="images/reg.jpg" />
                      </label></td>
                    </tr>
                  </table>
                                </form>
                </td>
                <td width="1" bgcolor="#ddddcc">
				</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="5" bgcolor="#ddddcc">
			</td>
          </tr>
        </table></td>
      </tr>
      
    </table>



</td>
    <td>&nbsp;</td>
    <td width="200" valign="top">
	   <%@include file="right.jsp" %>
	  </td>
  </tr>
</table>
<!--正文结束-->
   <%@include file="footer.jsp" %>
</body>
</html>
