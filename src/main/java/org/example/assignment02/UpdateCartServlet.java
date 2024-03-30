package org.example.assignment02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.assignment02.entity.product;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UpdateCartServlet", value = "/updateCart")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        ArrayList<product> cart = (ArrayList<product>) session.getAttribute("cart");
        double newPrice = 0;
        if (cart != null) {
            for (product p : cart) {
                if (p.getProductId() == id) {
                    p.setQuantity(quantity);
                    newPrice = p.getPrice() * quantity;
                    break;
                }
            }
        }
        session.setAttribute("cart", cart);

        // Manually create a JSON string
        String json = "{\"newPrice\":" + newPrice + "}";

        // Send the new price back to the client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}