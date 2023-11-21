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
    <h1>Edit task: ${task.title}</h1>
    <form method="post" action="/todos/${task.id}/edit">
        <p>
            <label>
                New task name
                <input type="text" name="title" value="${task.title}" required>
            </label>
        </p>
        <p>
            <label>
                New task description
                <textarea name="description" required>${task.description}</textarea>
            </label>
        </p>
        <p>
            <label>
                New task due date
                <input type="datetime-local" name="dueDate" value="${task.dueDate}" required>
            </label>
        </p>
        <p>
            <label>
                New task priority level
                <select name="priorityLevel" required>
                    <#list ['ASAP', 'HIGH', 'MEDIUM', 'LOW'] as level>
                        <option value="${level}"<#if task.priorityLevel == level> selected</#if>>${level}</option>
                    </#list>
                </select>
            </label>
        </p>
        <p>
            <label>
                New task status
                <select name="status" required>
                    <#list ['TODO', 'PROGRESS', 'DONE'] as stat>
                        <option value="${stat}"<#if task.status == stat> selected</#if>>${stat}</option>
                    </#list>
                </select>
            </label>
        </p>
        <p>
            <input type="submit" name="_action" value="Update">
        </p>
    </form>
</div>
</body>
</html>
