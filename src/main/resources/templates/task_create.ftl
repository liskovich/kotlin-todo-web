<html>
<body>
<div>
    <h1>Create a new task</h1>
    <form method="post" action="/todos">
        <p>
            <label>
                New task name
                <input type="text" name="title">
            </label>
        </p>
        <p>
            <label>
                New task description
                <textarea name="description"></textarea>
            </label>
        </p>
        <p>
            <label>
                New task due date
                <input type="datetime-local" name="dueDate">
            </label>
        </p>

        <#-- TODO: make these as dropdown menus -->
        <p>
            <label>
                New task priority level
                <input type="text" name="priorityLevel">
            </label>
        </p>
        <p>
            <label>
                New task status
                <input type="text" name="status">
            </label>
        </p>
        <p>
            <input type="submit" name="_action" value="Create">
        </p>
    </form>
</div>
</body>
</html>
