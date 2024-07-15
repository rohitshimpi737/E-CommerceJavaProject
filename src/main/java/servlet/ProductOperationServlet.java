package servlet;

import com.mycompany.mycart.dao.CategoryDao;
import com.mycompany.mycart.dao.ProductDao;
import com.mycompany.mycart.entites.Category;
import com.mycompany.mycart.entites.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // this servlet do two works 
            // add category
            // add product
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                // add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
              Category category= new Category();
              category.setCategoryTitle(title);
              category.setCategoryDescription(description);
              
              CategoryDao  categoryDao = 
                      new CategoryDao(FactoryProvider.getFactory());
             int catId= categoryDao.saveCategory(category);
              
//             out.println("Category Saved");
              HttpSession httpSession= request.getSession();
              httpSession.setAttribute("message","Category addes successfully :" +catId);
              response.sendRedirect("admin.jsp");
              return;
              // category database
              
              
            } 
            else if (op.trim().equals("addproduct")) {

                // add product
                
                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDescription");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                
                Part part=request.getPart("pPic");
                
                Product product = new Product();
               
                product.setpName(pName);
                product.setpDesc(pDesc);
                product.setpPrice(pPrice);
                product.setpDiscount(pDiscount);
                product.setpQuantity(pQuantity);
                product.setpPhoto(part.getSubmittedFileName());
                
                // get category object by id 
                 CategoryDao  categoryDao = 
                      new CategoryDao(FactoryProvider.getFactory());
                Category category= categoryDao.getCategoryById(catId);
                 
                product.setCategory(category);
              
                // 
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                
                pdao.saveProduct(product);
                
                //pic upload 
                
//                find out the to upload the photo 
               String path= request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
               System.out.println(path);
                
               try{
                   
      
               // upload image 
               
               FileOutputStream fos= new FileOutputStream(path);
               InputStream  is= part.getInputStream();
                
               byte []data = new byte[is.available()];
               is.read(data);
               
               
               // wring the data 
               fos.write(data);
               fos.close();
               
               }
               catch(Exception e){
                   e.printStackTrace();
               }
//                out.println("product save successfull");
              HttpSession httpSession= request.getSession();
              httpSession.setAttribute("message","Product is  added successfully");
              response.sendRedirect("admin.jsp");
              return;
            }  

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
