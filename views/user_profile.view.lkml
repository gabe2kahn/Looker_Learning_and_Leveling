view: user_profile {
  sql_table_name: "CUSTOMER"."USER_PROFILE" ;;

  dimension: account_age {
    type: number
    sql: DATEDIFF(days, ${application_approval_ts_date}, current_date) ;;
  }

  dimension: activity_status {
    type: string
    sql: ${TABLE}."ACTIVITY_STATUS" ;;
  }
  dimension_group: application_approval_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."APPLICATION_APPROVAL_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: approval_test_ind {
    type: string
    sql: COALESCE(${TABLE}."APPROVAL_TEST_IND",'N/A') ;;
  }

  dimension: appsflyer_attribution_source {
    type: string
    sql: ${TABLE}."APPSFLYER_ATTRIBUTION_SOURCE" ;;
  }

  dimension: arro_risk_model_1_score {
    type: number
    sql: ${TABLE}."ARRO_RISK_MODEL_1_SCORE" ;;
  }

  dimension: arro_risk_model_2_score {
    type: number
    sql: ${TABLE}."ARRO_RISK_MODEL_2_SCORE" ;;
  }

  dimension: arm1_bucket {
    type: string
    sql: CASE
      WHEN ${arro_risk_model_1_score} BETWEEN 0 and 0.05 THEN 'a. 0-5'
      WHEN ${arro_risk_model_1_score} BETWEEN 0.05 and 0.1 THEN 'b. 5-10'
      WHEN ${arro_risk_model_1_score} BETWEEN 0.1 and 0.15 THEN 'c. 10-15'
      WHEN ${arro_risk_model_1_score} BETWEEN 0.15 and 0.2 THEN 'd. 15-20'
      WHEN ${arro_risk_model_1_score} BETWEEN 0.2 and 0.32 THEN 'e. 20-32'
      WHEN ${arro_risk_model_1_score} > 0.32 THEN 'f. 32+'
    END ;;
  }

  dimension: arm2_bucket {
    type: string
    sql: CASE
      WHEN ${arro_risk_model_2_score} BETWEEN 0 and 0.05 THEN 'a. 0-5'
      WHEN ${arro_risk_model_2_score} BETWEEN 0.05 and 0.1 THEN 'b. 5-10'
      WHEN ${arro_risk_model_2_score} BETWEEN 0.1 and 0.15 THEN 'c. 10-15'
      WHEN ${arro_risk_model_2_score} BETWEEN 0.15 and 0.2 THEN 'd. 15-20'
      WHEN ${arro_risk_model_2_score} BETWEEN 0.2 and 0.32 THEN 'e. 20-32'
      WHEN ${arro_risk_model_2_score} > 0.32 THEN 'f. 32+'
    END ;;
  }

  dimension_group: card_creation_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CARD_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: card_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CARD_UPDATE_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: current_base_interest_rate {
    type: string
    sql: ${TABLE}."CURRENT_BASE_INTEREST_RATE" ;;
  }
  dimension: current_card_status {
    type: string
    sql: ${TABLE}."CURRENT_CARD_STATUS" ;;
  }
  dimension: current_credit_limit {
    type: string
    sql: ${TABLE}."CURRENT_CREDIT_LIMIT" ;;
  }
  dimension: current_level {
    type: string
    sql: ${TABLE}."CURRENT_LEVEL" ;;
  }

  dimension: docv_ind {
    type: string
    sql: ${TABLE}."DOCV_IND" ;;
  }

  dimension: galileo_card_id {
    type: string
    sql: ${TABLE}."GALILEO_CARD_ID" ;;
  }

  dimension: galileo_payment_reference_number {
    type: string
    sql: ${TABLE}."GALILEO_PAYMENT_REFERENCE_NUMBER" ;;
  }

  dimension: highest_socure_fraud_risk_score {
    type: number
    sql: ${TABLE}."HIGHEST_SOCURE_FRAUD_RISK_SCORE" ;;
  }

  dimension: fraud_score_bucket {
    type: string
    sql: CASE
      WHEN ${highest_socure_fraud_risk_score} < 0.8 THEN 'a. 0-0.8'
      WHEN ${highest_socure_fraud_risk_score} < 0.9 THEN 'b. 0.8-0.9'
      WHEN ${highest_socure_fraud_risk_score} < 0.95 THEN 'c. 0.9-0.95'
      WHEN ${highest_socure_fraud_risk_score} > 0.95 THEN 'd. 0.95+'
    END;;
  }

  dimension: initial_base_interest_rate {
    type: number
    sql: ${TABLE}."INITIAL_BASE_INTEREST_RATE" ;;
  }
  dimension: initial_credit_limit {
    type: number
    sql: ${TABLE}."INITIAL_CREDIT_LIMIT" ;;
  }
  dimension_group: last_physical_card_ship {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LAST_PHYSICAL_CARD_SHIP_DATE" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: line_test_ind {
    type: string
    sql: ${TABLE}."LINE_TEST_IND" ;;
  }
  dimension: loan_id {
    type: string
    sql: ${TABLE}."LOAN_ID" ;;
  }
  dimension: onboarded_ind {
    type: yesno
    sql: ${TABLE}."ONBOARDED_IND" ;;
  }
  dimension: onboarding_status {
    type: string
    sql: ${TABLE}."ONBOARDING_STATUS" ;;
  }
  dimension: peach_borrower_id {
    type: string
    sql: ${TABLE}."PEACH_BORROWER_ID" ;;
  }
  dimension: peach_loan_id {
    type: string
    sql: ${TABLE}."PEACH_LOAN_ID" ;;
  }
  dimension: physical_card_status {
    type: string
    sql: ${TABLE}."PHYSICAL_CARD_STATUS" ;;
  }

  dimension: policy_20230929_approval_ind {
    type: string
    sql: CASE
      WHEN ${TABLE}."POLICY_20230929_APPROVAL_IND" = 'Approved' THEN 'Approved'
      ELSE 'Decline'
    END ;;
  }

  dimension: policy_20240117_approval_ind {
    type: string
    sql: CASE
      WHEN ${TABLE}."POLICY_20240117_APPROVAL_IND" = 'Approved' THEN 'Approved'
      ELSE 'Decline'
    END ;;
  }

  dimension: risk_segment {
    type: string
    sql: CASE
      WHEN policy_20240117_approval_ind = 'Approved' THEN 'ARM2 Approved'
      WHEN policy_20230929_approval_ind = 'Approved' THEN 'ARM1 Approved'
      ELSE 'R&D'
    END ;;
  }

  dimension: rollout_line_assignment {
    type: number
    sql: ${TABLE}."ROLLOUT_LINE_ASSIGNMENT" ;;
  }
  dimension: testing_stage {
    type: string
    sql: ${TABLE}."TESTING_STAGE" ;;
  }
  dimension_group: user_creation_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."USER_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: vantage_score {
    type: number
    sql: ${TABLE}."VANTAGE_SCORE" ;;
  }

  dimension: vantage_bucket {
    type: string
    sql: CASE
      WHEN ${vantage_score} < 300 THEN 'a. Invalid'
      WHEN ${vantage_score} BETWEEN 300 and 499 THEN 'b. 300-499'
      WHEN ${vantage_score} BETWEEN 500 and 579 THEN 'c. 500-579'
      WHEN ${vantage_score} BETWEEN 580 and 619 THEN 'd. 580-619'
      WHEN ${vantage_score} BETWEEN 620 and 659 THEN 'e. 620-659'
      WHEN ${vantage_score} BETWEEN 660 and 719 THEN 'f. 660-719'
      WHEN ${vantage_score} > 720 THEN 'g. 720+'
    END ;;
  }

  measure: average_current_credit_limit {
    type: average
    sql: ${current_credit_limit} ;;
  }

  measure: total_account_age {
    type: sum
    sql: ${account_age} ;;
  }
}
