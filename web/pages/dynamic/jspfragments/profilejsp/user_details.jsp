<%-- 
    Document   : user_details
    Created on : Mar 31, 2017, 3:44:37 PM
    Author     : tito && khaled
--%>

<%@page import="com.software.team.BigStore.Controllers.ProductController"%>
<%@page import="com.software.team.BigStore.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.software.team.BigStore.model.User"%>
<%! User user = new User();%>
<% if (session.getAttribute("normal") != null) {
        user = (User) session.getAttribute("normal");

    } else if (session.getAttribute("company") != null) {
        user = (User) session.getAttribute("company");

    } else {

        response.sendRedirect("../home/index.jsp");

    }%>



<div class="container-fluid">
    <div class="row">
        <div class="profile-head">
            <div class="profiles col-xs-8 col-xs-push-2  col-sm-10 col-sm-push-1 thumbnail">
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="row">
                        <img height="260" src="../jspfragments/retrive_image.jsp?userId=<%=user.getUser_id()%>" alt="my photo" />
                    </div>
                </div>
                <div class="col-md-9 visible-lg">
                    <div class="row">
                        <h2>
                            <span class=" col-md-9 col-sm-12 text-center"> <%= user.getUserFullname() %>  </span>
                        </h2>
                        <div class="col-md-9 col-sm-6 col-xs-12 text-center">

                            <ul >

                                <li><h4>Email : <%=user.getUser_email()%></h4></li>
                                <li><h4>Address : <%=user.getUser_location()%></h4></li>
                                <li><h4>Phone : <%=user.getUser_phone()%></h4></li>


                            </ul>
                        </div><!--col-md-8 col-sm-8 col-xs-12 close-->

                    </div>
                </div>
            </div>
        </div><!--profile-head close-->
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <%! ArrayList<Product> usrProuducts;
            ProductController pc = new ProductController();
        %>
        <% usrProuducts = pc.getProudctsForUser(user.getUser_id());%>

        <% for (Product pr : usrProuducts) {%>

        <div class="col-md-3">
            <div class="productbox">
                <img  height="250" width="280" src="../jspfragments/retrive_image.jsp?imgId=<%=pr.getProduct_id()%>">
                <div class="producttitle" style="text-align: center"><%=pr.getProduct_name()%></div>
                <details>

                    <p style="text-align: center;font-size: 20px;margin: 9px 0 9px 0;">Price : 
                        <%= pr.getProduct_price()%>  
                    </p>

                    <p style="text-align: center;font-size: 18px">
                        <%=pr.getProduct_details()%>
                    </p>

                    <br>
                </details>


                <div class="productprice">
                    <div class="pull-right">
                        <a href="#" class="btn btn-success btm-sm" role="button">Edit  <span class="glyphicon glyphicon-cutlery"></span></a>
                    </div>
                    <div class="pricetext">
                        <a href="http://localhost:8080/SoftwareProject/pages/dynamic/jspfragments/profilejsp/deleteUserProduct.jsp?pr_id=<%=pr.getProduct_id()%>" class="btn btn-warning btm-sm" role="button">Delete <span class="glyphicon glyphicon-cog"></span></a>
                    </div>

                </div>
            </div>
        </div>
        <% }%>
    </div>
</div>


