<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.go">TIKKI</a>
      <c:if test="${ sessionScope.id == null }">
      <a class="navbar-login" href="login.go"><small>�α���</small></a>
      <a class="navbar-login" href="join.go"><small>ȸ������</small></a>
      </c:if>
      <c:if test="${ sessionScope.id != null && sessionScope.kakaonick == null}">
	      <a class="navbar-login" href="logout.go"><small>�α׾ƿ�</small></a>
	      <div>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
					<c:if test="${ sessionScope.nick == '������' }">
						<a class="navbar-login dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" aria-haspopup="true"
							aria-expanded="false"><small>������ ������ </small> </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="memberList.admin">ȸ����������</a>
								<a class="dropdown-item" href="xxx.admin">�������</a>
							</div>
					</c:if>
					<c:if test="${ sessionScope.nick != '������' }">
					
						<a class="navbar-login dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" aria-haspopup="true"
							aria-expanded="false"><small>${sessionScope.nick}�� ������ </small> </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="update.go">ȸ������</a>
								<a class="dropdown-item" href="updatePassword.go">��й�ȣ����</a>  
								<a class="dropdown-item" href="delete.go">ȸ��Ż��</a> 
								<a class="dropdown-item" href="portfolio-item.html">����Ȯ��</a>
							</div>
					</c:if>
					</li>
				</ul>
	      </div>	
      </c:if>
      <c:if test="${ sessionScope.kakaonick != null}">
      	<a class="navbar-login" href="logout.kakao" onclick="kakaologout()"><small>īī�� �α׾ƿ�</small></a>
      	<div>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
					<a class="navbar-login dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" aria-haspopup="true"
						aria-expanded="false"><small>${sessionScope.kakaonick}�� ������ </small> </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="portfolio-item.html">����Ȯ��</a>
						</div>
					</li>
				</ul>
	      </div>	
      </c:if>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="information/about.jsp">ȣ�ڼҰ�</a> <!-- About �� contact map-->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
              ���ǼҰ�
            </a><!--  ��Ʈ������1 -> single portfolio item -->
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="room1detail.html">room1</a>
              <a class="dropdown-item" href="room2detail.html">room2</a>
              <a class="dropdown-item" href="room3detail.html">room3</a>
            </div>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="reserve.to">����</a> 
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list.do">������</a> 
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->
  