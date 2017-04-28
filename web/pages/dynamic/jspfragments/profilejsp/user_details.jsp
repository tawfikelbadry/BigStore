<%-- 
    Document   : user_details
    Created on : Mar 31, 2017, 3:44:37 PM
    Author     : tawfik && khaled
--%>

<%@page import="com.software.team.BigStore.model.NormalUser"%>
<%@page import="com.software.team.BigStore.model.Company"%>
<%@page import="com.software.team.BigStore.Controllers.UserController"%>
<%@page import="com.software.team.BigStore.Controllers.ProductController" %>
<%@page import="com.software.team.BigStore.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.software.team.BigStore.model.User"%>

<%! User user = new User();%>
<% if (session.getAttribute("normal") != null) {
        user = (User) session.getAttribute("normal");
        request.setAttribute("user", user);
    } else if (session.getAttribute("company") != null) {
        user = (User) session.getAttribute("company");
        request.setAttribute("user", user);
    } else {
        response.sendRedirect("../home/index.jsp");
    }%>

<%
    int userId = 0;
    User Visited = new User();
    if (request.getAttribute("visited_user") != null) {
        userId = Integer.parseInt(request.getAttribute("visited_user") + "");
        Visited = new UserController().getUser(userId);
    }

%>




<div class="container-fluid">
    <div class="row">
        <div class="profile-head">
            <div class="profiles col-xs-8 col-xs-push-2  col-sm-10 col-sm-push-1 thumbnail">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="row">
                        <img class="img-thumbnail" height="200" width="200" src="../jspfragments/retrive_image.jsp?userId=<%if (userId == 0) {%>
                             <%= user.getUser_id()%>  
                             <% } else {%>
                             <%= Visited.getUser_id()%>  
                             <% }%>" alt="my photo" />
                    </div>
                </div>
                <div class="center-block col-md-9">
                    <div class="col-md-12 col-sm-6 col-xs-12 text-center" style="top: 20px">
                        <h2>
                            <span class="center-block text-center"> 
                                <%if (userId == 0) {%>
                                <%= user.getUserFullname()%>  
                                <% } else {%>
                                <%= Visited.getUserFullname()%>  
                                <% }%>
                            </span>
                        </h2>
                        <div >

                            <ul class="center-block" >

                                <li ><h4>Email : <%if (userId == 0) {%>
                                        <%= user.getUser_email()%>  
                                        <% } else {%>
                                        <%= Visited.getUser_email()%>  
                                        <% }%>
                                    </h4>
                                </li>
                                <li>
                                    <% int iddddd = 0; %>
                                    <h4>Address : <%if (userId == 0) {%>
                                        <%= user.getUser_location()%>  
                                        <% } else {%>
                                        <%= Visited.getUser_location()%>  
                                        <% }%>
                                    </h4>
                                </li>
                                <li>
                                    <h4>Phone :  <%if (userId == 0) {%>
                                        <%= user.getUser_phone()%>  
                                        <% } else {%>
                                        <%= Visited.getUser_phone()%>  
                                        <% }%>
                                    </h4>
                                </li>


                            </ul>
                        </div><!--col-md-8 col-sm-8 col-xs-12 close-->
                        <div class="col-xs-12 visible-lg" style="top: 70px">
                            <%if (userId != 0) {%>
                            <button class="col-md-push-8 col-md-3 col-xs-6 btn btn-primary" >
                                <% UserController uc = new UserController();
                                    boolean isFollowed;
                                    if (user.getUserType() == 0) {
                                        isFollowed = uc.isFollowing(user.getUser_id(), Visited.getUser_id());
                                    } else {
                                        isFollowed = uc.isFollowing(Visited.getUser_id(), user.getUser_id());
                                    }

                                    if (isFollowed) {
                                        out.print("Following");
                                    } else {
                                        out.print("Following");
                                    }

                                %>
                            </button>

                            <% }%>


                        </div>

                    </div>

                </div>
            </div>
        </div><!--profile-head close-->
    </div>
</div>



