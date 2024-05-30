view: customer_lessons_detailed {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_LESSONS_DETAILED"
    ;;

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

  dimension: customer_answer {
    type: string
    sql: ${TABLE}."CUSTOMER_ANSWER" ;;
  }

  dimension: customer_answer_correct_ind {
    type: string
    sql: ${TABLE}."CUSTOMER_ANSWER_CORRECT_IND" ;;
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

  dimension: question {
    type: string
    sql: ${TABLE}."QUESTION" ;;
  }

  dimension: question_answer_type {
    type: string
    sql: ${TABLE}."QUESTION_ANSWER_TYPE" ;;
  }

  dimension_group: screen_completed_ts {
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
    sql: ${TABLE}."SCREEN_COMPLETED_TS" ;;
  }

  dimension: screen_duration_seconds {
    type: number
    sql: ${TABLE}."SCREEN_DURATION_SECONDS" ;;
  }

  dimension: screen_name {
    type: string
    sql: ${TABLE}."SCREEN_NAME" ;;
  }

  dimension_group: screen_started_ts {
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
    sql: ${TABLE}."SCREEN_STARTED_TS" ;;
  }

  dimension: screen_type {
    type: string
    sql: ${TABLE}."SCREEN_TYPE" ;;
  }

  dimension: screen_word_count {
    type: number
    sql: ${TABLE}."SCREEN_WORD_COUNT" ;;
  }

  dimension: user_lesson_id {
    type: string
    sql: ${TABLE}."USER_lesson_ID" ;;
  }

  dimension: user_screen_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_SCREEN_ID" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_profile.user_id} ;;
  }

  measure: average_seconds_per_screen {
    type: average
    sql: ${screen_duration_seconds} ;;
    value_format_name: decimal_2
  }

  measure: median_seconds_per_screen {
    type: number
    sql: median(${screen_duration_seconds}) ;;
  }

  measure: correct_answer_rate {
    type: number
    sql: COUNT(DISTINCT CASE WHEN customer_answer_correct_ind = 'Y' THEN ${user_screen_id} END)/
    COUNT(DISTINCT CASE WHEN ${screen_type} = 'question' AND ${customer_answer_correct_ind} IS NOT NULL THEN ${user_screen_id} END);;
    value_format_name: percent_2
  }

}
