<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Character Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="viewDisplay.jsp" method="get">
    <input type="text" name="id" value="1"> <!-- Replace with the correct ID -->
    <button type="submit">View Details</button>
</form>

<div class="container mt-5">
    <h2>Character Details</h2>
    <%
        String character_id = request.getParameter("id");
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_arcane", "filip", "2016");
            
            // Use placeholder for the character_id parameter
            PreparedStatement ps = con.prepareStatement("SELECT * FROM arcane_characters WHERE id = ?");
            ps.setString(1, character_id); // Set the character_id dynamically
            
            ResultSet rs = ps.executeQuery();
            
            // Check if a result was returned
            if (rs.next()) {
    %>
    <table class="table table-bordered">
        <tr><th>ID</th><td><%= rs.getInt("id") %></td></tr>
        <tr><th>Name</th><td><%= rs.getString("name") %></td></tr>
        <tr><th>Age</th><td><%= rs.getInt("age") %></td></tr>
        <tr><th>Faction</th><td><%= rs.getString("faction") %></td></tr>
        <tr><th>Notes</th><td><%= rs.getString("notes") %></td></tr>
    </table>
    <a href="Display.jsp" class="btn btn-secondary">Back to List</a>
    <% 
            } else {
                out.println("<h4>No character found with this ID!</h4>");
            }
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    %>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
