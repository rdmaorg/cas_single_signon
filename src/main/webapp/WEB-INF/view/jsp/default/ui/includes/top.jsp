<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<!DOCTYPE html>

<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  
  <title>${customer} &#8211; Central Authentication</title>


  <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
  <spring:theme code="cas.javascript.file" var="casJavascriptFile" text="" />
  <script type="text/javascript" src="<c:url value="${casJavascriptFile}" />"></script>
  <script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />"></script>
  <script type="text/javascript" src="<c:url value="/js/jquery.validate.min.js" />"></script>
   
  <spring:theme code="standard.custom.css.file" var="customCssFile" />
  <link rel="stylesheet" href="<c:url value="${customCssFile}" />" />
  <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />" />
  <%--
  <link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css" />" />
   --%>
  <link rel="stylesheet" href="<c:url value="/css/${ui.theme}" />" />
  
  <link rel="stylesheet" href="<c:url value="/css/cas-cs.css" />" />
  <link rel="stylesheet" href="<c:url value="/css/jquery.validate.css" />" />
  
  
  
  <link rel="icon" href="<c:url value="${auth.fav.icon}" />" type="image/x-icon" />
  
  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.1/html5shiv.js" type="text/javascript"></script>
  <![endif]-->
</head>
<%-- body id="cas"--%>
<body>
  <%-- div id="container"  --%>
  <jsp:directive.include file="navbar.jsp" />
  <div class="container">
  		<%--
      <header>
        <a id="logo" href="http://www.jasig.org" title="<spring:message code="logo.title" />">Jasig</a> 
         
        <div class="alert alert-info">
        	<h2>${customer}</h2>
        </div>
        
      </header>
       --%>
      <%--div id="content" --%>
