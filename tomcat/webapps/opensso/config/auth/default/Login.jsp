<%--
   DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.

   Copyright (c) 2005 Sun Microsystems Inc. All Rights Reserved

   The contents of this file are subject to the terms
   of the Common Development and Distribution License
   (the License). You may not use this file except in
   compliance with the License.

   You can obtain a copy of the License at
   https://opensso.dev.java.net/public/CDDLv1.0.html or
   opensso/legal/CDDLv1.0.txt
   See the License for the specific language governing
   permission and limitations under the License.

   When distributing Covered Code, include this CDDL
   Header Notice in each file and include the License file
   at opensso/legal/CDDLv1.0.txt.
   If applicable, add the following below the CDDL Header,
   with the fields enclosed by brackets [] replaced by
   your own identifying information:
   "Portions Copyrighted [year] [name of copyright owner]"

   $Id: Login.jsp,v 1.11 2009/01/09 07:13:21 bhavnab Exp $

--%>


<!DOCTYPE html>
<html lang="en">

<%@page info="Login" language="java"%>
<%@taglib uri="/WEB-INF/jato.tld" prefix="jato"%>
<%@taglib uri="/WEB-INF/auth.tld" prefix="auth"%>
<jato:useViewBean className="com.sun.identity.authentication.UI.LoginViewBean">


<%@ page contentType="text/html" %>

<head>
<meta charset="utf-8" />
<!-- Web Experience Toolkit (WET) / Bo�te � outils de l'exp�rience Web (BOEW)
www.tbs.gc.ca/ws-nw/wet-boew/terms / www.sct.gc.ca/ws-nw/wet-boew/conditions -->
<title><jato:text name="htmlTitle_Login" /></title>

<%
String ServiceURI = (String) viewBean.getDisplayFieldValue(viewBean.SERVICE_URI);
String encoded = "false";
String gotoURL = (String) viewBean.getValidatedInputURL(
    request.getParameter("goto"), request.getParameter("encoded"), request);
String encodedQueryParams = (String) viewBean.getEncodedQueryParams(request);
if ((gotoURL != null) && (gotoURL.length() != 0)) {
    encoded = "true";
}
%>

<link rel="shortcut icon" href="<%= ServiceURI %>/images/favicon.ico" />
<meta name="dcterms.description" content="English description / Description en anglais" />
<meta name="description" content="English description / Description en anglais" />
<meta name="keywords" content="English keywords / Mots-cl�s en anglais" />
<meta name="dcterms.creator" content="English name of the content author / Nom en anglais de l'auteur du contenu" />
<meta name="dcterms.title" content="English title / Titre en anglais" />
<meta name="dcterms.issued" title="W3CDTF" content="Date published (YYYY-MM-DD) / Date de publication (AAAA-MM-JJ)" />
<meta name="dcterms.modified" title="W3CDTF" content="Date modified (YYYY-MM-DD) / Date de modification (AAAA-MM-JJ)" />
<meta name="dcterms.subject" title="scheme" content="English subject terms / Termes de sujet en anglais" />
<meta name="dcterms.language" title="ISO639-2" content="eng" />

<link href="<%= ServiceURI %>/css/base.css" rel="stylesheet" />
<!--[if IE 6]><![endif]-->
<!--[if IE 8]><link href="<%= ServiceURI %>/css/base-ie8.css" rel="stylesheet" /><![endif]-->
<!--[if IE 7]><link href="<%= ServiceURI %>/css/base-ie7.css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="<%= ServiceURI %>/css/base-ie6.css" rel="stylesheet" /><![endif]-->
<!-- CSSStart -->
<link href="<%= ServiceURI %>/css/util.css" media="screen" rel="stylesheet" />
<link href="<%= ServiceURI %>/css/framework-responsive-theme-gcwu-fegc.css" media="screen" rel="stylesheet" />
<link href="<%= ServiceURI %>/css/theme-gcwu-fegc.css" rel="stylesheet" />
<!--[if IE 8]><link href="<%= ServiceURI %>/css/theme-gcwu-fegc-ie8.css" rel="stylesheet" /><![endif]-->
<!--[if IE 7]><link href="<%= ServiceURI %>/css/theme-gcwu-fegc-ie7.css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="<%= ServiceURI %>/css/theme-gcwu-fegc-ie6.css" rel="stylesheet" /><![endif]-->
<link href="<%= ServiceURI %>/js/support/menubar/style.css" rel="stylesheet" />
<link href="<%= ServiceURI %>/css/fip-pcim.css" rel="stylesheet" />
<!--[if IE 8]><link href="<%= ServiceURI %>/css/fip-pcim-ie8.css" rel="stylesheet" /><![endif]-->
<!--[if IE 7]><link href="<%= ServiceURI %>/css/fip-pcim-ie7.css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="<%= ServiceURI %>/css/fip-pcim-ie6.css" rel="stylesheet" /><![endif]-->
<!-- CSSEnd -->

<script src="<%= ServiceURI %>/js/lib/jquery.min.js"></script>

			<script  language="JavaScript" type="text/javascript">			
			
			    // Test domain value
	    		#var domain_name = ".domain.net";
				// Template placeholder for the domain value
		    	var domain_name = "##DOMAIN_NAME##";
			    
				function htmlEncode(value){
				    if (value) {
				        return jQuery('<div />').text(value).html();
				    } else {
				        return '';
				    }
				}
				
		        function setCookie(name, value, domain, secure, handler) {
		            document.cookie = name + "=" + value + ";path=/;domain=" + domain;
		        }

		        function getCookie(name) {
		            var nameEQ = name + "=", ca = document.cookie.split(';'), i = 0, c;
		            for (; i < ca.length; i++) {
		                c = ca[i];
		                while (c[0] == ' ') c = c.substring(1);
		                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length);
		            }
		            return null;
		        }

		        function switch_to_fra() {
	                $("#lilang").html("English");
	            	$("#cn-site-title").html("<p id=\"cn-site-title-inner\"><a target=\"_blank\" href=\"home-accueil-megamenu-theme-gcwu-fegc-eng.html\">Simulateur de service fournisseur de justificatifs</a></p>");
	        	    $("#cn-gcnb3").html("<a target=\"_blank\" rel=\"external\" href=\"http://www.canada.gc.ca/depts/major/depind-fra.html\">D�partements</a>");
	        	    
	        	    $("#login_legend").html("<legend>Se connecter</legend>");
	        	    $("#username_legend").html("<label for=\"IDToken1\">Nom de l'utilisateur:</label>");
	        	    $("#password_legend").html("<label for=\"IDToken2\">Mot de passe:</label>");
	        	    $("#buttons").html("<input class=\"width-70\" name=\"IDButton\" type=\"submit\" id=\"IDButton\" value=\"Connecter\" />"
	        	    	+ "<input class=\"width-20 float-right\" name=\"reset\" type=\"reset\" id=\"reset\" value=\"Effacer Tout\" />");
		        }
		        
		        function switch_to_eng() {
	                $("#lilang").html("Fran�ais");
	            	$("#cn-site-title").html("<p id=\"cn-site-title-inner\"><a target=\"_blank\" href=\"home-accueil-megamenu-theme-gcwu-fegc-eng.html\">IDP Simulator</a></p>");
	            	$("#cn-gcnb3").html("<a target=\"_blank\" rel=\"external\" href=\"http://www.canada.gc.ca/depts/major/depind-eng.html\">Departments</a>");
	        	    
	        	    $("#login_legend").html("<legend>Login</legend>");
	        	    $("#username_legend").html("<label for=\"IDToken1\">Username:</label>");
	        	    $("#password_legend").html("<label for=\"IDToken2\">Password:</label>");
	        	    $("#buttons").html("<input class=\"width-70\" name=\"IDButton\" type=\"submit\" id=\"IDButton\" value=\"Login\" />"
		        	    	+ "<input class=\"width-20 float-right\" name=\"reset\" type=\"reset\" id=\"reset\" value=\"Clear\" />");
				}
		        
		        function init() {
		        	
		            var field = getCookie('_gc_lang');
		            //var field = 'eng';

		            if (field == 'fra') {
		            	switch_to_fra();
		            } else {
		            	switch_to_eng();

		                if (field != 'eng') {
		                    setCookie('_gc_lang', 'eng', domain_name, 'n', function (result) {
		                        $.each(result, function (i, field) {
		                            //$("li").append(field + " ");
		                        });
		                    });
		                }
		            }
		        }

		        $(init);

		        $(document).ready(function () {

		            $("#lilang").toggle(
		               function () {
 		            	   switch_to_fra();
		                   setCookie('_gc_lang', 'fra', domain_name, 'n', function (result) {
		                       $.each(result, function (i, field) {
		                           //$("li").append(field + " ");
		                       });
		                   });
		                   
		               }, function () {
 		            	   switch_to_eng();
		                   setCookie('_gc_lang', 'eng', domain_name, 'n', function (result) {
		                       $.each(result, function (i, field) {
		                           //$("li").append(field + " ");
		                       });
		                   });
		               });		            
		        });
					
			</script>

<script src="<%= ServiceURI %>/js/pe-ap.js" id="progressive"></script>
<script>
/* <![CDATA[ */
var params = {
menubar:""
};
PE.progress(params);
/* ]]> */
</script>

<!-- CustomScriptsCSSStart -->
<!-- CustomScriptsCSSEnd -->
</head>

<body><div id="cn-body-inner-1col">
<div id="cn-skip-head">
<ul id="cn-tphp">
<li id="cn-sh-link-1"><a href="#cn-cont">Skip to main content</a></li>
<li id="cn-sh-link-2"><a href="#cn-nav">Skip to footer</a></li>
</ul>
</div>

<div id="cn-head"><div id="cn-head-inner"><header>
<!-- HeaderStart -->
<nav role="navigation"><div id="cn-gcnb"><h2>Government of Canada navigation bar</h2><div id="cn-gcnb-inner"><div id="fip-pcim-gcnb">
<div id="cn-sig"><div id="cn-sig-inner"><div id="fip-pcim-sig-eng" title="Government of Canada"><img src="/opensso/images/sig-eng.gif" width="214" height="20" alt="Government of Canada" /></div></div></div>
<ul>
<li id="cn-gcnb1"><a target="_blank" rel="external" href="http://www.canada.gc.ca/home.html">Canada.gc.ca</a></li>
<li id="cn-gcnb2"><a target="_blank" rel="external" href="http://www.servicecanada.gc.ca/eng/home.shtml">Services</a></li>
<li id="cn-gcnb3"><a target="_blank" rel="external" href="http://www.canada.gc.ca/depts/major/depind-eng.html">Departments</a></li>
<li id="lilang" style="margin-right: 2px; cursor: pointer; color : white;">Fran�ais</li>
<!-- 
<li id="cn-gcnb-lang"><a href="application-fra.html" lang="fr">Fran�ais</a></li>
 -->
</ul>
</div></div></div></nav>

<div id="cn-banner" role="banner"><div id="cn-banner-inner">
<div id="cn-wmms"><div id="cn-wmms-inner"><div id="fip-pcim-wmms" title="Symbol of the Government of Canada"><img src="/opensso/images/wmms.gif" width="126" height="30"  alt="Symbol of the Government of Canada" /></div></div></div>
<div id="cn-site-title"><p id="cn-site-title-inner"><a target="_blank" href="home-accueil-megamenu-theme-gcwu-fegc-eng.html">IDP Simulator</a></p></div>
</div></div>

<nav role="navigation">
<div id="cn-psnb"><h2>Site navigation bar</h2><div id="cn-psnb-inner"><div class="wet-boew-menubar"><div>
<!--
<ul class="mb-menu">
<li><div><a target="_blank" class="first" href="#">Cancel</a></div></li>
</ul>
-->
</div></div></div></div>

<!--
<div id="cn-bc"><h2>Breadcrumb trail</h2><div id="cn-bc-inner">
<ol>
<li><a target="_blank" href="_blank">Welcome</a></li>
</ol>
</div></div>
-->
</nav>
<!-- HeaderEnd -->
</header></div></div>

<div id="cn-cols"><div id="cn-cols-inner" class="equalize">
<div id="cn-centre-col" role="main"><div id="cn-centre-col-inner">
<!-- MainContentStart -->

<section>
	<div class="span-2"></div>
	<div class="span-4">
		<auth:form name="Login" method="post"
    			defaultCommandChild="DefaultLoginURL" >
			<div class="module-form-fluid margin-bottom-none">
				<fieldset>
					<!-- 
					<legend>Login</legend>
					<label for="IDToken1">Username:</label> <input name="IDToken1" type="text" id="IDToken1" />
					<label for="IDToken2">Password:</label> <input name="IDToken2" type="password" id="IDToken2" />
					<input class="width-70" name="IDButton" type="submit" id="IDButton" value="Login" />
					<input class="width-20 float-right" name="reset" type="reset" id="reset" value="Clear" />
					 -->
					<div id="login_legend"><legend>Login</legend></div>
					<div id="username_legend"><label for="IDToken1">Username:</label></div> <input name="IDToken1" type="text" id="IDToken1" />
					<div id="password_legend"><label for="IDToken2">Password:</label></div> <input name="IDToken2" type="password" id="IDToken2" />
					<div id="buttons">
						<input class="width-70" name="IDButton" type="submit" id="IDButton" value="Login" />
						<input class="width-20 float-right" name="reset" type="reset" id="reset" value="Clear" />
					</div>
				</fieldset>
			</div>
			<div class="margin-top-none margin-bottom-none align-center">
				<jato:content name="ContentStaticTextResult">
				<!-- after login output message -->
				<p><b><jato:getDisplayFieldValue name='StaticTextResult'
				    defaultValue='' fireDisplayEvents='true' escape='false'/></b></p>
				</jato:content>

				<jato:content name="ContentHref">
				<!-- URL back to Login page -->
				    <p><auth:href name="LoginURL"
					    fireDisplayEvents='true'>
					<jato:text
					name="txtGotoLoginAfterFail" /></auth:href></p>
				</jato:content>
			</div>
			<input type="hidden" name="goto" value="<%= gotoURL %>">
			<input type="hidden" name="SunQueryParamsString" value="<%= encodedQueryParams %>">
			<input type="hidden" name="encoded" value="<%= encoded %>">
		</auth:form>

		<%
		String gotoParam = request.getParameter("goto");
		if (gotoParam != null && gotoParam.contains("ReqID=")) {
		    String formTarget = request.getContextPath()
		    			+ gotoParam.substring(0, gotoParam.indexOf('?'));
		    String reqId = gotoParam.substring(gotoParam.indexOf("ReqID=") + 6);

		%>
		<div class="margin-top-none margin-bottom-none align-center">
			<form method="get" action="<%= formTarget %>">
			   <input type="hidden" name="ReqID" value="<%= reqId %>" />
			   <input class="width-20" name="cancel" type="submit" id="cancel" value="Cancel" />
			</form>
		</div>
		<%
		}
		%>
	</div>
	<div class="span-2"></div>
	<div class="clear"></div>
</section>

<dl id="cn-doc-dates" role="contentinfo">
<dt>Version:</dt><dd>0.0</dd>
</dl>
<div class="clear"></div>
<!-- MainContentEnd -->
</div></div>
</div></div>

<div id="cn-foot"><div id="cn-foot-inner"><footer><h2 id="cn-nav">Footer</h2>
<!-- FooterStart -->
<nav role="navigation"><div id="cn-sft"><h3>Site footer</h3><div id="cn-sft-inner">
<div id="cn-ft-tctr">
<ul>
<li class="terms"><a href="#" target="_blank" rel="license">Terms and conditions</a></li>
<li class="trans"><a href="#" target="_blank">Transparency</a></li>
</ul>
</div>
<div class="clear"></div>
</div></div></nav>

<nav role="navigation"><div id="cn-gcft"><h3>Government of Canada footer</h3><div id="cn-gcft-inner"><div id="fip-pcim-gcft">
<ul>
<li><a target="_blank" rel="external" href="http://healthycanadians.gc.ca/index-eng.php"><span>Health</span><br />healthycanadians.gc.ca</a></li>
<li><a target="_blank" rel="external" href="http://www.voyage.gc.ca/index-eng.asp"><span>Travel</span><br />travel.gc.ca</a></li>
<li><a target="_blank" rel="external" href="http://www.servicecanada.gc.ca/eng/home.shtml"><span>Service Canada</span><br />servicecanada.gc.ca</a></li>
<li><a target="_blank" rel="external" href="http://www.jobbank.gc.ca/intro-eng.aspx"><span>Jobs</span><br />jobbank.gc.ca</a></li>
<li><a target="_blank" rel="external" href="http://actionplan.gc.ca/eng/index.asp"><span>Economy</span><br />actionplan.gc.ca</a></li>
<li id="cn-ft-ca"><div><a target="_blank" rel="external" href="http://www.canada.gc.ca/home.html">Canada.gc.ca</a></div></li>
</ul>
</div></div></div></nav>
<!-- FooterEnd -->
</footer></div></div>
</div></body>


</jato:useViewBean>

</html>
