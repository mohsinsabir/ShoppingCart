package org.example.assignment02;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.assignment02.entity.product;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<product> products = new ArrayList<>();
//
//        // Add products to the list
//        products.add(new product(1, "CONTRASTING COLLAR JACKET", 53.55,"jacket02.jpg"));
//        products.add(new product(2, "ZARA DENIM JACKET", 59.99,"jacket1.jpg"));
//        products.add(new product(3, "STRIPED DENIM JACKET", 90.44, "jacket3.png"));
//        products.add(new product(4, "VARSITY BOMBER JACKET", 80.0,"jacket4.png"));
//
//        request.setAttribute("products", products);
//        request.getRequestDispatcher("/index.jsp").forward(request, response);
//    }

    public void destroy() {
    }
}