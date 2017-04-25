<%-- 
    Document   : user_details
    Created on : Mar 31, 2017, 3:44:37 PM
    Author     : tito && khaled
--%>

<%@page import="com.software.team.BigStore.Controllers.ProductController" %>
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
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="row">
                        <img class="img-thumbnail" height="200" width="200" src="../jspfragments/retrive_image.jsp?userId=<%=user.getUser_id()%>" alt="my photo" />
                    </div>
                </div>
                <div class="center-block col-md-9">
                    <div class="col-md-12 col-sm-6 col-xs-12 text-center" style="top: 20px">
                        <h2>
                            <span class="center-block text-center"> <%= user.getUserFullname()%>  </span>
                        </h2>
                        <div >

                            <ul class="center-block" >

                                <li ><h4>Email : <%=user.getUser_email()%></h4></li>
                                <li><h4>Address : <%=user.getUser_location()%></h4></li>
                                <li><h4>Phone : <%=user.getUser_phone()%></h4></li>


                            </ul>
                        </div><!--col-md-8 col-sm-8 col-xs-12 close-->

                        <div class="col-xs-12 visible-lg" style="top: 70px">
                            <button class="col-md-push-2 col-md-3 col-xs-6 btn btn-success" >Add Prouduct <span class="glyphicon glyphicon-plus"> </span></button>
                            <button class="col-md-push-4 col-md-3 col-xs-6 btn btn-primary" >Follow</button>
                           

                        </div>

                    </div>

                </div>
            </div>
        </div><!--profile-head close-->
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <%! ArrayList<Product> usrProuducts = new ArrayList();
            ProductController pc = new ProductController();
        %>


        <%
            usrProuducts = pc.getProudctsForUser(user.getUser_id());

        %>
        
        <div class="col-xs-12 " style="margin: 5px;" >
            <button class="col-md-4 btn btn-warning" >My Products</button>
            <button class="col-md-4 btn btn-info" >My Followers</button>
            <button class="col-md-4 btn btn-info">Following</button>
        </div>

        <% for (Product pr : usrProuducts) {%>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="productbox">
                <img  style="width: 100%;height: 200px;" src="../jspfragments/retrive_image.jsp?imgId=<%=pr.getProduct_id()%>"> 
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


                <div class="productprice" >
                    <div class="pull-right">
                        <form method="post" action="">
                            <input hidden="true" name="edit" type="text" value="<%=pr.getProduct_id()%>" />
                            <button type="submit" class="btn btn-success btm-sm" >
                                Edit
                                <span class="glyphicon glyphicon-edit" ></span>
                            </button>  
                        </form>

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


