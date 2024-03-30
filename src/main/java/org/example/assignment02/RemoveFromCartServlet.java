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

@WebServlet(name = "RemoveFromCartServlet", value = "/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        ArrayList<product> cart = (ArrayList<product>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(p -> p.getProductId() == id);
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}