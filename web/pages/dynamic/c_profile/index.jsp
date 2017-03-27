<%@page import="com.software.team.BigStore.model.SubCategory"%>
<%@page import="com.software.team.BigStore.Controllers.ProductController"%>
<%@page import="com.software.team.BigStore.model.Prouduct_like"%>
<%@page import="com.software.team.BigStore.Controllers.UserController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.software.team.BigStore.model.Product"%>
<%@page import="com.software.team.BigStore.model.User"%>
<!--Kassem-->


<%@include file="/pages/header.jsp"%>

<!-- tawfik -->



<body>
    <div id="all">
        <head> <script src="c_js.js"></script></head>
        <head> <link href="c_css.css" rel="stylesheet"></head>
        <header class="all-1">
            <h1>Welcome In Your <span>Profile ^^</span></h1>
        </header>
        <div class="all-2">

            <!-- include user products -->
            <%@include file="../jspfragments/profilejsp/user_prouducts.jsp" %> 

        </div> 
        <div class="container">

            <h2>Adding New Product Now ^ </h2>
            <form action="http://localhost:8080/SoftwareProject/SaveProduct" class="form-horizontal" method="post" enctype="multipart/form-data">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Add Now </legend>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="singlebutton"></label>
                        <div class="col-md-4">
                            <button id="singlebutton" name="singlebutton" class="btn btn-success">add</button>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">product name</label>  
                        <div class="col-md-4">
                            <input id="textinput" name="product-name" type="text" placeholder="" class="form-control input-md">

                        </div>
                    </div>

                    <!-- Textarea -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textarea">description</label>
                        <div class="col-md-4">                     
                            <textarea  class="form-control" id="textarea" name="product-desc"></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">price - unit</label>  
                        <div class="col-md-4">
                            <input id="textinput" name="product-price" type="text" placeholder="" class="form-control input-md">

                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">category</label>
                        <div class="col-md-4">
                            <select id="selectbasic" name="category" class="form-control">
                                <% ArrayList<SubCategory> prs = pc.getSubCategories(); %>

                                <%for (SubCategory sub : prs) {%>
                                <option value="<%=sub.getSub_cat_id() %>"><%=sub.getCat_name() %></option>
                                <%}%>
                            </select>
                        </div>
                    </div>




                    <!-- File Button --> 
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="filebutton">Images </label>
                        <div class="col-md-4">
                            <input id="filebutton" name="imgbutton" class="input-file" type="file">
                        </div>
                    </div>



                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Expired date</label>  
                        <div class="col-md-4">
                            <input id="textinput" name="expire-date" type="date" placeholder="" class="form-control input-md">

                        </div>
                    </div>



                    <input name="userIdHidden" hidden="true" type="text" value="<%= user.getUser_id()%>" />





                </fieldset>


                </fieldset>
            </form>
        </div>
        <footer>  <%@include file="/pages/footer.jsp"%></footer>
    </div>

</body>

</html>
