<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventory Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1a1a1a; /* Soothing black background */
            color: #f1f1f1; /* Light gray text for readability */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #2c2c2c; /* Slightly lighter background for the content area */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
        }

        h1, h2 {
            text-align: center;
            color: #ffffff; /* White color for headings */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #333333; /* Dark table background */
        }

        table, th, td {
            border: 1px solid #555555; /* Lighter border to distinguish cells */
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #444444; /* Slightly lighter black for table headers */
            color: #ffffff;
        }

        td {
            color: #dddddd; /* Light gray text for table data */
        }

        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
            display: inline-block;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"], input[type="number"] {
            padding: 10px;
            width: calc(100% - 22px);
            margin-bottom: 10px;
            background-color: #2c2c2c;
            color: white;
            border: 1px solid #555555;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            outline: none;
            border-color: #007bff;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Inventory Management</h1>

        <!-- Inventory List -->
        <h2>Current Inventory</h2>
        <table>
            <tr>
                <th>Item</th>
                <th>Quantity (in Kg)</th>
                <th>Price (per Kg)</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>Rice</td>
                <td>100</td>
                <td>₹50</td>
                <td>
                    <a href="updateInventory.jsp?item=Rice" class="btn">Update</a>
                    <a href="deleteInventory.jsp?item=Rice" class="btn">Delete</a>
                </td>
            </tr>
            <tr>
                <td>Daal</td>
                <td>50</td>
                <td>₹80</td>
                <td>
                    <a href="updateInventory.jsp?item=Daal" class="btn">Update</a>
                    <a href="deleteInventory.jsp?item=Daal" class="btn">Delete</a>
                </td>
            </tr>
            <!-- Add more items as necessary -->
        </table>

        <!-- Add New Inventory Item -->
        <h2>Add New Inventory Item</h2>
        <form action="AddInventoryServlet" method="post">
            <label for="item">Item Name:</label>
            <input type="text" id="item" name="item" placeholder="Enter item name" required>

            <label for="quantity">Quantity (in Kg):</label>
            <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required>

            <label for="price">Price (per Kg):</label>
            <input type="number" id="price" name="price" placeholder="Enter price" required>

            <input type="submit" value="Add Item">
        </form>
    </div>

</body>
</html>
