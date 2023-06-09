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
    sql: ${TABLE}."ACTION_COMPLETION_TS" ;;
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
    sql: ${TABLE}."ACTION_LAST_UPDATED_TS" ;;
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
    value_format_name: usd
  }

  dimension_group: action_created_ts {
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
    sql: ${TABLE}."ACTION_CREATED_TS" ;;
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
    primary_key: yes
    sql: ${TABLE}."USER_ACTION_ID" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_profile.user_id} ;;
  }

  measure: action_completion_rate {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${action_completion_ts_date}} IS NOT NULL THEN ${user_action_id})/
      COUNT(DISTINCT ${user_action_id});;
    value_format_name: percent_2
  }
}
