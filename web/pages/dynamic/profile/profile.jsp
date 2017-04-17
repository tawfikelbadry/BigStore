<%@page import="com.software.team.BigStore.model.SubCategory"%>
<!--Profile page-->

<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <title>Profile user</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="bootstrap-4.0.0-alpha.6-dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">

            .page-header {background:#ccc;margin:0;}

            .profile-head { height:300px; width:100%;background-color: rgb(255, 102, 0);float: left; position: relative;}
            .profile-head img { margin:0 auto; border-radius:5px; max-width: 100%; width: 100%;}
            .profile-head h5 {width: 100%;padding:5px 5px 0px 5px;text-align:justify;font-weight: bold;color: #555;font-size: 25px;text-transform:capitalize;
                              margin-bottom: 0;}
            .profile-head p {width: 100%;text-align: justify;padding:0px 5px 5px 5px;color: #555;font-size:17px;text-transform:capitalize;margin:0;}
            .profile-head a {width: 100%;text-align: center;padding: 10px 5px;color: #555;font-size: 15px;text-transform: capitalize;}

            .profile-head ul { list-style:none;padding: 0;}
            .profile-head ul li { display:block; color:#555;padding:5px;font-weight: 400;font-size: 15px;}
            .profile-head ul li:hover span { color:rgb(0, 4, 51);}
            .profile-head ul li span { color:#555;padding-right: 10px;}
            .profile-head ul li a { color:#555;}
            .profile-head h6 {width: 100%;text-align: center;font-weight: 100;color: #555;font-size: 15px;text-transform: uppercase;margin-bottom: 0;}

            .profiles{ top: 0px;}



            /*media query*/

            @media all and (max-width:768px){

                a.menu { display:block !important;margin: 9px 2px;float: right;color: rgba(255, 102, 0, 0.98); border:0px solid; background:none; font-size:30px;width:27px;position: relative;
                         cursor:pointer;}
                a.menu:hover, a.menu:focus { color:rgb(0, 4, 51);}

                .drop_menu1 { display: block;visibility: visible;width:250px;height:1000px;padding:5px 30px;position: absolute;right:0 !important;
                              background-color:#ffffff !important; transition:all ease 0.5s;border-top: 0px solid;cursor: pointer;}

            }

            @media all and (max-width:430px){
                .profile-head ul li {font-size: 12px !important;}

                .bio-table>tbody>tr>td {font-size: 13px;}

            }

            /*/..kksksks[sk[ss]]*/
            .productbox {
                background-color:#ffffff;
                padding:10px;
                margin:5px 0;
                border: 1px solid #cfcfcf;
                -moz-box-shadow: 2px 2px 4px 0px #cfcfcf;
                -webkit-box-shadow: 2px 2px 4px 0px #cfcfcf;
                -o-box-shadow: 2px 2px 4px 0px #cfcfcf;
                box-shadow: 2px 2px 4px 0px #cfcfcf;
                filter:progid:DXImageTransform.Microsoft.Shadow(color=#cfcfcf, Direction=134, Strength=4);
            }

            .producttitle {
                font-weight:bold;
                font-size:1.2em;
                padding:5px 0 5px 0;
            }

            .producttext {

            }

            .productprice {
                border-top:1px solid #dadada;
                padding-top:5px;
            }

            .pricetext {
                font-weight:bold;
                font-size:1.4em;
            }
        </style>
        <script src="jq.js"></script>
        <script src="bootstrap-4.0.0-alpha.6-dist/js/bootstrap.min.js"></script>
    </head>
    <body>

        <!-- include  Header -->

        <%@include file="../../header.jsp" %>


        <!--  include  profile information     -->

        <%@include file="../jspfragments/profilejsp/user_details.jsp" %>



        <br>


        <!--=========================Starting To Add product ===========================-->

        <div>
            <form method="post" action="http://localhost:8080/SoftwareProject/SaveProduct" enctype="multipart/form-data">

                <fieldset>




                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="product-name">product name</label>  
                        <div class="col-md-6">
                            <input id="name" name="product-name" type="text" placeholder="product name" class="form-control input-md" required="true">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="product-desc">Description</label>  
                        <div class="col-md-6">
                            <input id="email" name="product-desc" type="text" placeholder="write particular description for item" class="form-control input-md" required="true">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="product-price">price - unit</label>  
                        <div class="col-md-6">
                            <input id="company" name="product-price" type="text" placeholder=" 10 LE" class="form-control input-md" required="true">

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="category">category</label>
                        <div class="col-md-6">


                            <select id="selectbasic" name="category" class="form-control">
                                <% ArrayList<SubCategory> prs = pc.getSubCategories(); %>

                                <%for (SubCategory sub : prs) {%>
                                <option value="<%=sub.getSub_cat_id()%>"><%=sub.getCat_name()%></option>
                                <%}%>
                            </select>
                        </div>

                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Expired date</label>  
                        <div class="col-md-6 ">
                            <input id="textinput" name="expire-date" type="date" placeholder="" class="form-control input-md">
                            
                        </div>
                        <div class="clearfix "></div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="imgbutton">Product Image </label>
                        <div class="col-md-6" >
                            <input id="filebutton" name="imgbutton" class="input-file" type="file">
                        </div>
                    </div>


                    <br>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="singlebutton"></label>
                        <div class="col-md-4">
                            
                            <center> <input style="margin: 10px" class="btn btn-primary" type="submit" value="Add The product"></center>
                        </div>
                    </div>
                    <input name="userIdHidden" hidden="true" type="text" value="<%= user.getUser_id()%>" />


                </fieldset>
            </form>
        </div>

        <%@include file="../../footer.jsp" %>



        <script type="text/javascript">

        </script>
    </body>
</html>
