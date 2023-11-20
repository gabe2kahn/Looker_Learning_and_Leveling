view: financial_health_score {
  sql_table_name: "LEARNING_SYSTEM"."FINANCIAL_HEALTH_SCORE" ;;

  dimension: activity_name {
    type: string
    sql: ${TABLE}."ACTIVITY_NAME" ;;
  }
  dimension: answer_score {
    type: number
    sql: ${TABLE}."ANSWER_SCORE" ;;
  }
  dimension: answer_values {
    type: string
    sql: ${TABLE}."ANSWER_VALUES" ;;
  }
  dimension: customer_answer {
    type: string
    sql: ${TABLE}."CUSTOMER_ANSWER" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }
  dimension: question {
    type: string
    sql: ${TABLE}."QUESTION" ;;
  }
  dimension_group: question_completed_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."QUESTION_COMPLETED_TS" ;;
  }
  dimension: question_iteration {
    type: number
    sql: ${TABLE}."QUESTION_ITERATION" ;;
  }
  dimension: user_activity_id {
    type: string
    sql: ${TABLE}."USER_ACTIVITY_ID" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_screen_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_SCREEN_ID" ;;
  }

  measure: financial_health_score {
    type: average
    sql: ${answer_score} ;;
  }

}
