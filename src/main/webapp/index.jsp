<%@ page import="org.example.assignment02.entity.product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            $(".add-to-cart").click(function(event) {
                event.preventDefault();

                var form = $(this).closest("form");
                var data = form.serialize();

                $.ajax({
                    type: "POST",
                    url: form.attr('action'),
                    data: data,
                    success: function(response) {
                        $('#successModal').modal('show');
                    }
                });
            });
        });
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom px-2">
    <div class="container-fluid">
        <!-- <a class="navbar-brand" href="#" style="min-width:180px">
          <img style="height:64px" src="https://htmljstemplates.com/static_files/images/logos/new_icon_1.png" alt="new logo" />
        </a> -->
        <div class=" collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto d-none d-lg-inline-flex">
                <li class="nav-item mx-2">
                    <a class="nav-link" href="cart.jsp" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        <span class="ms-1 align-middle">Cart</span>
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link" href="#" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg>
                        <span class="ms-1 align-texttop">Login</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<img src="img01.png" class="img-fluid" alt="img01.png" style="height: 10%;">
<div class="row m-5">
    <%
        List<product> products = (List<product>) request.getAttribute("products");
        if (products != null) {
        for (product product : products) {
    %>
    <div class="col-md-3 col-sm-6">
        <form action="addToCart" method="post">
            <input type="hidden" name="id" value="<%= product.getProductId() %>">
            <input type="hidden" name="productName" value="<%= product.getProductName() %>">
            <input type="hidden" name="price" value="<%= product.getPrice() %>">
            <input type="hidden" name="image" value="<%= product.getImage() %>">
            <input type="hidden" name="totalPrice" value="<%= product.getTotalPrice() %>">

        <div class="product-grid">

            <div class="product-image">
                <a href="#" class="image">
                    <img src="<%=product.getImage()%>" alt="">
                </a>
                <span class="product-discount-label">-23%</span>
                <input type="submit" class="add-to-cart" data-product-id="<%=product.getProductId()%>" value="Add to Cart">
            </div>
            <div class="product-content">
                <h3 class="title"><a href="#"><%=product.getProductName()%></a></h3>
                <div class="price">$<%=product.getPrice()%> <span>$79.88</span>
                </div>
            </div>
        </div>
        </form>
    </div>
    <%
        }
        } else {
    %> <h3>No products found</h3>
    <%  }
    %>

</div>
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright &copy; Mohsin Sabir 2024
        </p>
    </div>
</footer>
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Success</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Product added to cart successfully!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>