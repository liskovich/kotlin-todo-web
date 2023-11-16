<html>
<body>
<h1>Tasks:</h1>
<a href="/todos/create">Add a new task</a>
<br>
<#list tasks?reverse as task>
    <h2>
        <a href="/todos/${task.id}">Task: ${task.title}</a>
    </h2>
    <p>${task.description}</p>
    <p>Due: ${task.dueDate}</p>
    <p>Priority: ${task.priorityLevel}</p>
    <p>Status: ${task.status}</p>
</#list>
</body>
</html>
