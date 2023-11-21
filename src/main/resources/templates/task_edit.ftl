<html>
<body>
<div>
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
