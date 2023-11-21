<html>
<head>
    <script>
        function formatDate(isoDate) {
            const date = new Date(isoDate);
            const options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric'};
            return date.toLocaleDateString('en-US', options);
        }
    </script>
</head>
<body>
<h1>Tasks:</h1>
<a href="/todos/create">Add a new task</a>
<br>
<hr>
<br>
<#list tasks?reverse as task>
    <h2>
        <a href="/todos/${task.id}">Task: ${task.title}</a>
    </h2>
    <p>${task.description}</p>
    <p>
        Due:
        <script>document.write(formatDate('${task.dueDate}'))</script>
    </p>
    <p>Priority: ${task.priorityLevel}</p>
    <p>Status: ${task.status}</p>
</#list>
</body>
</html>
