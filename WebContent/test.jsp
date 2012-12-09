<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" session ="false"%>

<!DOCTYPE HTML>
<html lang="ko">
<!--head_start-->
<head>
	<meta charset="utf-8">
	<title>TEST main</title>
	<meta name="title" content="Nodus">
	<meta name="author" content="박소현" />
	<meta name="keywords" content="mindmap" />
	<meta name="description" content="" />

	<!--기본CSS-->
	<link rel="stylesheet" type="text/css" href="./basic.css"/>
	<link rel="stylesheet" type="text/css" href="./user_style.css"/>
	<link rel="stylesheet" type="text/css" href="./bootstrap.css"/>
	<!--기본 pont값-->
	<link id="fontStyle" rel="stylesheet" type="text/css" href="./font_basic.css"/>

	<style type="text/css">
	p.textArea{font-size:12px; font-family:돋움, dotum, verdana, sans-serif; text-align: center; color: #666666;}
	.AreaPosition{
		position: relative;
		left: 15px;
	}
	input.session_button{
 		background: url("./images/create_button.png") no-repeat;
 		border: none;
 		width: 400px ;height:116px;
  		
	}
	</style>
	<!--pop_up-->
	<script language="javascript"> 
  	function open_win(){ 
    window.open('./loginPopUp.html','popup', 'width=400, height=300,left=500,top=200,toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no'); 
 	}

 	
	</script>
<%
	HttpSession session = request.getSession(false);
	String id = null;
	if (session != null && session.getAttribute("nickname") != null) {
		id = (String) session.getAttribute("nickname");
	}
%>
</head>
<!--head_end-->

<!--body_start-->
<% if(id == null){ %>
<body onload="open_win();historyInitailize();onloadExecute();this.focus();">
	<% }else{ %>
<body onload="historyInitailize();onloadExecute();this.focus();">	
	<% } %>

<!--logo insert session-->
<div  id="wrap"  class="wrapLayout2_L wrapAlignC wrapWidthW wrapSpec2_LW wrapLangKR">

	<div id="container" class="container  containerWidth borderN">
		<!-- 타이틀 -->
		<div id="mainTitle">
			<!-- 타이틀 배경 -->
			<div id="titleBackground" class=""></div>
			<!-- logo -->
			<div id="titleBlogName">
				<a href=""><img src="./images/Nodus.png" alt="nodus" /></a><!--이게안먹는거-->
			</div>
		</div><!-- end mainTitle -->
		<div id="mainBody" class="">
		  <div id="sideBar" class="sideBox">
			<div class="menuGroupBox ">
				<div class="menuGroupBg">
					<div id="sideBarCol1" class="sideColArea">
						<div id="Profile" class="menuBox" style="position:relative; z-index: 2;">
							<div class="menuEtcWraper ">
								<div class="menuMain" id="ProfileMenuMain">
									<div class="profileMenuBody">
										<img id="profileImg" src="http://pimg.daum-img.net/blog3/skin_thum/070401/basic_profile_ex_img.gif" width="141" alt="프로필 이미지" />
									</div><!-- end menuBody -->
									<%
									if(id != null){
									%>
									<p class="textArea"> 환영합니다. <%=id%> 회원님 </p>
									<div class="AreaPosition">
									<table border="0" style="text-align:right;">
									<form action="logout.jsp" name="logout" method="post" >
 										 <td><input type="button" name="logout" value="로그아웃"/></td>
									</form>
									<form action="exit.jsp" name="exit" method="post">
 										 <td><input type="submit" name="exit" value='회원탈퇴' /><td>
									</form>
									</table>
									</div>
									<% 
									}else{
									%>
									<p class="textArea">로그인 하세요.</p>
									<%
									}
									%>

								</div><!-- end menuMain -->
							</div><!-- end menuWraper -->
                            
							<div style="position:relative">
								<div id="this_user" class=" top_sub_layer"></div>
							</div>
						</div>
                        
						<div id="Bookmark" class="menuBox">
							<div class="menuWraper">
								<div class="menuTitle">
								</div>
								<div class="menuBody" style=" ">
									<div id="Favo0Area" style="display:none;" class="favoArea">
										<ul>
											<li><span class="txt_bul sideListClr">&bull;</span> </li>
											<li><span class="txt_bul sideListClr">&bull;</span> </li>
										</ul>
									</div>
								</div><!-- end menuBody -->
							</div><!-- end menuWraper -->
						</div>
						<div id="Category" class="menuBox">
							<div class="menuWraper borderN">
								<div class="menuBody" style="">
								</div>
							</div>
							<!-- end menuWraper --></div>
						</div>
						<div class="clearDiv"></div>
					</div><!-- end menuGroupBg -->
				</div><!-- end menuGroupBox -->
			</div>
            <div class="cContentBox ">
			<div class="contentBoxT"><div class="roundTL"></div><div class="roundTC"></div><div class="roundTR"></div></div><!-- cContentOuter -->
<div class="contentBoxB">
  <div class="roundBL"></div><div class="roundBC"></div><div class="roundBR"></div></div>
</div><!-- cContentBox -->	</div><!-- cContent -->
			<div id="contentArea">
            <!--==================[ Article Looping ]==================-->
	<form name="loopform" method="post">
	<!-- LOOP -->
	<div id="articlePrint_5388764" class="articlePrint" style="width: px;">
		<table width="801" class="cContentHeader">
			<tr>
				<td width="790">
					<div class="" style="">
						<div id="mainTitleText1" class="mainTitleText">
							<strong  class="cB_Title">새로운 세션을 만드시겠습니까?</strong>
						</div>	
					 </div>
				</td>
			</tr>
            	<td align="center">
            		<form method="post" action="#">
            			<input class="session_button" type="button" action=""/>
             		</form>
             		
                </td>
		</table>
			<div class="cCont_line"></div>
			<div id="cContentFunc" class="cContentFunc"></div>						
			<div class="clearDiv"></div>
			<div class="trackbackSend" style="display:none;"  id="trackBackListLayer_5388764"></div>
			<div id="cContentInfo" class="cContentInfo"></div>
	
	</div><!--articlePrint_-->
		<div id="cContentBottom" class="cContentBottom"><!-- cContentBottomL--><!--cContentBottomR-->
		</div><!--cContentBottm-->
	        					
												
								<div id="iLT_5388764" style="display:none" class="trackList">
					<div class="trackListHead">
						
					</div>

					<div id="trackbackListBlock_5388764"  style="padding:0 5px;">
			 					  </div>
				</div>
								<!-- 댓글 end -->

								<!-- 첨부파일 end -->

																
			</form>
            </div>
			<div id="contentArea">
					<div id="cContent" class="BasicA">
						<div class="cContentBox ">
						  <div class="cContentOuter">
							<div class="cContentinner">
								<!--==================[ Article Looping ]==================-->
								<div id="pagingBox">
								<div class="fr"><span class="arrowFont">▼</span> <a href="#contentArea">bottom</a></div>
								<div id="cNumbering">
									<% for(int i = 1 ; i < 15 ; i++){ %>
									<a href="javascript:goPage(<%=i%>);" class="Out" onmouseover="this.className='Over'" onmouseout="this.className='Out'"><%= i %></a>
									<% } %>
									<a class="cB_Text" href="javascript:goPage(11);">다음 <span class="arrowFont">▶</span></a>
								</div>
							</div>
						</div><!-- cContentinner -->
					</div><!-- cContentOuter -->
	
					</div><!-- cContentBox -->	
				</div><!-- cContent -->
                <div id="cContentCateMore" class="cContentCateMore">
		<div class="cContentBox ">
<div class="contentBoxT"><div class="roundTL"></div><div class="roundTC"></div><div class="roundTR"></div></div>
<div class="cContentOuter"><div class="cContentinner">		<div class="otherMore"><a href="javascript:goListTitle(0)" class="p11">목록보기</a></div>
		<h4><span class="cB_Amp">목록</span></h4>
		<div class="tdLine"></div>
		<ul>
			<li>
				<span class="fr sNumber alpha50">2012-12-02 09:45:57</span>
				<a href="#" title="title">1번방</a>
			</li>
            <li>
				<span class="fr sNumber alpha50">2012-12-02 09:45:57</span>
				<a href="#" title="title">1번방</a>
			</li>
            <li>
				<span class="fr sNumber alpha50">2012-12-02 09:45:57</span>
				<a href="#" title="title">1번방</a>
			</li>
            <li>
				<span class="fr sNumber alpha50">2012-12-02 09:45:57</span>
				<a href="#" title="title">1번방</a>
			</li>
            <li>
				<span class="fr sNumber alpha50">2012-12-02 09:45:57</span>
				<a href="#" title="title">1번방</a>
			</li>
            
		</ul>
		</div><!-- cContentinner --></div><!-- cContentOuter -->
<div class="contentBoxB"><div class="roundBL"></div><div class="roundBC"></div><div class="roundBR"></div></div>
</div><!-- cContentBox -->	</div>
			</div>
		</div>
	</div>
</div>



<div class="cl">&nbsp;</div>
<div id="footer" class="footerAlignC footerWidthW">
	<div class="copy contColor">박소현</div>
</div>
<!-- 페이지 마지막 -->

</body>
</html>			