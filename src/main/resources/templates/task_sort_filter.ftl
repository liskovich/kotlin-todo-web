<html>
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        /* table styles */
        table {
            /*border: 1px;*/
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
        }
        td {
            border-right: 1px solid #ddd;
        }
        td:last-child {
            border-right: none;
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
        $(function () {
            $("#fromDate, #toDate").datepicker({dateFormat: 'yy-mm-dd'});
        });
    </script>
</head>
<body>
<div class="container">
    <a href="/">Home</a>
    <br>
    <hr>
    <br>
    <h1>Sort and Filter Tasks</h1>
    <form method="get" action="/todos/filter-sort">
        <p>
            <label>
                From Date:
                <input type="text" id="fromDate" name="fromDate" value="${fromDate!" "}">
            </label>
            <label>
                To Date:
                <input type="text" id="toDate" name="toDate" value="${toDate!" "}">
            </label>
        </p>
        <p>
            <label>
                Priority Level:
                <select name="priorityLevel">
                    <option value=""<#if selectedPriorityLevel??> selected</#if>>Select Priority</option>
                    <option value="ASAP"<#if selectedPriorityLevel == "ASAP"> selected</#if>>ASAP</option>
                    <option value="HIGH"<#if selectedPriorityLevel == "HIGH"> selected</#if>>HIGH</option>
                    <option value="MEDIUM"<#if selectedPriorityLevel == "MEDIUM"> selected</#if>>MEDIUM</option>
                    <option value="LOW"<#if selectedPriorityLevel == "LOW"> selected</#if>>LOW</option>
                </select>
            </label>
            <label>
                Status:
                <select name="status">
                    <option value=""<#if selectedSatus??> selected</#if>>Select Status</option>
                    <option value="TODO"<#if selectedSatus == "TODO"> selected</#if>>TODO</option>
                    <option value="PROGRESS"<#if selectedSatus == "PROGRESS"> selected</#if>>PROGRESS</option>
                    <option value="DONE"<#if selectedSatus == "DONE"> selected</#if>>DONE</option>
                </select>
            </label>
        </p>
        <p>
            <input type="submit" value="Sort and Filter">
            <a href="/todos/dashboard">
                <button type="button">Reset Filter</button>
            </a>
        </p>
    </form>

    <table>
        <thead>
        <tr>
            <th>Task Name</th>
            <th>Description</th>
            <th>Due Date</th>
            <th>Priority</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <#list tasks as task>
            <tr>
                <td>
                    <a href="/todos/${task.id}">${task.title}</a>
                </td>
                <td>${task.description}</td>
                <td>${task.dueDate?datetime.iso[0..9]}</td>
                <td>
                    <span class="priority-box ${task.priorityLevel}-priority">${task.priorityLevel}</span>
                </td>
                <td>
                    <span class="status-box ${task.status}-status">${task.status}</span>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
</body>
</html>
