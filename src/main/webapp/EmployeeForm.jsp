
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo7.SaveDataServlet" %>

<%@ include file="Header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Book Information Form</h2>

    <form action="SaveDataServlet" method="post" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="employeeName" class="form-label">Name:</label>
            <input type="text" class="form-control" id="employeeName" name="employeeName" required>
            <div id="employeeNameError" class="text-danger"></div>
        </div>

        <div class="mb-3">
            <label for="authorName" class="form-label">Author Name:</label>
            <input type="text" class="form-control" id="authorName" name="authorName" required>
            <div id="departmentNameError" class="text-danger"></div>
        </div>

       <div class="mb-3">
            <label for="price" class="form-label">Price:</label>
            <input type="number" class="form-control" id="price" name="price" required>
            <div id="priceError" class="text-danger"></div>
        </div>

        <button type="submit" class="btn btn-primary">Save</button>
        <a href="SearchPage.jsp" class="btn btn-warning">Search Book</a>
    </form>

    <div class="mt-3">
        <%
            // Retrieve the session attribute
            String message = (String) session.getAttribute("message");

            // Check if the message is not null and not empty
            if (message != null && !message.isEmpty()) {
        %>
        <div class="alert alert-info" role="alert">
            <%= message %>
        </div>
        <%
                // Clear the session attribute after displaying the message
                session.removeAttribute("message");
            }
        %>
    </div>
</div>

<script>
    function validateForm() {
        var isValid = true;

        // Reset error messages
        document.getElementById("employeeNameError").innerHTML = "";
        document.getElementById("authorNameError").innerHTML = "";
        document.getElementById("priceError").innerHTML = "";

        // Validate employeeName
        var employeeName = document.getElementById("employeeName").value;
        if (employeeName.trim() === "") {
            document.getElementById("employeeNameError").innerHTML = "Name is required.";
            isValid = false;
        }

        // Validate authorName
        var authorName = document.getElementById("authorName").value;
        if (authorName.trim() === "") {
            document.getElementById("authorNameError").innerHTML = "Author Name is required.";
            isValid = false;
        }

        // Validate price
        var price = document.getElementById("price").value;
        if (isNaN(price) || parseFloat(price) <= 0) {
            document.getElementById("priceError").innerHTML = "Price must be a positive number.";
            isValid = false;
        }

        return isValid;
    }
</script>

</body>
</html>



