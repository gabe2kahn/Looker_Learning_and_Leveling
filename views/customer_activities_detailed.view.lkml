view: customer_activities_detailed {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_ACTIVITIES_DETAILED"
    ;;

  dimension_group: activity_last_updated_ts {
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
    sql: ${TABLE}."ACTIVITY_LAST_UPDATED_TS" ;;
  }

  dimension: activity_name {
    type: string
    sql: ${TABLE}."ACTIVITY_NAME" ;;
  }

  dimension: customer_answer {
    type: string
    sql: ${TABLE}."CUSTOMER_ANSWER" ;;
  }

  dimension: customer_answer_correct_ind {
    type: string
    sql: ${TABLE}."CUSTOMER_ANSWER_CORRECT_IND" ;;
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

  dimension: user_activity_id {
    type: string
    sql: ${TABLE}."USER_ACTIVITY_ID" ;;
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

  measure: count {
    type: count
    drill_fields: [screen_name, activity_name]
  }
}
