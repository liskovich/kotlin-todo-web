<html>
<body>
<div>
    <h1>Edit task: ${task.title}</h1>
    <form method="post" action="/todos/${task.id}/edit">
        <p>
            <label>
                New task name
                <input type="text" name="title" value="${task.title}">
            </label>
        </p>
        <p>
            <label>
                New task description
                <textarea name="description">${task.description}</textarea>
            </label>
        </p>
        <p>
            <label>
                New task due date
                <input type="datetime-local" name="dueDate" value="${task.dueDate}">
            </label>
        </p>

        <#-- TODO: make these as dropdown menus -->
        <p>
            <label>
                New task priority level
                <input type="text" name="priorityLevel" value="${task.priorityLevel}">
            </label>
        </p>
        <p>
            <label>
                New task status
                <input type="text" name="status" value="${task.status}">
            </label>
        </p>
        <p>
            <input type="submit" name="_action" value="Update">
        </p>
    </form>
</div>
</body>
</html>
