package com.example.models

import com.example.plugins.LocalDateTimeSerializer
import kotlinx.serialization.Contextual
import kotlinx.serialization.Serializable
import java.time.LocalDateTime

@Serializable
data class Task(
    val title: String,
    val description: String,
    @Serializable(with = LocalDateTimeSerializer::class)
    @Contextual
    val dueDate: LocalDateTime,
    val priorityLevel: PriorityLevel,
    val status: TaskStatus)

@Serializable
enum class PriorityLevel {
    LOW, MEDIUM, HIGH, ASAP;

    companion object {
        fun fromString(value: String): PriorityLevel {
            return try {
                valueOf(value)
            } catch (e: IllegalArgumentException) {
                LOW // default
            }
        }
    }
}

@Serializable
enum class TaskStatus {
    TODO, PROGRESS, DONE;

    companion object {
        fun fromString(value: String): TaskStatus {
            return try {
                TaskStatus.valueOf(value)
            } catch (e: IllegalArgumentException) {
                TODO // default
            }
        }
    }
}