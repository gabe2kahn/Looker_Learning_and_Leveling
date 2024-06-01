view: customer_levels {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_LEVELS"
    ;;

  dimension: apr_decrease_reward {
    type: number
    sql: ${TABLE}."APR_DECREASE_REWARD" ;;
    value_format_name: percent_2
  }

  dimension: free_months_reward {
    type: number
    sql: ${TABLE}."FREE_MONTHS_REWARD" ;;
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
    sql: COALESCE(${TABLE}."NEW_GROW_LEVEL_ID",${TABLE}."OLD_GROW_LEVEL_ID") ;;
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
    sql: COALESCE(${TABLE}."NEW_GROW_LEVEL_VERSION",${TABLE}."OLD_GROW_LEVEL_VERSION") ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_level_id {
    type: string
    primary_key: yes
    sql: COALESCE(${TABLE}."NEW_GROW_USER_LEVEL_ID",${TABLE}."OLD_GROW_USER_LEVEL_ID") ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_profile.user_id} ;;
  }

  measure: users_leveled_up {
    type: count_distinct
    sql: CASE WHEN ${level_completion_ts_date} IS NOT NULL THEN ${user_profile.user_id} END ;;
  }

  measure: level_up_rate {
    type: number
    sql: ${users_leveled_up} / ${users} ;;
  }

  measure: average_time_to_level_up{
    type: average
    sql: DATEDIFF(DAYS, ${level_started_ts_date},${level_completion_ts_date}) ;;
    value_format_name: decimal_2
  }

  measure: median_time_to_level_up{
    type: number
    sql: median(DATEDIFF(DAYS, ${level_started_ts_date},${level_completion_ts_date})) ;;
  }

  measure: users_leveled_up_within_30d {
    type: count_distinct
    sql: CASE WHEN ${level_completion_ts_date} between ${level_started_ts_date}
        AND DATEADD(days,30,${level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: percent_users_leveled_up_within_30d {
    type: number
    sql: ${users_leveled_up_within_30d} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: users_leveled_up_within_60d {
    type: count_distinct
    sql: CASE WHEN ${level_completion_ts_date} between ${level_started_ts_date}
      AND DATEADD(days,60,${level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: percent_users_leveled_up_within_60d {
    type: number
    sql: ${users_leveled_up_within_60d} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: users_leveled_up_within_90d {
    type: count_distinct
    sql: CASE WHEN ${level_completion_ts_date} between ${level_started_ts_date}
      AND DATEADD(days,90,${level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: percent_users_leveled_up_within_90d {
    type: number
    sql: ${users_leveled_up_within_90d} / NULLIF(${users},0) ;;
    value_format_name: percent_1
  }

  measure: total_rewards {
    type: number
    sql: ${customer_goals.total_goal_rewards} + ${customer_lessons.total_lesson_rewards} ;;
    value_format_name: usd_0
  }
}
