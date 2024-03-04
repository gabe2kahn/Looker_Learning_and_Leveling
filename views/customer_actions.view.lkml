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
    sql: CASE
      WHEN ${TABLE}."ACTION_NAME" IN ('Make 2nd consecutive, on-time, minimum payment',
        'Make 2nd consecutive, on-time, minimum statement payment',
        'Silver Streak: 2 on-time, minimum statement payments') THEN 'Make 2nd consecutive, on-time, minimum payment'
      WHEN ${TABLE}."ACTION_NAME" IN ('Pay $100 off your balance','Pay off $100') THEN 'Pay $100 off your balance'
      WHEN ${TABLE}."ACTION_NAME" IN ('Make 3rd consecutive, on-time, minimum statement payment',
        'Make 3rd consecutive, on-time, minimum payment') THEN 'Make 3rd consecutive, on-time, minimum payment'
      ELSE ${TABLE}."ACTION_NAME"
      END ;;
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

  dimension: grow_version {
    type: number
    sql: ${TABLE}."GROW_VERSION" ;;
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

  measure: distinct_actions {
    type: count_distinct
    sql: ${user_action_id} ;;
  }

  measure: completed_actions {
    type: count_distinct
    sql: CASE WHEN ${action_completion_ts_raw} IS NOT NULL THEN ${user_action_id} END ;;
  }

  measure: total_action_rewards {
    type: sum
    sql: ${action_reward} ;;
  }

  measure: action_completion_rate {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${action_completion_ts_date}} IS NOT NULL THEN ${user_action_id})/
      COUNT(DISTINCT ${user_action_id});;
    value_format_name: percent_2
  }

  measure: actions_completed_within_30d {
    type: count_distinct
    sql: CASE WHEN ${action_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,30,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: actions_completed_within_60d {
    type: count_distinct
    sql: CASE WHEN ${action_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,60,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: actions_completed_within_90d {
    type: count_distinct
    sql: CASE WHEN ${action_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,90,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: action_completion_rate_30d {
    type: number
    sql: ${actions_completed_within_30d} / COUNT(DISTINCT ${user_action_id});;
    value_format_name: percent_1
  }

  measure: action_completion_rate_60d {
    type: number
    sql: ${actions_completed_within_60d} / COUNT(DISTINCT ${user_action_id});;
    value_format_name: percent_1
  }

  measure: action_completion_rate_90d {
    type: number
    sql: ${actions_completed_within_90d} / COUNT(DISTINCT ${user_action_id});;
    value_format_name: percent_1
  }
}
