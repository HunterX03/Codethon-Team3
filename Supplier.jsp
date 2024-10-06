<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier Management</title>
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

        input[type="text"], input[type="tel"], input[type="email"] {
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

        input[type="text"]:focus, input[type="tel"]:focus, input[type="email"]:focus {
            outline: none;
            border-color: #007bff;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Supplier Management</h1>

        <!-- Supplier List -->
        <h2>Current Suppliers</h2>
        <table>
            <tr>
                <th>Supplier ID</th>
                <th>Supplier Name</th>
                <th>Contact Number</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
            <tr>
                <td>101</td>
                <td>Supplier One</td>
                <td>1234567890</td>
                <td>supplierone@example.com</td>
                <td>
                    <a href="updateSupplier.jsp?id=101" class="btn">Update</a>
                    <a href="deleteSupplier.jsp?id=101" class="btn">Delete</a>
                </td>
            </tr>
            <tr>
                <td>102</td>
                <td>Supplier Two</td>
                <td>0987654321</td>
                <td>suppliertwo@example.com</td>
                <td>
                    <a href="updateSupplier.jsp?id=102" class="btn">Update</a>
                    <a href="deleteSupplier.jsp?id=102" class="btn">Delete</a>
                </td>
            </tr>
            <!-- Add more suppliers as necessary -->
        </table>

        <!-- Add New Supplier -->
        <h2>Add New Supplier</h2>
        <form action="AddSupplierServlet" method="post">
            <label for="supplierId">Supplier ID:</label>
            <input type="text" id="supplierId" name="supplierId" placeholder="Enter supplier ID" required>

            <label for="supplierName">Supplier Name:</label>
            <input type="text" id="supplierName" name="supplierName" placeholder="Enter supplier name" required>

            <label for="contactNumber">Contact Number:</label>
            <input type="tel" id="contactNumber" name="contactNumber" placeholder="Enter contact number" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>

            <input type="submit" value="Add Supplier">
        </form>
    </div>

</body>
</html>
