<%@ page import="java.sql.*" %>
<%@ page import="com.quiz.DatabaseConnection" %>

<html>
<head>
    <title>Login or Register</title>
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
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        h2 {
            color: #0d47a1; /* Dark blue */
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #90caf9; /* Light blue border */
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #0d47a1; /* Dark blue */
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #01579b; /* Even darker blue */
        }
        .message {
            margin-top: 20px;
            color: #388e3c; /* Green */
            font-size: 16px;
        }
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Login</h2>
            <form action="LoginServlet" method="post">
                <input type="text" name="username" placeholder="Username" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                <input type="submit" value="Login">
            </form>
        </div>

        <div class="form-container">
            <h2>Register</h2>
            <form action="register.jsp" method="post">
                <input type="text" name="username" placeholder="Username" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                <input type="submit" value="Register">
            </form>
        </div>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("INSERT INTO students (username, password) VALUES (?, ?)");
                ps.setString(1, username);
                ps.setString(2, password);
                ps.executeUpdate();
                out.println("<p class='message'>Registration Successful!</p>");
                conn.close();
            }
        %>
    </div>
</body>
</html>
