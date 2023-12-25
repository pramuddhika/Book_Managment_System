<%@ page import="com.example.demo7.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>

<div class="container mt-4">
    <form action="SearchServlet" method="post" onsubmit="return validateSearchForm()">
        <div class="mb-3">
            <label for="bookName">Name:</label>
            <input type="text" class="form-control" id="bookName" name="bookName">
            <div id="bookNameError" class="text-danger"></div>
        </div>
        <button class="btn btn-primary" type="submit">Search Book</button>
    </form>

    <!-- Display Search Results -->
    <div class="mt-4">
        <h2>Search Results:</h2>

        <%
            List<Employee> employees = (List<Employee>) request.getAttribute("employees");

            if (employees != null && !employees.isEmpty()) {
        %>
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Author Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Employee employee : employees) {
            %>
            <tr>
                <td><%= employee.getId() %></td>
                <td><%= employee.getName() %></td>
                <td><%= employee.getAuthorName() %></td>
                <td><%= employee.getPriceValue() %></td>
                <td>
                    <form action="EditBookServlet" method="post" style="display: inline-block;">
                        <input type="hidden" name="employeeId" value="<%= employee.getId() %>">
                        <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                    </form>
                    <form action="DeleteBookServlet" method="post" style="display: inline-block;">
                        <input type="hidden" name="employeeId" value="<%= employee.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <p class="mt-3">No book found.</p>
        <%
            }
        %>
    </div>
</div>

<script>
    function validateSearchForm() {
        var isValid = true;

        // Reset error message
        document.getElementById("employeeNameError").innerHTML = "";

        // Validate bookName
        var bookName = document.getElementById("bookeName").value;
        if (bookName.trim() === "") {
            document.getElementById("bookNameError").innerHTML = "Name is required.";
            isValid = false;
        }

        return isValid;
    }
</script>

</body>
</html>
