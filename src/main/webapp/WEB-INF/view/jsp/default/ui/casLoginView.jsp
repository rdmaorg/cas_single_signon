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
<jsp:directive.include file="includes/top.jsp" />


<%--
<!--
	HTTPS will be forced using apache.
-->
<c:if test="${not pageContext.request.secure}">
	<div class="row">
		<div class="col-md-5">
			<div id="msg" class="alert alert-danger">

				<h2>Non-secure Connection</h2>
				<p>
					You are currently accessing CAS over a non-secure connection. <b>Single
						Sign On WILL NOT WORK</b>. In order to have single sign on work, you
					MUST log in over HTTPS.
				</p>
			</div>
		</div>
	</div>
</c:if>
--%>

<%-- div class="box" id="login" --%>
<div class="row">
	<div class="col-md-5">
		<div class="panel panel-primary"
			<%-- id="login"--%> style="margin-left: 0px">

			<div class="panel-heading">
				<h2 class="panel-title">
					<spring:message code="screen.welcome.instructions" />
				</h2>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-8">
						<p>Please enter your username and password in the form below</p>
					</div>
					<div class="col-md-4">
						<div class="pull-right">
							<a href="${customer.url}" target="_blank"><img
								src="${auth.logo}" alt="${customer}" height="40" /></a>
						</div>
					</div>
				</div>

				<form:form method="post" id="fm1" commandName="${commandName}"
					htmlEscape="true">

					<%--
						<form:errors path="*" id="msg" cssClass="alert alert-danger" element="div"
							htmlEscape="false" />
						 --%>
					<div class="row">
						<div id="formError" class="alert alert-danger">
							<form:errors path="*" />
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label>Username</label>
							<div class="input-group">
								<span class="input-group-addon" data-toggle="tooltip" data-placement="top" title="Username"><i
									class="glyphicon glyphicon-user"></i></span>
								<c:choose>
									<c:when test="${not empty sessionScope.openIdLocalId}">
										<strong>${sessionScope.openIdLocalId}</strong>
										<input type="hidden" id="username" name="username"
											value="${sessionScope.openIdLocalId}" />
									</c:when>
									<c:otherwise>
										<spring:message code="screen.welcome.label.netid.accesskey"
											var="userNameAccessKey" />
										<%-- 	
										<form:input cssClass="required" cssErrorClass="error"
											id="username" tabindex="1" accesskey="${userNameAccessKey}"
											path="username" autocomplete="off" htmlEscape="true" />
										--%>
										<form:input class="form-control" cssErrorClass="error"
											id="username" name="username" tabindex="1"
											accesskey="${userNameAccessKey}" path="username"
											autocomplete="off" htmlEscape="true" />

									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>

					<div class="row">


						<%--
      NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
      "autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
      information, see the following web page:
      http://www.technofundo.com/tech/web/ie_autocomplete.html
      --%>
						<div class="form-group">
							<label>Password</label>
							<div class="input-group">
								<span class="input-group-addon" data-toggle="tooltip" data-placement="top" title="Password"> <i
									class="glyphicon glyphicon-lock"></i>
								</span>

								<spring:message code="screen.welcome.label.password.accesskey"
									var="passwordAccessKey" />
								<%-- 
								<form:password class="form-control" cssClass="required"
									cssErrorClass="error" id="password" tabindex="2"
									path="password" accesskey="${passwordAccessKey}"
									htmlEscape="true" autocomplete="off" />
									--%>
								<form:password class="form-control" cssErrorClass="error"
									id="password" name="password" tabindex="2" path="password"
									accesskey="${passwordAccessKey}" htmlEscape="true"
									autocomplete="off" />
							</div>
						</div>
					</div>
					<%-- 
					<div class="row check">
						<input id="warn" name="warn" value="true" tabindex="3"
							accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />"
							type="checkbox" /> <label for="warn"><spring:message
								code="screen.welcome.label.warn" /></label>
					</div>
					--%>

					<%-- 
					<div class="checkbox">
						<input id="warn" name="warn" value="true" tabindex="3"
							accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />"
							type="checkbox" />
						<spring:message code="screen.welcome.label.warn" />
					</div>
					--%>

					<div class="row btn-row">
						<input type="hidden" name="lt" value="${loginTicket}" /> <input
							type="hidden" name="execution" value="${flowExecutionKey}" /> <input
							type="hidden" name="_eventId" value="submit" /> <input
							class="btn btn-primary" name="submit" accesskey="l"
							value="<spring:message code="screen.welcome.button.login" />"
							tabindex="4" type="submit" /> <input class="btn btn-default"
							name="reset" accesskey="c"
							value="<spring:message code="screen.welcome.button.clear" />"
							tabindex="5" type="reset" />

						<!-- div class="btn btn-default pull-right">
							<spring:message code="screen.welcome.label.password.forgot"
								arguments="${password.reset.url}" />
						</div-->
					</div>
					<!-- div class="row">
						<spring:message code="screen.welcome.label.password.forgot"
							arguments="${password.reset.url}" />
					</div -->
				</form:form>
			</div>

		</div>
	</div>
</div>



<div class="row">
	<div class="col-md-5">
		<div id="sidebar">
			<div class="alert alert-warning"<%-- class="sidebar-content"--%>>
				<p>
					<spring:message code="screen.welcome.security" />
				</p>

				<%-- 
		<div id="list-languages">
			<%final String queryString = request.getQueryString() == null ? "" : request.getQueryString().replaceAll("&locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]|^locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]", "");%>
			<c:set var='query' value='<%=queryString%>' />
			<c:set var="xquery" value="${fn:escapeXml(query)}" />

			<h3>Languages:</h3>

			<c:choose>
				<c:when
					test="${not empty requestScope['isMobile'] and not empty mobileCss}">
					<form method="get" action="login?${xquery}">
						<select name="locale">
							<option value="en">English</option>
							<option value="es">Spanish</option>
							<option value="fr">French</option>
							<option value="ru">Russian</option>
							<option value="nl">Nederlands</option>
							<option value="sv">Svenska</option>
							<option value="it">Italiano</option>
							<option value="ur">Urdu</option>
							<option value="zh_CN">Chinese (Simplified)</option>
							<option value="zh_TW">Chinese (Traditional)</option>
							<option value="de">Deutsch</option>
							<option value="ja">Japanese</option>
							<option value="hr">Croatian</option>
							<option value="cs">Czech</option>
							<option value="sl">Slovenian</option>
							<option value="pl">Polish</option>
							<option value="ca">Catalan</option>
							<option value="mk">Macedonian</option>
							<option value="fa">Farsi</option>
							<option value="ar">Arabic</option>
							<option value="pt_PT">Portuguese</option>
							<option value="pt_BR">Portuguese (Brazil)</option>
						</select> <input type="submit" value="Switch">
					</form>
				</c:when>
				<c:otherwise>
					<c:set var="loginUrl"
						value="login?${xquery}${not empty xquery ? '&' : ''}locale=" />
					<ul>
						<li class="first"><a href="${loginUrl}en">English</a></li>
						<li><a href="${loginUrl}es">Spanish</a></li>
						<li><a href="${loginUrl}fr">French</a></li>
						<li><a href="${loginUrl}ru">Russian</a></li>
						<li><a href="${loginUrl}nl">Nederlands</a></li>
						<li><a href="${loginUrl}sv">Svenska</a></li>
						<li><a href="${loginUrl}it">Italiano</a></li>
						<li><a href="${loginUrl}ur">Urdu</a></li>
						<li><a href="${loginUrl}zh_CN">Chinese (Simplified)</a></li>
						<li><a href="${loginUrl}zh_TW">Chinese (Traditional)</a></li>
						<li><a href="${loginUrl}de">Deutsch</a></li>
						<li><a href="${loginUrl}ja">Japanese</a></li>
						<li><a href="${loginUrl}hr">Croatian</a></li>
						<li><a href="${loginUrl}cs">Czech</a></li>
						<li><a href="${loginUrl}sl">Slovenian</a></li>
						<li><a href="${loginUrl}ca">Catalan</a></li>
						<li><a href="${loginUrl}mk">Macedonian</a></li>
						<li><a href="${loginUrl}fa">Farsi</a></li>
						<li><a href="${loginUrl}ar">Arabic</a></li>
						<li><a href="${loginUrl}pt_PT">Portuguese</a></li>
						<li><a href="${loginUrl}pt_BR">Portuguese (Brazil)</a></li>
						<li class="last"><a href="${loginUrl}pl">Polish</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		--%>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		if (isEmpty($('#formError'))) {
			$('#formError').hide();
		}
		console.log("configuring form validation. "); 
		$('#fm1').validate({
			rules : {
				username : "required",
				password : "required"
			},
			messages : {
				username : "Please enter the required information",
				password : "Please enter the required information"
			}
		});
		$('[data-toggle="tooltip"]').tooltip();
	}); 
	
	function isEmpty(el) {
		return !$.trim(el.html())
	}
</script>

<jsp:directive.include file="includes/bottom.jsp" />
