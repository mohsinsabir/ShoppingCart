package org.example.assignment02;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.assignment02.entity.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(filterName = "ProductFilter", urlPatterns = {"/*"})
public class ProductFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        List<product> products = new ArrayList<>();

        products.add(new product(1, "CONTRASTING COLLAR JACKET", 53.0,"jacket02.jpg"));
        products.add(new product(2, "ZARA DENIM JACKET", 59.0,"jacket1.jpg"));
        products.add(new product(3, "STRIPED DENIM JACKET", 90.0, "jacket3.png"));
        products.add(new product(4, "VARSITY BOMBER JACKET", 80.0,"jacket4.png"));

        httpRequest.setAttribute("products", products);

        chain.doFilter(httpRequest, httpResponse);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}