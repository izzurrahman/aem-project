package com.adobe.community.core.servlets;
 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.rmi.ServerException;
import java.util.Dictionary;
    
//DS Annotations
//import org.osgi.service.component.annotations.Component;
//import org.osgi.service.component.annotations.Reference;

import com.adobe.community.config.ISetting;

import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.apache.sling.commons.osgi.OsgiUtil;
import org.apache.sling.jcr.api.SlingRepository;
 
import javax.servlet.Servlet;
import javax.servlet.ServletOutputStream;
 
import org.osgi.framework.Constants;
import org.apache.sling.api.servlets.HttpConstants;
 
import org.osgi.service.component.ComponentContext;
import javax.jcr.Session;
import javax.inject.Inject;
import javax.jcr.Node; 
import java.util.UUID;
import java.util.Set; 
   
//import MBean API
import javax.management.MBeanServerConnection; 
import javax.management.MBeanServer ; 
import java.lang.management.ManagementFactory ; 
import javax.management.ObjectName;
   
    

/*@Component(service=Servlet.class,
        property={
                Constants.SERVICE_DESCRIPTION + "=Simple Demo Servlet",
                "sling.servlet.methods=" + HttpConstants.METHOD_GET,
                "sling.servlet.resourceTypes="+ "mbean64/components/structure/page",
                "sling.servlet.selectors=" + "workflow"
        })
*/
@SlingServlet(paths= {"bin/app/main"},methods= {"POST"})
public class GetRunningWorkflowsCount extends org.apache.sling.api.servlets.SlingAllMethodsServlet {
     private static final long serialVersionUID = 2598426539166789515L;
         
     @Reference
     private ISetting iSetting;
                   
     @Override
     protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServerException, IOException {
          
      try
      {
           
           //Create a MBeanServer class
          MBeanServer server = ManagementFactory.getPlatformMBeanServer();
  
          ObjectName workflowMBean = getWorkflowMBean(server);
  
          //Get the number of stale workflowitems from AEM
          Object staleWorkflowCount = server.invoke(workflowMBean, "countRunningWorkflows", new Object[]{null}, new String[] {String.class.getName()});
  
          int mystaleCount = (Integer)staleWorkflowCount; 
                  
          //Return the number of stale items 
          response.getWriter().write("There are "+mystaleCount +"  running workflows>>="+iSetting.getKeyConfig());
           
                  // response.getWriter().write("The Servlet works");
           
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    }
        
        
     private static ObjectName getWorkflowMBean(MBeanServerConnection server)
     {
         try
         {
         Set<ObjectName> names = server.queryNames(new ObjectName("com.adobe.granite.workflow:type=Maintenance,*"), null);
           
         if (names.isEmpty()) {
                 return null;
         }
  
         return names.iterator().next();
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return null; 
}
  
        
}