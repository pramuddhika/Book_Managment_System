<%@ page import="org.w3c.dom.Element" %>
<%@ include file="Header.jsp" %>

<div class="container mt-4">
    <h1>Edit Book</h1>

    <%
        Element employee = (Element) request.getAttribute("employee");
        if (employee != null) {
    %>
    <form action="UpdateBookServlet" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="employeeId" value="<%= employee.getAttribute("id") %>">

        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= employee.getElementsByTagName("Name").item(0).getTextContent() %>">
        </div>

        <div class="mb-3">
            <label for="author" class="form-label">Author Name:</label>
            <input type="text" class="form-control" id="author" name="author" value="<%= employee.getElementsByTagName("AuthorName").item(0).getTextContent() %>">
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Price:</label>
            <input type="number" class="form-control" id="price" name="price" value="<%= employee.getElementsByTagName("Price").item(0).getTextContent() %>">
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>

    <script>
        function validateForm() {
            var name = document.getElementById('name').value;
            var author = document.getElementById('author').value;
            var price = document.getElementById('price').value;

            // Perform your validation logic here
            if (name.trim() === '' || author.trim() === '' || price.trim() === '') {
                alert('All fields must be filled out');
                return false;
            }

            return true;
        }
    </script>

    <%
    } else {
    %>
    <p>Error: Book details not found.</p>
    <%
        }
    %>
</div>
</body>
</html>

