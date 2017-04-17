<%-- 
    Document   : user_prouducts
    Created on : Mar 24, 2017, 9:42:01 PM
    Author     : tito
--%>

<%@page import="com.software.team.BigStore.Controllers.ProductController"%>
<%@page import="com.software.team.BigStore.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.software.team.BigStore.model.User"%>

<!-- tawfik -->

<%! User user;%>
<% if (session.getAttribute("normal") != null) {
        user = (User) session.getAttribute("normal");

    } else if (session.getAttribute("company") != null) {
        user = (User) session.getAttribute("company");

    } else {

    }%>

<div class="all-2-1">
    <div class="all-2-111">
        <%--image --%>
        <image class="img-responsive"  src="../jspfragments/retrive_image.jsp?userId=<%=user.getUser_id()%>"/>
    </div>
    <a class="all-2-112" href="#">   
        profile-photo
    </a>
    <div class="all-2-11">
        <label>name: <%= user.getUser_name()%></label>    
        <label>Email: <%= user.getUser_email()%></label> 
        <label>phone:<%= user.getUser_phone()%></label> 
        <label>Address <%= user.getUser_location()%></label> 
    </div>
</div>
    
    
    
    
    
    
<div class="all-2-2">
    <div class="container">
        <div class="row">
            <div class="container">
                <%! ArrayList<Product> usrProuducts;
                    ProductController pc = new ProductController();
                %>
                <% usrProuducts = pc.getProudctsForUser(user.getUser_id());%>

                <div class="row">


                    <% for (Product pr : usrProuducts) {%>

                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="../jspfragments/retrive_image.jsp?imgId=<%=pr.getProduct_id()%>" class="img-responsive" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$<%= pr.getProduct_price()%></h4>
                                <h4><a href="#">First Product</a></h4>
                                <p>See more snippets like this online store item at </p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <% for (int i = 0; i < pr.getProduct_rate(); i++) { %>
                                    <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                    <% }
                                        int notrated = 5 - pr.getProduct_rate();
                                        for (int i = 0; i < notrated; i++) {
                                    %>
                                    <i class="fa fa-star gray-star" aria-hidden="true"></i>;

                                    <% }%>
                                    
                                </p>
                                <div class="span1">
                                    <a href="../jspfragments/profilejsp/deleteUserProduct.jsp?pr_id=<%=pr.getProduct_id()%>" class="btn btn-primary">
                                        <i class="icon-pencil icon-white"></i>
                                        <span><strong>Delete</strong></span>            
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</div>