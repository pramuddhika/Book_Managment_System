package com.example.demo7;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.example.demo7.Employee ;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

@WebServlet("/EmployeeDataServlet")
public class EmployeeDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employees = new ArrayList<>();

        // Parse the XML file
        String filePath = getServletContext().getRealPath("/") + "/employeeData.xml";
        Document doc = null;
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            doc = docBuilder.parse(new File(filePath));
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Create a list of Employee objects
        NodeList employeeNodes = doc.getElementsByTagName("employee");
        for (int i = 0; i < employeeNodes.getLength(); i++) {
            Element employeeElement = (Element) employeeNodes.item(i);

            String id = employeeElement.getAttribute("id");
            String name = employeeElement.getElementsByTagName("Name").item(0).getTextContent();
            String author = employeeElement.getElementsByTagName("AuthorName").item(0).getTextContent();

            int price = Integer.parseInt(employeeElement.getElementsByTagName("Price").item(0).getTextContent());

            Employee employee = new Employee(id, name, author, price);
            employees.add(employee);
        }

        // Store the list of employees in a request attribute
        request.setAttribute("employees", employees);

        // Forward the request to the JSP page
        request.getRequestDispatcher("EmployeeData.jsp").forward(request, response);
        //redirect
        //response.sendRedirect("EmployeeData.jsp");
    }
}