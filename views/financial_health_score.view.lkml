view: financial_health_score {
  sql_table_name: "LEARNING_SYSTEM"."FINANCIAL_HEALTH_SCORE" ;;

  dimension: credit_score_1 {
    type: string
    sql: ${TABLE}."CREDIT_SCORE_1" ;;
  }
  dimension: credit_score_1_score {
    type: number
    sql: ${TABLE}."CREDIT_SCORE_1_SCORE" ;;
  }
  dimension: credit_score_2 {
    type: string
    sql: ${TABLE}."CREDIT_SCORE_2" ;;
  }
  dimension: credit_score_2_score {
    type: number
    sql: ${TABLE}."CREDIT_SCORE_2_SCORE" ;;
  }
  dimension: debt_manageability_1 {
    type: string
    sql: ${TABLE}."DEBT_MANAGEABILITY_1" ;;
  }
  dimension: debt_manageability_1_score {
    type: number
    sql: ${TABLE}."DEBT_MANAGEABILITY_1_SCORE" ;;
  }
  dimension: debt_manageability_2 {
    type: string
    sql: ${TABLE}."DEBT_MANAGEABILITY_2" ;;
  }
  dimension: debt_manageability_2_score {
    type: number
    sql: ${TABLE}."DEBT_MANAGEABILITY_2_SCORE" ;;
  }
  dimension: financial_goal_confidence_1 {
    type: string
    sql: ${TABLE}."FINANCIAL_GOAL_CONFIDENCE_1" ;;
  }
  dimension: financial_goal_confidence_1_score {
    type: number
    sql: ${TABLE}."FINANCIAL_GOAL_CONFIDENCE_1_SCORE" ;;
  }
  dimension: financial_goal_confidence_2 {
    type: string
    sql: ${TABLE}."FINANCIAL_GOAL_CONFIDENCE_2" ;;
  }
  dimension: financial_goal_confidence_2_score {
    type: number
    sql: ${TABLE}."FINANCIAL_GOAL_CONFIDENCE_2_SCORE" ;;
  }
  dimension: financial_health_score_1 {
    type: number
    sql: ${TABLE}."FINANCIAL_HEALTH_SCORE_1" ;;
    value_format_name: decimal_1
  }

  dimension: financial_health_score_2 {
    type: number
    sql: ${TABLE}."FINANCIAL_HEALTH_SCORE_2" ;;
    value_format_name: decimal_1
  }

  dimension: financial_planning_1 {
    type: string
    sql: ${TABLE}."FINANCIAL_PLANNING_1" ;;
  }
  dimension: financial_planning_1_score {
    type: number
    sql: ${TABLE}."FINANCIAL_PLANNING_1_SCORE" ;;
  }
  dimension: financial_planning_2 {
    type: string
    sql: ${TABLE}."FINANCIAL_PLANNING_2" ;;
  }
  dimension: financial_planning_2_score {
    type: number
    sql: ${TABLE}."FINANCIAL_PLANNING_2_SCORE" ;;
  }
  dimension: insurance_confidence_1 {
    type: string
    sql: ${TABLE}."INSURANCE_CONFIDENCE_1" ;;
  }
  dimension: insurance_confidence_1_score {
    type: number
    sql: ${TABLE}."INSURANCE_CONFIDENCE_1_SCORE" ;;
  }
  dimension: insurance_confidence_2 {
    type: string
    sql: ${TABLE}."INSURANCE_CONFIDENCE_2" ;;
  }
  dimension: insurance_confidence_2_score {
    type: number
    sql: ${TABLE}."INSURANCE_CONFIDENCE_2_SCORE" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: pay_bills_1 {
    type: string
    sql: ${TABLE}."PAY_BILLS_1" ;;
  }
  dimension: pay_bills_1_score {
    type: number
    sql: ${TABLE}."PAY_BILLS_1_SCORE" ;;
  }
  dimension: pay_bills_2 {
    type: string
    sql: ${TABLE}."PAY_BILLS_2" ;;
  }
  dimension: pay_bills_2_score {
    type: number
    sql: ${TABLE}."PAY_BILLS_2_SCORE" ;;
  }
  dimension: savings_cover_expenses_1 {
    type: string
    sql: ${TABLE}."SAVINGS_COVER_EXPENSES_1" ;;
  }
  dimension: savings_cover_expenses_1_score {
    type: number
    sql: ${TABLE}."SAVINGS_COVER_EXPENSES_1_SCORE" ;;
  }
  dimension: savings_cover_expenses_2 {
    type: string
    sql: ${TABLE}."SAVINGS_COVER_EXPENSES_2" ;;
  }
  dimension: savings_cover_expenses_2_score {
    type: number
    sql: ${TABLE}."SAVINGS_COVER_EXPENSES_2_SCORE" ;;
  }
  dimension: survey_1_complete_ind {
    type: string
    sql: ${TABLE}."SURVEY_1_COMPLETE_IND" ;;
  }
  dimension: survey_2_complete_ind {
    type: string
    sql: ${TABLE}."SURVEY_2_COMPLETE_IND" ;;
  }
  dimension: total_spending_vs_income_1 {
    type: string
    sql: ${TABLE}."TOTAL_SPENDING_VS_INCOME_1" ;;
  }
  dimension: total_spending_vs_income_1_score {
    type: number
    sql: ${TABLE}."TOTAL_SPENDING_VS_INCOME_1_SCORE" ;;
  }
  dimension: total_spending_vs_income_2 {
    type: string
    sql: ${TABLE}."TOTAL_SPENDING_VS_INCOME_2" ;;
  }
  dimension: total_spending_vs_income_2_score {
    type: number
    sql: ${TABLE}."TOTAL_SPENDING_VS_INCOME_2_SCORE" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id}  ;;
  }

  measure: average_survey_1_financial_health_score {
    type: average
    sql: ${financial_health_score_1}  ;;
    value_format_name: decimal_1
  }

  measure: average_survey_2_financial_health_score {
    type: average
    sql: ${financial_health_score_2}  ;;
    value_format_name: decimal_1
  }

  measure: average_credit_score_1_score {
    type: average
    sql: ${credit_score_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_credit_score_2_score {
    type: average
    sql: ${credit_score_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_debt_manageability_1_score {
    type: average
    sql: ${debt_manageability_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_debt_manageability_2_score {
    type: average
    sql: ${debt_manageability_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_financial_goal_confidence_1_score {
    type: average
    sql: ${financial_goal_confidence_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_financial_goal_confidence_2_score {
    type: average
    sql: ${financial_goal_confidence_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_financial_planning_1_score {
    type: average
    sql: ${financial_planning_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_financial_planning_2_score {
    type: average
    sql: ${financial_planning_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_insurance_confidence_1_score {
    type: average
    sql: ${insurance_confidence_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_insurance_confidence_2_score {
    type: average
    sql: ${insurance_confidence_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_pay_bills_1_score {
    type: average
    sql: ${pay_bills_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_pay_bills_2_score {
    type: average
    sql: ${pay_bills_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_savings_cover_expenses_1_score {
    type: average
    sql: ${savings_cover_expenses_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_savings_cover_expenses_2_score {
    type: average
    sql: ${savings_cover_expenses_2_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_total_spending_vs_income_1_score {
    type: average
    sql: ${total_spending_vs_income_1_score}  ;;
    value_format_name: decimal_1
  }

  measure: average_total_spending_vs_income_2_score {
    type: average
    sql: ${total_spending_vs_income_2_score}  ;;
    value_format_name: decimal_1
  }
}
