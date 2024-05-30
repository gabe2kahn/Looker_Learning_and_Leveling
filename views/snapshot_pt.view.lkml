view: snapshot_pt {
  sql_table_name: "CUSTOMER"."SNAPSHOT_PT" ;;

  dimension_group: account_closed {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_CLOSED_DATE" ;;
  }
  dimension_group: account_open {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_OPEN_DATE" ;;
  }
  dimension: active_level {
    type: string
    sql: ${TABLE}."ACTIVE_LEVEL" ;;
  }
  dimension: autopay_on_ind {
    type: yesno
    sql: ${TABLE}."AUTOPAY_ON_IND" ;;
  }
  dimension: autopay_type {
    type: string
    sql: ${TABLE}."AUTOPAY_TYPE" ;;
  }
  dimension: charged_off_reason {
    type: string
    sql: ${TABLE}."CHARGED_OFF_REASON" ;;
  }
  dimension_group: chargeoff {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CHARGEOFF_DATE" ;;
  }
  dimension: credit_utilization {
    type: number
    sql: ${TABLE}."CREDIT_UTILIZATION" ;;
  }
  dimension: current_credit_limit {
    type: number
    sql: ${TABLE}."CURRENT_CREDIT_LIMIT" ;;
  }
  dimension: current_interest_rate {
    type: number
    sql: ${TABLE}."CURRENT_INTEREST_RATE" ;;
  }
  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }
  dimension: delinq_120_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_120PLUS_BALANCE" ;;
  }
  dimension: delinq_150_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_150PLUS_BALANCE" ;;
  }
  dimension: delinq_180_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_180PLUS_BALANCE" ;;
  }
  dimension: delinq_30_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_30PLUS_BALANCE" ;;
  }
  dimension: delinq_60_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_60PLUS_BALANCE" ;;
  }
  dimension: delinq_90_plus_balance {
    type: number
    sql: ${TABLE}."DELINQ_90PLUS_BALANCE" ;;
  }
  dimension: ever_overdue_ind {
    type: string
    sql: ${TABLE}."EVER_OVERDUE_IND" ;;
  }
  dimension: gaco {
    type: number
    sql: ${TABLE}."GACO" ;;
  }
  dimension: galileo_payment_reference_number {
    type: string
    sql: ${TABLE}."GALILEO_PAYMENT_REFERENCE_NUMBER" ;;
  }
  dimension: guco {
    type: number
    sql: ${TABLE}."GUCO" ;;
  }
  dimension: index_rate {
    type: number
    sql: ${TABLE}."INDEX_RATE" ;;
  }
  dimension: interest_accrued {
    type: number
    sql: ${TABLE}."INTEREST_ACCRUED" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: latest_vantage_score {
    type: number
    sql: ${TABLE}."LATEST_VANTAGE_SCORE" ;;
  }
  dimension: loan_type_id {
    type: number
    sql: ${TABLE}."LOAN_TYPE_ID" ;;
  }
  dimension: loc_id {
    type: number
    sql: ${TABLE}."LOC_ID" ;;
  }
  dimension: minimum_payment {
    type: number
    sql: ${TABLE}."MINIMUM_PAYMENT" ;;
  }
  dimension_group: most_recent_autopay_authorization {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_AUTOPAY_AUTHORIZATION_DATE" ;;
  }
  dimension_group: most_recent_due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MOST_RECENT_DUE_DATE" ;;
  }
  dimension_group: next_due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NEXT_DUE_DATE" ;;
  }
  dimension: outstanding_balance {
    type: number
    sql: ${TABLE}."OUTSTANDING_BALANCE" ;;
  }
  dimension: outstanding_balance_principal {
    type: number
    sql: ${TABLE}."OUTSTANDING_BALANCE_PRINCIPAL" ;;
  }
  dimension: outstanding_fees {
    type: number
    sql: ${TABLE}."OUTSTANDING_FEES" ;;
  }
  dimension: outstanding_interest {
    type: number
    sql: ${TABLE}."OUTSTANDING_INTEREST" ;;
  }
  dimension: overdue_ind {
    type: yesno
    sql: ${TABLE}."OVERDUE_IND" ;;
  }
  dimension: payment_history_profile {
    type: string
    sql: ${TABLE}."PAYMENT_HISTORY_PROFILE" ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||${snap_date} ;;
  }

  dimension: purchase_volume {
    type: number
    sql: ${TABLE}."PURCHASE_VOLUME" ;;
  }
  dimension: recoveries {
    type: number
    sql: ${TABLE}."RECOVERIES" ;;
  }
  dimension: remaining_minimum_payment {
    type: number
    sql: ${TABLE}."REMAINING_MINIMUM_PAYMENT" ;;
  }
  dimension: remaining_statement_balance {
    type: number
    sql: ${TABLE}."REMAINING_STATEMENT_BALANCE" ;;
  }
  dimension_group: snap {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAP_DATE" ;;
  }
  dimension: snap_recency {
    type: string
    sql: ${TABLE}."SNAP_RECENCY" ;;
  }
  dimension: successful_payment_volume {
    type: number
    sql: ${TABLE}."SUCCESSFUL_PAYMENT_VOLUME" ;;
  }
  dimension: total_delinq_balance {
    type: number
    sql: ${TABLE}."TOTAL_DELINQ_BALANCE" ;;
  }
  dimension: unique_delinquencies {
    type: number
    sql: ${TABLE}."UNIQUE_DELINQUENCIES" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: count {
    type: count
  }
}
