view: customer_quizzes_detailed {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_QUIZZES_DETAILED" ;;

  dimension: answer {
    type: string
    sql: ${TABLE}."ANSWER" ;;
  }
  dimension: answer_type {
    type: string
    sql: ${TABLE}."ANSWER_TYPE" ;;
  }
  dimension_group: answered_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."ANSWERED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: attempt_number {
    type: number
    sql: ${TABLE}."ATTEMPT_NUMBER" ;;
  }
  dimension: attempt_recency {
    type: number
    sql: ${TABLE}."ATTEMPT_RECENCY" ;;
  }
  dimension: content_type {
    type: string
    sql: ${TABLE}."CONTENT_TYPE" ;;
  }
  dimension: correct_ind {
    type: yesno
    sql: ${TABLE}."CORRECT_IND" ;;
  }
  dimension: correct_values {
    type: string
    sql: ${TABLE}."CORRECT_VALUES" ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}."QUESTION" ;;
    order_by_field: ordering
  }

  dimension: question_id {
    type: string
    sql: ${TABLE}."QUESTION_ID" ;;
  }

  dimension: question_attempt_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."QUESTION_ATTEMPT_ID" ;;
  }

  dimension: quiz_attempt_id {
    type: string
    sql: ${TABLE}."QUIZ_ATTEMPT_ID" ;;
  }
  dimension: quiz_id {
    type: string
    sql: ${TABLE}."QUIZ_ID" ;;
  }
  dimension: quiz_name {
    type: string
    sql: ${TABLE}."QUIZ_NAME" ;;
  }

  dimension: quiz_question {
    type: string
    sql: ${quiz_name} ||' - '||${question};;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: attempts {
    type: count_distinct
    sql: ${question_attempt_id} ;;
  }

  measure: first_attempts {
    type: count_distinct
    sql: CASE WHEN ${attempt_number} = 1 THEN ${question_attempt_id} END ;;
  }

  measure: most_recent_attempts {
    type: count_distinct
    sql: CASE WHEN ${attempt_recency} = 1 THEN ${question_attempt_id} END ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: correct_answers {
    type: count_distinct
    sql: CASE WHEN ${correct_ind} = True THEN ${question_attempt_id} END ;;
  }

  measure: correct_users {
    type: count_distinct
    sql: CASE WHEN ${correct_ind} = True THEN ${user_id} END ;;
  }

  measure: correct_first_answers {
    type: count_distinct
    sql: CASE WHEN ${correct_ind} = True and ${attempt_number} = 1 THEN ${question_attempt_id} END ;;
  }

  measure: correct_most_recent_answers {
    type: count_distinct
    sql: CASE WHEN ${correct_ind} = True and ${attempt_recency} = 1 THEN ${question_attempt_id} END ;;
  }

  measure: correct_rate {
    type: number
    sql: ${correct_answers} / ${attempts} ;;
    value_format_name: percent_1
  }

  measure: user_correct_rate {
    type: number
    sql: ${correct_users} / ${users} ;;
    value_format_name: percent_1
  }

  measure: first_attempt_correct_rate {
    type: number
    sql: ${correct_first_answers} / ${first_attempts} ;;
    value_format_name: percent_1
  }

  measure: most_recent_attempt_ace_rate {
    type: number
    sql: ${correct_most_recent_answers} / ${most_recent_attempts} ;;
    value_format_name: percent_1
  }

}
