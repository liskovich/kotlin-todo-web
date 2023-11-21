<html>
<head>
    <script>
        function formatDate(isoDate) {
            const date = new Date(isoDate);
            const options = { year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric' };
            return date.toLocaleDateString('en-US', options);
        }
    </script>
</head>
<body>
<h1>Task: ${task.title}</h1>
<div>
    <h3>
        <script>document.write(formatDate('${task.dueDate}'))</script>
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
