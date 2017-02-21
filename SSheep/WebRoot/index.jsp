<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>多多羊星座</title>
<jsp:include page="res/bootstrap.jsp"></jsp:include>
<style type="text/css">
 .carousel
        {
            margin-top:30px;
            height: 700px;         
        }
 .carousel .item
        {
         background-color:#1E90FF;
            height: 700px; 
        }
  .carousel img
  {  
           margin-top:1%;
           margin-left:23%;  
           width:300px;
           height:300px;    
  }      
 </style>
</head>
<script type="text/javascript">
</script>
<body>

          <jsp:include page="_navbar.jsp"></jsp:include>
 
<div id="carousel-example-generic" class="  carousel slide" data-ride="carousel" data-interval="2000">
  <!-- 轮播指针 -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <!-- 轮播项目 -->
  <div class="carousel-inner" role="listbox">
    <div class="item active ">
    <div >     
          <a href="#mmodeal1" data-toggle="modal"  title="点击查看星座详情"> <img src="images/zodiac01.jpg" alt="..."   class=" "  ></a>
           <a href="#mmodeal2" data-toggle="modal"  > <img src="images/zodiac 2.jpg" alt="..."  class=""></a>
     </div>
     <div >
          <a href="#mmodeal3" data-toggle="modal"  ><img src="images/zodiac 3.jpg" alt="..."   class=""></a>
          <a href="#mmodeal4" data-toggle="modal"  ><img src="images/zodiac 4.jpg" alt="..." class=""></a>
     </div>
       <div class="carousel-caption">                       
       </div>
    </div>
    <div class="item">
       <div >
           <a href="#mmodeal5" data-toggle="modal"  ><img src="images/zodiac 5.jpg" alt="..."  class=""></a>
          <a href="#mmodeal6" data-toggle="modal"  ><img src="images/zodiac 6.jpg" alt="..."  class=""></a>
           </div><div >
           <a href="#mmodeal7" data-toggle="modal"  ><img src="images/zodiac 7.jpg" alt="..."   class=""></a>
          <a href="#mmodeal8" data-toggle="modal"  > <img src="images/zodiac 8.jpg" alt="..." class=""></a>
     </div>
       <div class="carousel-caption">                      
       </div>
    </div> 
        <div class="item">
       <div >
           <a href="#mmodeal9" data-toggle="modal" ><img src="images/zodiac 9.jpg" alt="..."  class=""></a>
            <a href="#mmodeal10" data-toggle="modal"  ><img src="images/zodiac 10.jpg" alt="..."  class=""></a>
         </div><div >
             <a href="#mmodeal11" data-toggle="modal"  ><img src="images/zodiac 11.jpg" alt="..."   class=""></a>
            <a href="#mmodeal12" data-toggle="modal"  ><img src="images/zodiac 12.jpg" alt="..." class=""></a>
     </div>
       <div class="carousel-caption"> 
                        
       </div>
    </div>
  </div> 
  <!-- 轮播导航 -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" ">
    <span class="glyphicon glyphicon-chevron-left " aria-hidden="true"></span>
    <span class="sr-only">上一页</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">下一页</span>
  </a>
  <jsp:include page="modal/modal1.jsp"></jsp:include>
   <jsp:include page="modal/modal2.jsp"></jsp:include>
   <jsp:include page="modal/modal3.jsp"></jsp:include>
   <jsp:include page="modal/modal4.jsp"></jsp:include>
   <jsp:include page="modal/modal5.jsp"></jsp:include>
   <jsp:include page="modal/modal6.jsp"></jsp:include>
   <jsp:include page="modal/modal7.jsp"></jsp:include>
   <jsp:include page="modal/modal8.jsp"></jsp:include>
   <jsp:include page="modal/modal9.jsp"></jsp:include>
   <jsp:include page="modal/modal10.jsp"></jsp:include>
   <jsp:include page="modal/modal11.jsp"></jsp:include>
   <jsp:include page="modal/modal12.jsp"></jsp:include>
</body>
</html>