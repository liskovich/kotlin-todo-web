<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h3 {
            margin: 0;
        }
        p {
            margin-bottom: 10px;
        }
        /* Style links and buttons */
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
        input[type="submit"], input[type="button"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <a href="/">Home</a>
    <br>
    <hr>
    <br>
    <h1>Create a new task</h1>
    <form method="post" action="/todos" onsubmit="return validateDate()">
        <p>
            <label>
                Task name
                <input type="text" name="title" required>
            </label>
        </p>
        <p>
            <label>
                Task description
                <textarea name="description" required></textarea>
            </label>
        </p>
        <p>
            <label>
                Task due date
                <input type="datetime-local" name="dueDate" id="dueDate" required>
            </label>
            <span id="dateError" style="color: red; display: none;">Please select a date in the future</span>
        </p>
        <p>
            <label>
                Task priority level
                <select name="priorityLevel" required>
                    <option value="">Select Priority</option>
                    <option value="ASAP">ASAP</option>
                    <option value="HIGH">HIGH</option>
                    <option value="MEDIUM">MEDIUM</option>
                    <option value="LOW">LOW</option>
                </select>
            </label>
        </p>
        <p>
            <label>
                Task status
                <select name="status" required>
                    <option value="">Select Status</option>
                    <option value="TODO">TODO</option>
                    <option value="PROGRESS">PROGRESS</option>
                    <option value="DONE">DONE</option>
                </select>
            </label>
        </p>
        <p>
            <input type="submit" name="_action" value="Create">
        </p>
    </form>
</div>
<script>
    function validateDate() {
        const inputDate = new Date(document.getElementById("dueDate").value);
        const now = new Date();

        if (inputDate < now) {
            document.getElementById("dateError").style.display = "block";
            return false;
        } else {
            document.getElementById("dateError").style.display = "none";
            return true;
        }
    }
</script>
</body>
</html>
