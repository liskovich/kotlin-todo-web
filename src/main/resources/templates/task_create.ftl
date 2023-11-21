<html>
<body>
<div>
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
