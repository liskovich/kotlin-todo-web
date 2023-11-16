package com.example.models

import java.sql.Timestamp
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class DateTimeHelper {
    companion object {
        fun convertToSqlTimestamp(localDateTime: LocalDateTime): Timestamp {
            return Timestamp.valueOf(localDateTime)
        }

        fun convertToLocalDateTime(sqlTimestamp: Timestamp): LocalDateTime {
            return sqlTimestamp.toLocalDateTime()
        }

        fun convertToLocalDateTime(dateString: String): LocalDateTime {
            val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")
            return LocalDateTime.parse(dateString, formatter)
        }
    }
}
