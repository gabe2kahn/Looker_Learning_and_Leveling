view: customer_lessons {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_LESSONS"
    ;;

  dimension_group: lesson_completion_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LESSON_COMPLETION_TS" ;;
  }

  dimension_group: lesson_created_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LESSON_CREATED_TS" ;;
  }

  dimension: lesson_est_time_duration {
    type: number
    sql: ${TABLE}."LESSON_EST_TIME_DURATION" ;;
  }

  dimension_group: lesson_last_updated_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LESSON_LAST_UPDATED_TS" ;;
  }

  dimension: lesson_name {
    type: string
    sql: ${TABLE}."LESSON_NAME" ;;
  }

  dimension: lesson_required_ind {
    type: yesno
    sql: ${TABLE}."LESSON_REQUIRED_IND" ;;
  }

  dimension: lesson_reward {
    type: number
    sql: ${TABLE}."LESSON_REWARD" ;;
    value_format_name: usd
  }

  dimension: topic_name {
    type: string
    sql: ${TABLE}."TOPIC_NAME" ;;
  }

  dimension_group: lesson_started_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LESSON_STARTED_TS" ;;
  }

  dimension: customer_learning_system_id {
    type: string
    sql: ${TABLE}."CUSTOMER_LEARNING_SYSTEM_ID" ;;
  }

  dimension: days_available_after_level_up {
    type: number
    sql: ${TABLE}."DAYS_AVAILABLE_AFTER_LEVEL_UP" ;;
  }

  dimension: grow_version {
    type: number
    sql: ${TABLE}."GROW_VERSION" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension: level_id {
    type: string
    sql: ${TABLE}."LEVEL_ID" ;;
  }

  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }

  dimension: level_version {
    type: string
    sql: ${TABLE}."LEVEL_VERSION" ;;
  }

  dimension: user_lesson_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_LESSON_ID" ;;
  }

  dimension: user_topic_id {
    type: string
    sql: COALESCE(${TABLE}."NEW_GROW_USER_TOPIC_ID",${TABLE}."NEW_GROW_USER_TOPIC_ID") ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_profile.user_id} ;;
  }

  measure: distinct_lessons {
    type: count_distinct
    sql: ${user_lesson_id} ;;
  }

  measure: completed_lessons {
    type: count_distinct
    sql: CASE WHEN ${lesson_completion_ts_raw} IS NOT NULL THEN ${user_lesson_id} END ;;
  }

  measure: total_lesson_rewards {
    type: sum
    sql: CASE WHEN ${lesson_completion_ts_date} IS NOT NULL THEN ${lesson_reward} END ;;
    value_format_name: usd_0
  }

  measure: lesson_completion_rate {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${lesson_completion_ts_date} IS NOT NULL THEN ${user_lesson_id} END)/
    COUNT(DISTINCT ${user_lesson_id});;
    value_format_name: percent_2
  }

  measure: average_lesson_completion_seconds {
    type: average
    sql: DATEDIFF(SECONDS, ${lesson_started_ts_raw},${lesson_completion_ts_raw}) ;;
    value_format_name: decimal_2
  }

  measure: median_lesson_completion_seconds{
    type: number
    sql: median(DATEDIFF(SECONDS, ${lesson_started_ts_raw},${lesson_completion_ts_raw})) ;;
  }

  measure: max_lesson_available_days {
    type: max
    sql: ${days_available_after_level_up} ;;
  }

  measure: lessons_completed_within_30d {
    type: count_distinct
    sql: CASE WHEN ${lesson_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,30,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: lessons_completed_within_60d {
    type: count_distinct
    sql: CASE WHEN ${lesson_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,60,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: lessons_completed_within_90d {
    type: count_distinct
    sql: CASE WHEN ${lesson_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,90,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: lessons_completion_rate_30d {
    type: number
    sql: ${lessons_completed_within_30d} / COUNT(DISTINCT ${user_lesson_id});;
    value_format_name: percent_1
  }

  measure: lessons_completion_rate_60d {
    type: number
    sql: ${lessons_completed_within_60d} / COUNT(DISTINCT ${user_lesson_id});;
    value_format_name: percent_1
  }

  measure: lessons_completion_rate_90d {
    type: number
    sql: ${lessons_completed_within_90d} / COUNT(DISTINCT ${user_lesson_id});;
    value_format_name: percent_1
  }

}
