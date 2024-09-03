<%@ page import="java.sql.*" %>
<%@ page import="com.quiz.DatabaseConnection" %>

<html>
<head>
    <title>Quiz Result</title>
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
        p {
            font-size: 18px;
            color: #0d47a1; /* Dark blue */
            font-weight: 500;
        }
        .result {
            margin-top: 20px;
            font-size: 20px;
            color: #0d47a1; /* Dark blue */
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quiz Result</h2>

        <%
            Connection conn = DatabaseConnection.getConnection();
            int score = 0;
            try {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM questions");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int correctOption = rs.getInt("correct_option");
                    int selectedOption = Integer.parseInt(request.getParameter("q" + rs.getInt("id")));

                    if (correctOption == selectedOption) {
                        score++;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            out.println("<p class='result'>Your score: " + score + "</p>");
        %>
    </div>
</body>
</html>
