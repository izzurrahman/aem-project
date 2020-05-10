<%@include file="/libs/foundation/global.jsp" %>
<cq:include script="/libs/wcm/core/components/init/init.jsp"/>
<html>
<head>
<title>AEM Echo Page</title>
</head>
<body>
<h2>This page invokes the AEM Echo Service</h2>
<%
 
com.aem.community.HelloService hello = sling.getService(com.aem.community.HelloService.class);
 
   
%>
    
<h3><%= "The Echo Service says:" +hello.echo("Hello There tehn test!>>>>")%> </h3>
  
  
</body>
</html>