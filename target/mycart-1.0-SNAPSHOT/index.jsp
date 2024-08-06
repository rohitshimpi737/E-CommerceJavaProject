<%@page import="com.mycompany.mycart.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entites.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file ="components/navbar.jsp" %>

    <div class="row mt-3 mx-2">
            <%  ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = dao.getAllProducts();
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();

            %>
            <!--show categories--> 
            <div class="col-md-2">
                <div class ="list-group">
                    <a href="#" class ="list-group-item list-group-item-action active">
                        All products  </a> 
                        <% for (Category category : clist) { %>
                    <a href="#" class ="list-group-item list-group-item-action">
                        <%=category.getCategoryTitle()%> </a> 
                    <% } %>

                </div>
            </div>
                    
                    
            <!--show products--> 
        <div class="col-md-8">
          <div class="row-mt-4">
              <div class="col-md-12">
                <div class="card-columns">
                    <% for (Product e : list) {%>   
                     <div class="card">
                         
                         <div class="container text-center">
                             <img src="img/products/<%= e.getpPhoto()%>" style="max-height:270px; max-width: 100%; width: auto;" class= "card-img-top" alt="...">
     
                         </div> 
                            <div class="card-body">
                              <h5 class ="card-title"> <%= e.getpName()%> </h5>
                              <p class="card-text">
                               <%=Helper.get10Words(e.getpDesc())%>
                               </p>
                            </div>
                             <div class ="card-footer">
                                <button class= "btn custom-bg text-white">
                                    Add to cart
                                </button>
                                <button class= "btn btn-outline-primary">
                                    &#8377;<%=e.getpPrice()%>
                                </button>
                            </div>
                    </div>
                  <%}%>
                </div>
             </div>
          </div>
        </div>
    </div>
 </body>
</html>