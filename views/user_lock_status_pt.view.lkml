view: user_lock_status_pt {
  sql_table_name: "LEARNING_SYSTEM"."USER_LOCK_STATUS_PT" ;;

  dimension: activity_status {
    type: string
    sql: ${TABLE}."ACTIVITY_STATUS" ;;
  }
  dimension: broken_plaid_token_ind {
    type: yesno
    sql: ${TABLE}."BROKEN_PLAID_TOKEN_IND" ;;
  }
  dimension: failed_payment_id {
    type: number
    sql: ${TABLE}."FAILED_PAYMENT_ID" ;;
  }
  dimension: failed_payment_ind {
    type: yesno
    sql: ${TABLE}."FAILED_PAYMENT_IND" ;;
  }
  dimension: global_override_ind {
    type: yesno
    sql: ${TABLE}."GLOBAL_OVERRIDE_IND" ;;
  }
  dimension: income_check_failed_ind {
    type: string
    sql: CASE WHEN ${income_overide_ind} = True THEN False ELSE ${TABLE}."INCOME_CHECK_FAILED_IND" = True END ;;
  }
  dimension: income_overide_ind {
    type: yesno
    sql: ${TABLE}."INCOME_OVERIDE_IND" ;;
  }
  dimension: income_review_pending_ind {
    type: yesno
    sql: ${TABLE}."INCOME_REVIEW_PENDING_IND" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LAST_UPDATE_TS" AS TIMESTAMP_NTZ) ;;
  }

  dimension: new_payment_pending_ind {
    type: yesno
    sql: ${TABLE}."NEW_PAYMENT_PENDING_IND" ;;
  }
  dimension: overdue_amount_required {
    type: number
    sql: ${TABLE}."OVERDUE_AMOUNT_REQUIRED" ;;
  }
  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }
  dimension: overdue_payment_pending_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_PAYMENT_PENDING_IND" ;;
  }
  dimension_group: overdue {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OVERDUE_TS" AS TIMESTAMP_NTZ) ;;
  }

  dimension: primary_key {
    type: string
    sql: ${user_id}||${snap_date} ;;
  }

  dimension: restriction_reason {
    type: string
    sql: CASE
      WHEN ${global_override_ind} = True THEN 'Overwritten'
      WHEN ${income_check_failed_ind} = True AND ${failed_payment_ind} = True AND ${broken_plaid_token_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${income_check_failed_ind} = True AND ${broken_plaid_token_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${income_check_failed_ind} = True AND ${failed_payment_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${income_check_failed_ind} = True AND ${failed_payment_ind} = True AND ${broken_plaid_token_ind} = True THEN 'Multiple'
      WHEN ${failed_payment_ind} = True AND ${broken_plaid_token_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${broken_plaid_token_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${failed_payment_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${failed_payment_ind} = True AND ${broken_plaid_token_ind} = True THEN 'Multiple'
      WHEN ${income_check_failed_ind} = True AND ${overdue_ind} = True THEN 'Multiple'
      WHEN ${income_check_failed_ind} = True AND ${broken_plaid_token_ind} = True THEN 'Broken Plaid'
      WHEN ${income_check_failed_ind} = True AND ${failed_payment_ind} = True THEN 'Multiple'
      WHEN ${overdue_ind} = True THEN 'Overdue'
      WHEN ${failed_payment_ind} = True THEN 'Failed Payment'
      WHEN ${broken_plaid_token_ind} = True THEN 'Broken Plaid Connection'
      WHEN ${income_check_failed_ind} = True THEN 'Income'
      WHEN ${income_check_failed_ind} = False AND ${failed_payment_ind} = False AND ${broken_plaid_token_ind} = False AND ${overdue_ind} = False THEN 'Never Locked'
    END ;;
  }

  dimension_group: snap {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAP_DATE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

}
