package com.example.models

import java.sql.Timestamp
import java.time.LocalDateTime

class DateTimeHelper {
    companion object {
        fun convertToSqlTimestamp(localDateTime: LocalDateTime): Timestamp {
            return Timestamp.valueOf(localDateTime)
        }

        fun convertToLocalDateTime(sqlTimestamp: Timestamp): LocalDateTime {
            return sqlTimestamp.toLocalDateTime()
        }
    }
}
