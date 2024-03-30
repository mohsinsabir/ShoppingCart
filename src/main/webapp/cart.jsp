<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.assignment02.entity.product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%--
  Created by IntelliJ IDEA.
  User: Mohsin sabir
  Date: 13/03/2024
  Time: 3:58 pm
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function updateQuantity(productId, newQuantity) {
            $.ajax({
                type: "POST",
                url: "updateCart",
                data: {
                    id: productId,
                    quantity: newQuantity
                },
                success: function(response) {
                    $('#totalPrice_' + productId).text('$' + response.newPrice);
                }
            });
        }
    </script>
    <style>
        .button-33 {
            background-color: #464d48;
            border-radius: 100px;
            box-shadow: rgba(4, 10, 13, 0.2) 0 -25px 18px -14px inset,rgba(4, 10, 13, 0.2) 0 1px 2px,rgba(4, 10, 13, 0.2) 0 2px 4px,rgba(4, 10, 13, 0.2) 0 4px 8px,rgba(4, 10, 13, 0.2) 0 8px 16px,rgba(4, 10, 13, 0.2) 0 16px 32px;
            color: rgb(232, 232, 232);
            cursor: pointer;
            display: inline-block;
            font-family: CerebriSans-Regular,-apple-system,system-ui,Roboto,sans-serif;
            padding: 4px 20px;
            text-align: center;
            text-decoration: none;
            transition: all 250ms;
            border: 0;
            font-size: 16px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }

        .button-33:hover {
            box-shadow: rgba(203, 209, 215, 0.35) 0 -25px 18px -14px inset,rgba(203, 209, 215, 0.35) 0 1px 2px,rgba(203, 209, 215, 0.35) 0 2px 4px,rgba(203, 209, 215, 0.35) 0 4px 8px,rgba(203, 209, 215, 0.35) 0 8px 16px,rgba(203, 209, 215, 0.35) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }
    </style>
</head>
<body>
<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="row">

                            <div class="col-lg-7">
<%--                                ${pageContext.request.contextPath}/productCatalog--%>
                                <h5 class="mb-3"><a href="index.jsp" class="text-body"><i
                                        class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                <hr>

                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div>
                                        <p class="mb-1">Shopping cart</p>
<%--                                        <p class="mb-0">You have 4 items in your cart</p>--%>
                                    </div>
                                    <%
                                        //        HttpSession session = request.getSession();
                                        ArrayList<product> cart = (ArrayList<product>) session.getAttribute("cart");
                                        if (cart != null && !cart.isEmpty()) {
                                            for (product product : cart) {
                                    %>
                                    <!-- <div>
                                      <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                          class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                                    </div> -->
                                </div>

                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <div>
                                                    <img
                                                            src="<%= product.getImage() %>"
                                                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                </div>
                                                <div class="ms-3">
                                                    <h5><%= product.getProductName() %></h5>
<%--                                                    <p class="small mb-0">256GB, Navy Blue</p>--%>
                                                </div>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="input-group mb-2">
                                                    <form>
                                                        <input type="number" id="quantity_<%= product.getProductId() %>" value="<%= product.getQuantity() %>" onchange="updateQuantity(<%= product.getProductId() %>, this.value)" style="width: 30%; float: right">
                                                    </form>
                                                </div>
                                                <div style="width: 80px;">
                                                    <h5 class="mb-2" id="totalPrice_<%= product.getProductId() %>">$<%=product.getPrice() * product.getQuantity() %></h5>
                                                </div>
                                                <form action="removeFromCart" method="post">
                                                    <input type="hidden" name="id" value="<%= product.getProductId() %>">
                                                    <button type="submit" style="background: transparent; border: none"><img src="delete.png" alt="" class="mb-2"></button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    }
                                    %>
                                </div>




                            </div>
                            <div class="col-lg-5">
                                <div class="card bg-dark text-white rounded-4">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h5 class="mb-0">Card details</h5>
                                            <!-- <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                              class="img-fluid rounded-3" style="width: 45px;" alt="Avatar"> -->
                                        </div>

                                        <p class="small mb-2">Card type</p>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-visa fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-amex fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                                        <form class="mt-4">
                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                                       placeholder="Cardholder's Name" />
                                                <!-- <label class="form-label mt-1" for="typeName">Cardholder's Name</label> -->
                                            </div>

                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="" class="form-control form-control-lg" siez="17"
                                                       placeholder="Card Number" minlength="19" maxlength="19" />
                                                <!-- <label class="form-label" for="typeText">Card Number</label> -->
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="text" id="typeExp" class="form-control form-control-lg"
                                                               placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                                                        <label class="form-label" for="typeExp">Expiration</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="password" id="typeText" class="form-control form-control-lg"
                                                               placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                        <label class="form-label" for="typeText">Cvv</label>
                                                    </div>
                                                </div>
                                            </div>

                                        </form>

                                        <hr class="my-4">
                                        <%
                                            double total = 0;
                                            if (cart != null) {
                                                for (product product : cart) {
                                                    total += product.getPrice() * product.getQuantity();
                                                }
                                            }
                                        %>
                                        <div class="d-flex justify-content-between">
                                            <p class="mb-4">Subtotal</p>
                                            <p class="mb-4">$<%= total %></p>
                                        </div>

                                                                <div class="d-flex justify-content-between">
                                                                  <p class="mb-2">Shipping</p>
                                                                  <p class="mb-2">$20.00</p>
                                                                </div>

                                        <div class="d-flex justify-content-between mb-4">
                                          <p class="mb-2">Total(Incl. taxes)</p>
                                          <p class="mb-2">$<%= total + 20 %></p>
                                        </div>

                                        <button type="button" class="button-33">
                                            <div class="d-flex justify-content-between">
                                                <!-- <span>$4818.00</span> -->
                                                <span>Checkout <i class="fas fa-long-arrow-alt-left ms-2"></i></span>
                                            </div>
                                        </button>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
