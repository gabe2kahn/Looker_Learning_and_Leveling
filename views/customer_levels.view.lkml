view: customer_levels {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_LEVELS"
    ;;

  dimension: apr_decrease_reward {
    type: number
    sql: ${TABLE}."APR_DECREASE_REWARD" ;;
  }

  dimension: customer_learning_system_id {
    type: string
    sql: ${TABLE}."CUSTOMER_LEARNING_SYSTEM_ID" ;;
  }

  dimension: free_months_reward {
    type: number
    sql: ${TABLE}."FREE_MONTHS_REWARD" ;;
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

  dimension_group: level_completion_ts {
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
    sql: ${TABLE}."LEVEL_COMPLETION_TS" ;;
  }

  dimension: level_id {
    type: string
    sql: ${TABLE}."LEVEL_ID" ;;
  }

  dimension_group: level_last_updated_ts {
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
    sql: ${TABLE}."LEVEL_LAST_UPDATED_TS" ;;
  }

  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }

  dimension_group: level_started_ts {
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
    sql: ${TABLE}."LEVEL_STARTED_TS" ;;
  }

  dimension: level_version {
    type: string
    sql: ${TABLE}."LEVEL_VERSION" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_level_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_LEVEL_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [level_name]
  }
}
