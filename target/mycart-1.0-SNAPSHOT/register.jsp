<%-- 
    Document   : register
    Created on : Feb 11, 2024, 11:51:49 AM
    Author     : giris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp"%>
        <!--        <style>
                body {
                    background-color: #f0f0f0; /* Add your preferred background color here */
                    }
                    style="border: 1px solid #000;
                    </style>-->
    </head>
    <body>
        <%@include file ="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    
                    <div class="card">
                        <%@include file="components/message.jsp"%>
                        <div class="card-body px-5">

                            <h3 class="text-center my-3">Sign Up Here !!</h3>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input  name ="user_name" type="text" class="form-control" id="name" placeholder="Enter here" >
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name ="user_email" type="email" class="form-control" id="email" placeholder="Enter here" >
                                </div>

                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input  name ="user_password" type="password" class="form-control" id="password" placeholder="Enter here" >
                                </div>

                                <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input  name ="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" >
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name ="user_address"  style="height:150px"class="form-control" placeholder="Enter yor Address"  ></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class ="btn btn-outline-success">Register</button>
                                    <button class ="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
