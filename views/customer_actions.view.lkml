view: customer_actions {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_ACTIONS"
    ;;

  dimension_group: action_completion_ts {
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
    sql: CAST(${TABLE}."ACTION_COMPLETION_TS" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: action_last_updated_ts {
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
    sql: CAST(${TABLE}."ACTION_LAST_UPDATED_TS" AS TIMESTAMP_NTZ) ;;
  }

  dimension: action_name {
    type: string
    sql: ${TABLE}."ACTION_NAME" ;;
  }

  dimension: action_required_ind {
    type: yesno
    sql: ${TABLE}."ACTION_REQUIRED_IND" ;;
  }

  dimension: action_reward {
    type: number
    sql: ${TABLE}."ACTION_REWARD" ;;
  }

  dimension_group: action_unlocked_ts {
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
    sql: CAST(${TABLE}."ACTION_UNLOCKED_TS" AS TIMESTAMP_NTZ) ;;
  }

  dimension: customer_learning_system_id {
    type: string
    sql: ${TABLE}."CUSTOMER_LEARNING_SYSTEM_ID" ;;
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

  dimension: level_id {
    type: string
    sql: ${TABLE}."LEVEL_ID" ;;
  }

  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }

  dimension: level_version {
    type: string
    sql: ${TABLE}."LEVEL_VERSION" ;;
  }

  dimension: user_action_id {
    type: string
    sql: ${TABLE}."USER_ACTION_ID" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [level_name, action_name]
  }
}
