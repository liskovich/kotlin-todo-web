package com.example.plugins

import com.example.models.DateTimeHelper
import com.example.models.PriorityLevel
import com.example.models.TaskRequest
import com.example.models.TaskStatus
import freemarker.cache.ClassTemplateLoader
import io.ktor.server.application.*
import io.ktor.server.freemarker.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.ktor.server.util.*
import java.sql.Connection
import java.time.LocalDateTime

fun Application.configureTemplating() {
    val dbConnection: Connection = connectToPostgres(embedded = false)
    val taskManager = TaskManager(dbConnection)

    install(FreeMarker) {
        templateLoader = ClassTemplateLoader(this::class.java.classLoader, "templates")
    }
    routing {
        get("/") {
            try {
                val tasks = taskManager.readAll()
                if (tasks.isEmpty()) {
                    call.respond(FreeMarkerContent("index_empty.ftl", model = null))
                } else {
                    call.respond(FreeMarkerContent("index.ftl", mapOf("tasks" to tasks)))
                }
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", model = null))
            }
        }
        get("/todos/create") {
            call.respond(FreeMarkerContent("task_create.ftl", model = null))
        }
        post("/todos") {
            try {
                val formParameters = call.receiveParameters()
                val createdTask = TaskRequest(
                    formParameters.getOrFail("title"),
                    formParameters.getOrFail("description"),
                    DateTimeHelper.convertToLocalDateTime(formParameters.getOrFail("dueDate")),
                    PriorityLevel.fromString(formParameters.getOrFail("priorityLevel")),
                    TaskStatus.fromString(formParameters.getOrFail("status"))
                )
                taskManager.create(createdTask)
                call.respondRedirect("/")
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", mapOf("errorText" to e.message)))
            }
        }
        get("/todos/{id}") {
            try {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val task = taskManager.read(id)
                call.respond(FreeMarkerContent("task_detail.ftl", mapOf("task" to task)))
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", mapOf("errorText" to e.message)))
            }
        }
        post("/todos/{id}/delete") {
            try {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                taskManager.delete(id)
                call.respondRedirect("/")
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", model = null))
            }
        }
        get("/todos/{id}/edit") {
            try {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val task = taskManager.read(id)
                call.respond(FreeMarkerContent("task_edit.ftl", mapOf("task" to task)))
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", mapOf("errorText" to e.message)))
            }
        }
        post("/todos/{id}/edit") {
            try {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val formParameters = call.receiveParameters()
                val updatedTask = TaskRequest(
                    formParameters.getOrFail("title"),
                    formParameters.getOrFail("description"),
                    DateTimeHelper.convertToLocalDateTime(formParameters.getOrFail("dueDate")),
                    PriorityLevel.fromString(formParameters.getOrFail("priorityLevel")),
                    TaskStatus.fromString(formParameters.getOrFail("status"))
                )
                taskManager.update(id, updatedTask)
                call.respondRedirect("/")
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", model = null))
            }
        }
        get("/todos/dashboard") {
            try {
                val tasks = taskManager.readAll()
                call.respond(FreeMarkerContent("task_sort_filter.ftl", mapOf(
                    "tasks" to tasks,
                    "fromDate" to "",
                    "toDate" to "",
                    "selectedPriorityLevel" to "",
                    "selectedSatus" to ""
                )))
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", model = null))
            }
        }
        get("/todos/filter-sort") {
            try {
                val fromDate = call.request.queryParameters["fromDate"]
                val toDate = call.request.queryParameters["toDate"]
                val priorityLevel = call.request.queryParameters["priorityLevel"]
                val status = call.request.queryParameters["status"]

                val tasks = taskManager.readAll()
                val filteredTasks = tasks.filter { task ->
                    (fromDate.isNullOrEmpty() || task.dueDate >= LocalDateTime.parse("${fromDate}T00:00"))
                            && (toDate.isNullOrEmpty() || task.dueDate <= LocalDateTime.parse("${toDate}T23:59"))
                            && (priorityLevel.isNullOrEmpty() || task.priorityLevel == PriorityLevel.fromString(priorityLevel))
                            && (status.isNullOrEmpty() || task.status == TaskStatus.fromString(status))
                }
                call.respond(FreeMarkerContent("task_sort_filter.ftl", mapOf(
                    "tasks" to filteredTasks,
                    "fromDate" to fromDate,
                    "toDate" to toDate,
                    "selectedPriorityLevel" to priorityLevel,
                    "selectedSatus" to status
                )))
            } catch (e: Exception) {
                println(e.message)
                call.respond(FreeMarkerContent("error.ftl", model = null))
            }
        }
    }
}