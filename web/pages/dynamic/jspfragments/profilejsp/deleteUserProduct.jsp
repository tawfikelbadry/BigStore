<%-- 
    Document   : deleteUserProduct
    Created on : Mar 24, 2017, 11:40:20 PM
    Author     : tito
--%>

<%@page import="com.software.team.BigStore.Controllers.ProductController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int pr_id = Integer.parseInt(request.getParameter("pr_id"));
    
    ProductController pc = new ProductController();
    pc.deleteProuduct(pr_id);
    
    response.sendRedirect("http://localhost:8080/SoftwareProject/pages/dynamic/c_profile/index.jsp");
    

%>
