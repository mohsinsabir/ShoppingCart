package org.example.assignment02;

import org.example.assignment02.entity.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddToCartServlet", value = "/addToCart")
public class AddToCartServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        int id = Integer.parseInt(request.getParameter("id"));
        String image = request.getParameter("image");

        product Product = new product(id, productName, price, image);

        HttpSession session = request.getSession();
        ArrayList<product> cart = (ArrayList<product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        boolean found = false;
        for (product p : cart) {
            if (p.getProductId() == id) {
                p.setQuantity(p.getQuantity() + 1);
                found = true;
                break;
            }
        }
        if (!found) {
            cart.add(Product);
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("index.jsp");
    }
}
