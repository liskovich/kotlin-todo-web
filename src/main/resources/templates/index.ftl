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
            max-width: 1000px;
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
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
        /* Task card styles */
        .task-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #f2f2f2;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .task-title {
            font-size: 18px;
            margin-bottom: 5px;
        }
        .task-description {
            margin-bottom: 10px;
        }
        .task-details {
            font-size: 14px;
            color: #555;
        }
        /* priority styles */
        .priority-box {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 3px;
            color: white;
            font-size: 12px;
            font-weight: bold;
            margin-right: 5px;
        }
        .ASAP-priority {
            background-color: red;
        }
        .HIGH-priority {
            background-color: lightcoral;
        }
        .MEDIUM-priority {
            background-color: gold;
        }
        .LOW-priority {
            background-color: green;
        }
        /* status styles */
        .status-box {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 3px;
            color: white;
            font-size: 12px;
            font-weight: bold;
            margin-right: 5px;
        }
        .DONE-status {
            background-color: darkgreen;
        }
        .PROGRESS-status {
            background-color: purple;
        }
        .TODO-status {
            background-color: blue;
        }
    </style>
    <script>
        function formatDate(isoDate) {
            const date = new Date(isoDate);
            const options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric'};
            return date.toLocaleDateString('en-US', options);
        }
    </script>
</head>
<body>
<div class="container">
    <div>
        <a href="/todos/create">Add a new task</a>
        <br>
        <hr>
        <br>
    </div>
    <div>
        <a href="/todos/dashboard">Go to detailed tasks DASHBOARD</a>
        <br>
        <hr>
        <br>
    </div>
    <h1>Tasks:</h1>
    <#list tasks?reverse as task>
        <div class="task-card">
            <h2 class="task-title">
                <a href="/todos/${task.id}">Task: ${task.title}</a>
            </h2>
            <p class="task-description">${task.description}</p>
            <p class="task-details">
                <span>
                    Due:
                    <script>document.write(formatDate('${task.dueDate}'))</script>
                </span>
                <br>
                <span>
                    Priority:
                    <span class="priority-box ${task.priorityLevel}-priority">${task.priorityLevel}</span>
                </span>
                <br>
                <span>
                    Status:
                    <span class="status-box ${task.status}-status">${task.status}</span>
                </span>
            </p>
        </div>
    </#list>
</div>
</body>
</html>
