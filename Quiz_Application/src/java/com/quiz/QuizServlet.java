package com.quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QuizServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = DatabaseConnection.getConnection();
        PrintWriter out = response.getWriter();

        response.setContentType("text/html");
        
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM questions");
            ResultSet rs = ps.executeQuery();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Quiz</title>");
            out.println("<style>");
            out.println("body {");
            out.println("    background-color: #e3f2fd; /* Light blue background */");
            out.println("    font-family: Arial, sans-serif;");
            out.println("    display: flex;");
            out.println("    justify-content: center;");
            out.println("    align-items: center;");
            out.println("    height: 100vh;");
            out.println("    margin: 0;");
            out.println("}");
            out.println(".container {");
            out.println("    background-color: #ffffff;");
            out.println("    padding: 30px;");
            out.println("    border-radius: 8px;");
            out.println("    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);");
            out.println("    width: 400px;");
            out.println("    text-align: left;");
            out.println("}");
            out.println("h2 {");
            out.println("    color: #0d47a1; /* Dark blue */");
            out.println("    font-size: 24px;");
            out.println("    margin-bottom: 20px;");
            out.println("}");
            out.println("p {");
            out.println("    font-size: 18px;");
            out.println("    color: #0d47a1; /* Dark blue */");
            out.println("    margin-bottom: 10px;");
            out.println("}");
            out.println("input[type='radio'] {");
            out.println("    margin-right: 10px;");
            out.println("}");
            out.println("input[type='submit'] {");
            out.println("    width: 100%;");
            out.println("    padding: 10px;");
            out.println("    background-color: #0d47a1; /* Dark blue */");
            out.println("    color: white;");
            out.println("    border: none;");
            out.println("    border-radius: 5px;");
            out.println("    cursor: pointer;");
            out.println("    font-size: 16px;");
            out.println("    margin-top: 20px;");
            out.println("}");
            out.println("input[type='submit']:hover {");
            out.println("    background-color: #0b3d91; /* Slightly darker blue */");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h2>Quiz Questions</h2>");
            out.println("<form action='result.jsp' method='post'>");

            while (rs.next()) {
                out.println("<p>" + rs.getString("question") + "</p>");
                out.println("<input type='radio' name='q" + rs.getInt("id") + "' value='1'>" + rs.getString("option1") + "<br>");
                out.println("<input type='radio' name='q" + rs.getInt("id") + "' value='2'>" + rs.getString("option2") + "<br>");
                out.println("<input type='radio' name='q" + rs.getInt("id") + "' value='3'>" + rs.getString("option3") + "<br>");
                out.println("<input type='radio' name='q" + rs.getInt("id") + "' value='4'>" + rs.getString("option4") + "<br>");
            }

            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

