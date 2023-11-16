<html>
<body>
<h1>Task: ${task.title}</h1>
<div>
    <h3>
        ${task.dueDate}
    </h3>
    <p>Priority: ${task.priorityLevel}</p>
    <p>Status: ${task.status}</p>
    <hr>
    <p>${task.description}</p>
    <hr>
    <p>
        <a href="/todos/${task.id}/edit">Edit task</a>
    </p>
    <form method="post" action="/todos/${task.id}/delete">
        <input type="hidden" name="_method" value="delete">
        <input type="submit" value="Delete task">
    </form>
</div>
</body>
</html>
