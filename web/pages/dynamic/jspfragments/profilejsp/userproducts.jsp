<%-- 
    Document   : myproducts
    Created on : Apr 25, 2017, 2:07:01 PM
    Author     : tito
--%>
<%@page import="com.software.team.BigStore.model.User"%>
<%@page import="com.software.team.BigStore.Controllers.ProductController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.software.team.BigStore.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
  
    <style>
        
        #search-btn{
            width: 40px;
            text-align: center;
        }
        .usrpr-search{
            height: 35px;
            margin-right: 10px;
            width: 200px;
        }
        .prdcts-user-cn{
            
            margin: 15px;
        }

        .btn-add-pr{
            min-width: 150px;
        }
    </style>

</head>


<div class="container">
    <div class="row">
        <%! ArrayList<Product> usrProuducts = new ArrayList();
            ProductController pc = new ProductController();
        %>


        <%
            User usr = (User) request.getAttribute("user");
            usrProuducts = pc.getProudctsForUser(usr.getUser_id());

        %>



        <div class="row prdcts-user-cn" >
            <div class="col-md-3 col-md-push-7">
                <button id="search-btn" style="position: relative;left: 15px;" class="btn-warning btn col-md-1 " ><span class="glyphicon glyphicon-search" style="margin: 0 auto;"></span></button>
                <input class="col-md-2 col-md-push-1 input-lg usrpr-search text-center">
            </div>
            
            <a href="http://localhost:8080/SoftwareProject/pages/dynamic/profile/profile.jsp?do=add">
                <button class="col-md-1 col-md-push-7 btn btn-success btn-add-pr">Add Product <span class="glyphicon glyphicon-plus" ></span></button>
            </a> 


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
                        <form method="post" action="http://localhost:8080/SoftwareProject/pages/dynamic/profile/profile.jsp">
                            <input hidden="true" name="do" type="text" value="add" />

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

