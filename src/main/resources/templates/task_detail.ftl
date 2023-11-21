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
        .details-section {
            margin-top: 20px;
        }
        .details-section p {
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
    <a href="/">Home</a>
    <hr>
    <h1>Task: ${task.title}</h1>
    <h3>
        <script>document.write(formatDate('${task.dueDate}'))</script>
    </h3>
    <p>
        Priority:
        <span class="priority-box ${task.priorityLevel}-priority">${task.priorityLevel}</span>
    </p>
    <p>
        Status:
        <span class="status-box ${task.status}-status">${task.status}</span>
    </p>
    <hr>
    <div class="details-section">
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
</div>
</body>
</html>
