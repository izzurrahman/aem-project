<html>
<%@include file="/libs/foundation/global.jsp" %>
<cq:include script="/libs/wcm/core/components/init/init.jsp"/>
<head><title>Welcome to Simply Cracked </title></head>
<body>

<%
 
com.aem.community.HelloService hello = sling.getService(com.aem.community.HelloService.class);

%>


<h3><%= "The Echo Service says:" +hello.echo("Hello There!")%> </h3>

<h1>Welcome to Simply Cracked</h1>
<h2>I am your rendering script!!</h2>

<cq:include path="par" resourceType="foundation/components/parsys" />
</body>
</html>