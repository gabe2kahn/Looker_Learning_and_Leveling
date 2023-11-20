view: financial_health_score {
  sql_table_name: "LEARNING_SYSTEM"."FINANCIAL_HEALTH_SCORE" ;;

  dimension: credit_score {
    type: string
    sql: ${TABLE}."CREDIT_SCORE" ;;
  }

  dimension: credit_score_score {
    type: number
    sql: ${TABLE}."CREDIT_SCORE_SCORE" ;;
  }

  dimension: debt_manageability {
    type: string
    sql: ${TABLE}."DEBT_MANAGEABILITY" ;;
  }

  dimension: debt_manageability_score {
    type: number
    sql: ${TABLE}."DEBT_MANAGEABILITY_SCORE" ;;
  }

  dimension: final_survey_complete_ind {
    type: string
    sql: ${TABLE}."FINAL_SURVEY_COMPLETE_IND" ;;
  }

  dimension: financial_goal_confidence {
    type: string
    sql: ${TABLE}."FINANCIAL_GOAL_CONFIDENCE" ;;
  }

  dimension: financial_goal_confidence_score {
    type: number
    sql: ${TABLE}."FINANCIAL_GOAL_CONFIDENCE_SCORE" ;;
  }

  dimension: financial_health_score {
    type: number
    sql: ${TABLE}."FINANCIAL_HEALTH_SCORE" ;;
    value_format_name: decimal_1
  }


  dimension: financial_planning {
    type: string
    sql: ${TABLE}."FINANCIAL_PLANNING" ;;
  }

  dimension: financial_planning_score {
    type: number
    sql: ${TABLE}."FINANCIAL_PLANNING_SCORE" ;;
  }

  dimension: insurance_confidence {
    type: string
    sql: ${TABLE}."INSURANCE_CONFIDENCE" ;;
  }

  dimension: insurance_confidence_score {
    type: number
    sql: ${TABLE}."INSURANCE_CONFIDENCE_SCORE" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension: pay_bills {
    type: string
    sql: ${TABLE}."PAY_BILLS" ;;
  }

  dimension: pay_bills_score {
    type: number
    sql: ${TABLE}."PAY_BILLS_SCORE" ;;
  }

  dimension: primary_key {
    type: string
    sql: ${user_id}||${survey_iteration} ;;
  }

  dimension: savings_cover_expenses {
    type: string
    sql: ${TABLE}."SAVINGS_COVER_EXPENSES" ;;
  }

  dimension: savings_cover_expenses_score {
    type: number
    sql: ${TABLE}."SAVINGS_COVER_EXPENSES_SCORE" ;;
  }

  dimension: survey_complete_ind {
    type: string
    sql: ${TABLE}."SURVEY_COMPLETE_IND" ;;
  }

  dimension: survey_iteration {
    type: string
    sql: ${TABLE}."SURVEY_ITERATION" ;;
  }

  dimension: total_spending_vs_income {
    type: string
    sql: ${TABLE}."TOTAL_SPENDING_VS_INCOME" ;;
  }

  dimension: total_spending_vs_income_score {
    type: number
    sql: ${TABLE}."TOTAL_SPENDING_VS_INCOME_SCORE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id}  ;;
  }

  measure: average_survey_financial_health_score {
    type: average
    sql: ${financial_health_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_credit_score_score {
    type: average
    sql: ${credit_score_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_debt_manageability_score {
    type: average
    sql: ${debt_manageability_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_financial_goal_confidence_score {
    type: average
    sql: ${financial_goal_confidence_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_financial_planning_score {
    type: average
    sql: ${financial_planning_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_insurance_confidence_score {
    type: average
    sql: ${insurance_confidence_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_pay_bills_score {
    type: average
    sql: ${pay_bills_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_savings_cover_expenses_score {
    type: average
    sql: ${savings_cover_expenses_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_total_spending_vs_income_score {
    type: average
    sql: ${total_spending_vs_income_score}  ;;
    value_format_name: decimal_1
  }
}
