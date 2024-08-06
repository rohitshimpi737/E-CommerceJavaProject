<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entites.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entites.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not Logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;

    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not Admin ! Do not access this page ");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class ="container admin">

            <div class="container-fluid mt-3">

                <%@include file="components/message.jsp" %>
            </div>




            <div class="row mt-3">

                <!-- first column-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">
                        <div class ="card-body text-center">
                            <div class="container">
                                <img  style="max-width:125px;" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>
                            </div>
                            <h1>6756</h1>
                            <h1 class ="text-uppercase text-muted">User</h1>

                        </div>
                    </div>

                </div>

                <!-- second column-->
                <div class="col-md-4">

                    <div class="card">
                        <div class ="card-body text-center">
                            <div class="container">
                                <img  style="max-width:125px;" class="img-fluid " src="img/menu.png" alt="user_icon"/>
                            </div>
                            <h1>4943</h1>
                            <h1 class ="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>

                <!-- third column-->
                <div class="col-md-4">

                    <div class="card">
                        <div class ="card-body text-center">
                            <div class="container">
                                <img  style="max-width:125px;" class="img-fluid" src="img/delivery-box.png" alt="user_icon"/>
                            </div>
                            <h1>4564</h1>
                            <h1 class ="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>


            </div>

            <!--second row-->
            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-6">

                    <!--first box-->
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class ="card-body text-center">
                            <div class="container">
                                <img  style="max-width:125px;" class="img-fluid rounded-circle" src="img/math.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here To add new category</p>
                            <h1 class ="text-uppercase text-muted">Add Category</h1>

                        </div>
                    </div>
                </div>

                <!--second col-->
                <div class="col-md-6">

                    <!--second box-->
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class ="card-body text-center">
                            <div class="container">
                                <img  style="max-width:125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click here To add new product</p>
                            <h1 class ="text-uppercase text-muted">Add Product</h1>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--add category modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">


                            <input type="hidden" name="operation" value="addcategory"/>  
                            <div class="form-group">

                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>

                            </div>
                            <div class="form-group">

                                <textarea  style="height: 250px;" class="form-control"  name="catDescription" placeholder="Enter category description " required></textarea>
                            </div>

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end category modal-->



        <!--Product Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">


                            <input type="hidden" name="operation" value="addproduct"/>  
                            <div class="form-group">

                                <input type="text" class="form-control" name="pName" placeholder="Enter product name" required/>

                            </div>
                            <div class="form-group">

                                <textarea  style="height: 150px;" class="form-control"  name="pDescription" placeholder="Enter product description " required></textarea>

                            </div>

                            <div class="form-group">

                                <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required/>

                            </div>
                            <div class="form-group">

                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>

                            </div>
                            <div class="form-group">

                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>

                            </div>

                            <!--product category-->

                            <%                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();
                            %>

                            <div class="form-group">

                                <select name ="catId" class="form-control">
                                    <%
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                              
                                <%
                                    } %>
                                  </select>
                            </div>

                            <!--product photo-->

                            <div  class="form-control">

                                <label for="pPic">Select picture of product</label>
                                <br/>
                                <input type ="file" id="pPic" name="pPic" required/>
                            </div>

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end product modal-->
    </body>
</html>
