# Resources

Here are some prompts and resources I used to build this app:

## Links

- [https://start.ktor.io](https://start.ktor.io) - to get a good starting point.
- [https://github.com/ktorio/ktor-samples](https://github.com/ktorio/ktor-samples) - a bunch of good examples how to work with ktor web framework
- [https://github.com/ktorio/ktor-samples/tree/main/kweet](https://github.com/ktorio/ktor-samples/tree/main/kweet) - the particular app where I learned about FreeMarker templates and rendering.
- [https://ktor.io/docs/creating-interactive-website.html](https://ktor.io/docs/creating-interactive-website.html) - an intro tutorial about ktor websites with FreeMarker templates.

## Prompts

I have selected the most interesting / productive prompts, where with relatively little provided info I already received rather quality answers.
However, of course, several tweaks and improvements had to be made.

**1.**
I have a following kotlin code to select ONE record by its id from the database table "tasks":
```kotlin
suspend fun read(id: Int): Task = withContext(Dispatchers.IO) {
    val statement = connection.prepareStatement("SELECT * FROM TASKS WHERE ID = ?")
    statement.setInt(1, id)
    val resultSet = statement.executeQuery()

    if (resultSet.next()) {
        val taskId = resultSet.getInt("ID")
        val title = resultSet.getString("TITLE")
        val description = resultSet.getString("DESCRIPTION")
        val dueDate = resultSet.getTimestamp("DUE_DATE")
        val priorityLevel = resultSet.getString("PRIORITY_LEVEL")
        val status = resultSet.getString("STATUS")
        return@withContext Task(
            taskId,
            title,
            description,
            DateTimeHelper.convertToLocalDateTime(dueDate),
            PriorityLevel.fromString(priorityLevel),
            TaskStatus.fromString(status)
        )
    } else {
        throw Exception("Record not found")
    }
}
```
Write me a query in similar manner, but which returns ALL the records from the database table "tasks"

<hr>

**2.**
Write me an additional template and a route which would allow me to sort the tasks by due date, priority level and status. It should display tasks in a table, where there is a link to each task in a separate column, it should by default display all tasks.

The option to select date should be a two date pickers. The options to select priority level and status should be dropboxes. The filter must apply when user clicks "Sort and filter". If any of the input or selects are empty, then ignore them.

<hr>

**3.**
I want to add additional boxes around the priority level and status, so that I can display colors. For example, if the priority is ASAP the box around its text should be red, if "MEDIUM" then orange, etc. The same with status

<hr>

**4.**
This is how a page for a specific task (details page) looks like:
```html
<div>
    <a href="/">Home</a>
    <br>
    <hr>
    <br>
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
```

Can you also add some styling / structure tweaks to it, so that it looks better

<hr>

**5.**
I need to add a new div in the index file which would contain some general statistics and metrics about the tasks. These would be like:
1. The number of completed tasks (with status DONE), out of total tasks
2. The number of overdue tasks (which don't have a status DONE, but whose dueDate is in past)
3. The number of tasks which are due the end of this week
4. The number of tasks which are due the end of next week
5. The number of tasks in progress (with status PROGRESS), out of total tasks

And any other stats you may find useful.

Structure this as a div which contains these metrics, with a visually appealing presentation and styles, and can be added to any page