# Kotlin CRUD with Postgres (SQL) database

## Implemented functions:

- **Web UI** - this is a web app, built using Ktor web framework.
- **Task list** - displays a list of tasks.
- **Task stats & metrics** - shows some general metrics about tasks (how many are completed, overdue, etc.).
- **Task filter & sort** - dashboard where it is possible to sort tasks by priority level, status and filter by due dates.
- **Create, edit, delete tasks** - UI views and functionality for full task CRUD.

## How to run?

**IMPORTANT NOTE:**
This program was developed in Intellij IDEA.

**Prerequisites:**

- You need to have either [kotlin compiler](https://kotlinlang.org/docs/command-line.html) installed on your machine, or you can run the app from Intellij IDEA. For more info, check out the: [official docs](https://www.jetbrains.com/help/idea/get-started-with-kotlin.html).
- Docker desktop needs to be installed to run the Postgres database in a container.
- Docker compose needs to be installed.

**Running programs:**

1. Before running the program, create a copy of file `postgres.example.yaml` and rename it to `postgres.yaml`.
2. It should have the following contents:
```yaml
version: '3.9'
services:
  postgres:
    environment:
      POSTGRES_USER: "<user>"
      POSTGRES_PASSWORD: "<pwd>"
      POSTGRES_DB: "tasks"
      POSTGRES_HOST: "localhost"
      POSTGRES_PORT: "5432"
```
3. Replace the `<user>` and `<pwd>` with your desired values. These would be picked up when building the Docker container.
4. Go to the root of the project and run `docker compose up --build` to and wait for it to start the Postgres container.
5. In Intellij IDEA top right corner, where the `run` button is located, select `ApplicationKt` as the run configuration and click `run` button.
6. Navigate to [http://127.0.0.1:8080](http://127.0.0.1:8080). 
7. If everything is OK, the index page of application should be visible.