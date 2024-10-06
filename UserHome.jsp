<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
</head>
<body>
    <h2>Select a Product</h2>
    <form action="ProductDetailsServlet" method="POST">
        <label for="products">Choose a product:</label>
        <select id="products" name="product">
            <option value="">--Select a product--</option>
            <option value="product1">Product 1</option>
            <option value="product2">Product 2</option>
            <option value="product3">Product 3</option>
            <option value="product4">Product 4</option>
            <option value="product5">Product 5</option>
            <!-- Add more products as needed -->
        </select>
        <button type="submit">View Details</button>
    </form>
</body>
</html>
