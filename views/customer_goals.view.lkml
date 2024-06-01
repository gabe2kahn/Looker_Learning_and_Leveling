view: customer_goals {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_GOALS"
    ;;

  dimension_group: goal_completion_ts {
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
    sql: ${TABLE}."GOAL_COMPLETION_TS" ;;
  }

  dimension_group: goal_last_updated_ts {
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
    sql: ${TABLE}."GOAL_LAST_UPDATED_TS" ;;
  }

  dimension: goal_name {
    type: string
    sql: CASE
      WHEN ${TABLE}."GOAL_NAME" IN ('Make 2nd consecutive, on-time, minimum payment',
        'Make 2nd consecutive, on-time, minimum statement payment',
        'Silver Streak: 2 on-time, minimum statement payments') THEN 'Make 2nd consecutive, on-time, minimum payment'
      WHEN ${TABLE}."GOAL_NAME" IN ('Pay $100 off your balance','Pay off $100') THEN 'Pay $100 off your balance'
      WHEN ${TABLE}."GOAL_NAME" IN ('Make 3rd consecutive, on-time, minimum statement payment',
        'Make 3rd consecutive, on-time, minimum payment') THEN 'Make 3rd consecutive, on-time, minimum payment'
      WHEN ${TABLE}."GOAL_NAME" IN ('Pay off full statement balance (Gold)', 'Pay off full statement balance',
        'Pay off 1st full statement (Gold, Hard)') THEN 'Pay off first full statement balance'
      WHEN ${TABLE}."GOAL_NAME" IN ('Make 5 on-time minimum or greater statement payment (Gold, Streak, Easy)',
        'Make 7 on-time minimum or greater statement payment (Gold, Streak)') THEN 'Gold Streak (5 Easy, 7 Hard)'
      ELSE ${TABLE}."GOAL_NAME"
      END ;;
  }

  dimension: goal_required_ind {
    type: yesno
    sql: ${TABLE}."GOAL_REQUIRED_IND" ;;
  }

  dimension: goal_reward {
    type: number
    sql: ${TABLE}."GOAL_REWARD" ;;
    value_format_name: usd
  }

  dimension: goal_type {
    type: string
    sql: ${TABLE}."GOAL_TYPE" ;;
  }

  dimension_group: goal_created_ts {
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
    sql: ${TABLE}."GOAL_CREATED_TS" ;;
  }

  dimension: customer_learning_system_id {
    type: string
    sql: ${TABLE}."CUSTOMER_LEARNING_SYSTEM_ID" ;;
  }

  dimension: grow_version {
    type: string
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

  dimension: goal_progress_completed {
    type: number
    sql: ${TABLE}."PROGRESS_COMPLETED" ;;
  }

  dimension: goal_progress_pending {
    type: number
    sql: ${TABLE}."PROGRESS_PENDING" ;;
  }

  dimension: goal_requirement {
    type: number
    sql: ${TABLE}."REQUIREMENT" ;;
  }

  dimension: user_goal_id {
    type: string
    primary_key: yes
    sql: COALESCE(${TABLE}."NEW_GROW_GOAL_ID",${TABLE}."OLD_GROW_GOAL_ID") ;;
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
    sql: ${user_goal_id} ;;
  }

  measure: completed_actions {
    type: count_distinct
    sql: CASE WHEN ${goal_completion_ts_raw} IS NOT NULL THEN ${user_goal_id} END ;;
  }

  measure: total_goal_rewards {
    type: sum
    sql: CASE WHEN ${goal_completion_ts_raw} IS NOT NULL THEN ${goal_reward} END ;;
    value_format_name: usd_0
  }

  measure: goal_completion_rate {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${goal_completion_ts_date} IS NOT NULL THEN ${user_goal_id} END)/
      COUNT(DISTINCT ${customer_levels.user_level_id});;
    value_format_name: percent_2
  }

  measure: goals_completed_within_30d {
    type: count_distinct
    sql: CASE WHEN ${goal_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,30,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: goals_completed_within_60d {
    type: count_distinct
    sql: CASE WHEN ${goal_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,60,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: goals_completed_within_90d {
    type: count_distinct
    sql: CASE WHEN ${goal_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,90,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: goal_completion_rate_30d {
    type: number
    sql: ${goals_completed_within_30d} / COUNT(DISTINCT ${user_goal_id});;
    value_format_name: percent_1
  }

  measure: goal_completion_rate_60d {
    type: number
    sql: ${goals_completed_within_60d} / COUNT(DISTINCT ${user_goal_id});;
    value_format_name: percent_1
  }

  measure: goal_completion_rate_90d {
    type: number
    sql: ${goals_completed_within_90d} / COUNT(DISTINCT ${user_goal_id});;
    value_format_name: percent_1
  }
}
