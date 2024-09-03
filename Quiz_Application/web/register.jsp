<%@ page import="java.sql.*" %>
<%@ page import="com.quiz.DatabaseConnection" %>

<html>
<head>
    <title>Register</title>
    <style>
        body {
            background-color: #e3f2fd; /* Light blue background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        h2 {
            color: #0d47a1; /* Dark blue */
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #0d47a1; /* Dark blue */
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #90caf9; /* Light blue border */
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            width: calc(100% - 22px);
            padding: 10px;
            background-color: #0d47a1; /* Dark blue */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }
        input[type="submit"]:hover {
            background-color: #01579b; /* Even darker blue */
        }
        .login-link {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #0d47a1; /* Dark blue */
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .login-link:hover {
            background-color: #01579b; /* Even darker blue */
        }
        .message {
            color: #388e3c; /* Green */
            font-size: 16px;
            margin-top: 20px;
        }
        .error {
            color: #d32f2f; /* Red */
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form action="register.jsp" method="post">
        <h2>Register</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Register">
        <br>
        <br>
        <a href="login.jsp" class="login-link">Login</a>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String message = null;

            if (username != null && password != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                try {
                    conn = DatabaseConnection.getConnection();
                    ps = conn.prepareStatement("INSERT INTO students (username, password) VALUES (?, ?)");

                    ps.setString(1, username);
                    ps.setString(2, password);

                    int rowsAffected = ps.executeUpdate();
                    
                    if (rowsAffected > 0) {
                        message = "Registration Successful!";
                    } else {
                        message = "Registration Failed!";
                    }
                } catch (SQLException e) {
                    message = "Error: " + e.getMessage();
                    e.printStackTrace();
                } finally {
                    try {
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                if (message != null) {
                    if (message.equals("Registration Successful!")) {
                        out.println("<p class='message'>" + message + "</p>");
                    } else {
                        out.println("<p class='error'>" + message + "</p>");
                    }
                }
            }
        %>
    </form>
</body>
</html>

