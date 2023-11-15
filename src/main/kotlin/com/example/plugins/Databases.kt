package com.example.plugins

import com.example.models.Task
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.ktor.server.config.yaml.*
import java.sql.*
import kotlinx.coroutines.*

fun Application.configureDatabases() {
    val dbConnection: Connection = connectToPostgres(embedded = false)
    val taskManager = TaskManager(dbConnection)

    routing {
        post("/tasks") {
            val task = call.receive<Task>()
            val id = taskManager.create(task)
            call.respond(HttpStatusCode.Created, id)
        }
        get("/tasks/{id}") {
            val id = call.parameters["id"]?.toInt() ?: throw IllegalArgumentException("Invalid ID")
            try {
                val task = taskManager.read(id)
                call.respond(HttpStatusCode.OK, task)
            } catch (e: Exception) {
                call.respond(HttpStatusCode.NotFound)
            }
        }
        put("/tasks/{id}") {
            val id = call.parameters["id"]?.toInt() ?: throw IllegalArgumentException("Invalid ID")
            val user = call.receive<Task>()
            taskManager.update(id, user)
            call.respond(HttpStatusCode.OK)
        }
        // Delete city
        delete("/tasks/{id}") {
            val id = call.parameters["id"]?.toInt() ?: throw IllegalArgumentException("Invalid ID")
            taskManager.delete(id)
            call.respond(HttpStatusCode.OK)
        }
    }
}

/**
 * Makes a connection to a Postgres database.
 *
 * In order to connect to your running Postgres process,
 * please specify the following parameters in your configuration file:
 * - postgres.url -- Url of your running database process.
 * - postgres.user -- Username for database connection
 * - postgres.password -- Password for database connection
 *
 * If you don't have a database process running yet, you may need to [download]((https://www.postgresql.org/download/))
 * and install Postgres and follow the instructions [here](https://postgresapp.com/).
 * Then, you would be able to edit your url,  which is usually "jdbc:postgresql://host:port/database", as well as
 * user and password values.
 *
 *
 * @param embedded -- if [true] defaults to an embedded database for tests that runs locally in the same process.
 * In this case you don't have to provide any parameters in configuration file, and you don't have to run a process.
 *
 * @return [Connection] that represent connection to the database. Please, don't forget to close this connection when
 * your application shuts down by calling [Connection.close]
 * */
fun Application.connectToPostgres(embedded: Boolean): Connection {
    Class.forName("org.postgresql.Driver")
    return if (embedded) {
        DriverManager.getConnection("jdbc:h2:mem:test;DB_CLOSE_DELAY=-1", "root", "")
    } else {
        val configs = YamlConfig("postgres.yaml")

        val dbName = configs?.property("services.postgres.environment.POSTGRES_DB")?.getString()
        val dbHost = configs?.property("services.postgres.environment.POSTGRES_HOST")?.getString()
        val dbPort = configs?.property("services.postgres.environment.POSTGRES_PORT")?.getString()
        val url = "jdbc:postgresql://$dbHost:$dbPort/$dbName"

        val user = configs?.property("services.postgres.environment.POSTGRES_USER")?.getString()
        val password = configs?.property("services.postgres.environment.POSTGRES_PASSWORD")?.getString()

        return DriverManager.getConnection(url, user, password)
    }
}
