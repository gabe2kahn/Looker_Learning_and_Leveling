view: customer_quizzes {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_QUIZZES" ;;

  dimension: attempt_number {
    type: number
    sql: ${TABLE}."ATTEMPT_NUMBER" ;;
  }
  dimension: attempt_recency {
    type: number
    sql: ${TABLE}."ATTEMPT_RECENCY" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: min_pass_percentage {
    type: number
    sql: ${TABLE}."MIN_PASS_PERCENTAGE" ;;
  }
  dimension: passed_ind {
    type: yesno
    sql: ${TABLE}."PASSED_IND" ;;
  }
  dimension: quiz_attempt_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."QUIZ_ATTEMPT_ID" ;;
  }

  dimension: quiz_lockout_user_ind {
    type: yesno
    sql: LEFT(user_id,1) IN (8,9) ;;
  }

  dimension_group: quiz_finished_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."QUIZ_FINISHED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: quiz_id {
    type: string
    sql: ${TABLE}."QUIZ_ID" ;;
  }
  dimension: quiz_name {
    type: string
    sql: ${TABLE}."QUIZ_NAME" ;;
  }
  dimension: quiz_score {
    type: number
    sql: ${TABLE}."QUIZ_SCORE" ;;
  }
  dimension_group: quiz_started_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."QUIZ_STARTED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: quiz_attempts {
    type: count_distinct
    sql: ${quiz_attempt_id} ;;
  }

  measure: first_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${attempt_number} = 1 THEN ${quiz_attempt_id} END ;;
  }

  measure: most_recent_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${attempt_recency} = 1 THEN ${quiz_attempt_id} END ;;
  }

  measure: passed_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= ${min_pass_percentage} THEN ${quiz_attempt_id} END ;;
  }

  measure: passed_quiz_users {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= ${min_pass_percentage} THEN ${user_id} END ;;
  }

  measure: passed_first_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= ${min_pass_percentage} and ${attempt_number} = 1 THEN ${quiz_attempt_id} END ;;
  }

  measure: passed_most_recent_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= ${min_pass_percentage} and ${attempt_recency} = 1 THEN ${quiz_attempt_id} END ;;
  }

  measure: aced_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= 100 THEN ${quiz_attempt_id} END ;;
  }

  measure: aced_quiz_users {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= 100 THEN ${user_id} END ;;
  }

  measure: aced_first_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= 100 and ${attempt_number} = 1 THEN ${quiz_attempt_id} END ;;
  }

  measure: aced_most_recent_quiz_attempts {
    type: count_distinct
    sql: CASE WHEN ${quiz_score} >= 100 and ${attempt_recency} = 1 THEN ${quiz_attempt_id} END ;;
  }

  measure: attempt_pass_rate {
    type: number
    sql: ${passed_quiz_attempts} / ${quiz_attempts} ;;
    value_format_name: percent_1
  }

  measure: user_pass_rate {
    type: number
    sql: ${passed_quiz_users} / ${users} ;;
    value_format_name: percent_1
  }

  measure: first_attempt_pass_rate {
    type: number
    sql: ${passed_first_quiz_attempts} / ${first_quiz_attempts} ;;
    value_format_name: percent_1
  }

  measure: most_recent_attempt_pass_rate {
    type: number
    sql: ${passed_most_recent_quiz_attempts} / ${most_recent_quiz_attempts} ;;
    value_format_name: percent_1
  }

  measure: attempt_ace_rate {
    type: number
    sql: ${aced_quiz_attempts} / ${quiz_attempts} ;;
    value_format_name: percent_1
  }

  measure: user_ace_rate {
    type: number
    sql: ${aced_quiz_users} / ${users} ;;
    value_format_name: percent_1
  }

  measure: first_attempt_ace_rate {
    type: number
    sql: ${aced_first_quiz_attempts} / ${first_quiz_attempts} ;;
    value_format_name: percent_1
  }

  measure: most_recent_attempt_ace_rate {
    type: number
    sql: ${aced_most_recent_quiz_attempts} / ${most_recent_quiz_attempts} ;;
    value_format_name: percent_1
  }

  measure: average_attempts {
    type: average
    sql: CASE WHEN ${attempt_recency} = 1 THEN ${attempt_number} END ;;
    value_format_name: decimal_1
  }

  measure: average_score {
    type: average
    sql: ${quiz_score}/100 ;;
    value_format_name: percent_1
  }

  measure: average_first_attempt_score {
    type: average
    sql: CASE WHEN ${attempt_number} = 1 THEN ${quiz_score}/100 END ;;
    value_format_name: percent_1
  }

  measure: average_most_recent_attempt_score {
    type: average
    sql: CASE WHEN ${attempt_recency} = 1 THEN ${quiz_score}/100 END ;;
    value_format_name: percent_1
  }

  measure: users_with_second_attempts {
    type: count_distinct
    sql: CASE WHEN ${attempt_number} = 2 THEN ${user_id} END ;;
  }

  measure: second_attempt_rate {
    type: number
    sql: ${users_with_second_attempts}/${users} ;;
    value_format_name: percent_1
  }

}
