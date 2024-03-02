view: customer_activities {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_ACTIVITIES"
    ;;

  dimension_group: activity_completion_ts {
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
    sql: ${TABLE}."ACTIVITY_COMPLETION_TS" ;;
  }

  dimension_group: activity_created_ts {
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
    sql: ${TABLE}."ACTIVITY_CREATED_TS" ;;
  }

  dimension: activity_est_time_duration {
    type: number
    sql: ${TABLE}."ACTIVITY_EST_TIME_DURATION" ;;
  }

  dimension_group: activity_last_updated_ts {
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
    sql: ${TABLE}."ACTIVITY_LAST_UPDATED_TS" ;;
  }

  dimension: activity_name {
    type: string
    sql: ${TABLE}."ACTIVITY_NAME" ;;
  }

  dimension: activity_required_ind {
    type: yesno
    sql: ${TABLE}."ACTIVITY_REQUIRED_IND" ;;
  }

  dimension: activity_reward {
    type: number
    sql: ${TABLE}."ACTIVITY_REWARD" ;;
    value_format_name: usd
  }

  dimension: activity_set_name {
    type: string
    sql: ${TABLE}."ACTIVITY_SET_NAME" ;;
  }

  dimension_group: activity_started_ts {
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
    sql: ${TABLE}."ACTIVITY_STARTED_TS" ;;
  }

  dimension: customer_learning_system_id {
    type: string
    sql: ${TABLE}."CUSTOMER_LEARNING_SYSTEM_ID" ;;
  }

  dimension: days_available_after_level_up {
    type: number
    sql: ${TABLE}."DAYS_AVAILABLE_AFTER_LEVEL_UP" ;;
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

  dimension: user_activity_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ACTIVITY_ID" ;;
  }

  dimension: user_activity_set_id {
    type: string
    sql: ${TABLE}."USER_ACTIVITY_SET_ID" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_profile.user_id} ;;
  }

  measure: activity_completion_rate {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${activity_completion_ts_date} IS NOT NULL THEN ${user_activity_id} END)/
    COUNT(DISTINCT ${user_activity_id});;
    value_format_name: percent_2
  }

  measure: average_activity_completion_seconds {
    type: average
    sql: DATEDIFF(SECONDS, ${activity_started_ts_raw},${activity_completion_ts_raw}) ;;
    value_format_name: decimal_2
  }

  measure: median_activity_completion_seconds{
    type: number
    sql: median(DATEDIFF(SECONDS, ${activity_started_ts_raw},${activity_completion_ts_raw})) ;;
  }

  measure: max_activity_available_days {
    type: max
    sql: ${days_available_after_level_up} ;;
  }

  measure: activies_completed_within_30d {
    type: count_distinct
    sql: CASE WHEN ${activity_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,30,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: activies_completed_within_60d {
    type: count_distinct
    sql: CASE WHEN ${activity_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,60,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: activies_completed_within_90d {
    type: count_distinct
    sql: CASE WHEN ${activity_completion_ts_date} between ${customer_levels.level_started_ts_date}
      AND DATEADD(days,90,${customer_levels.level_started_ts_date}) THEN ${user_id} END ;;
  }

  measure: activies_completion_rate_30d {
    type: number
    sql: ${activies_completed_within_30d} / COUNT(DISTINCT ${user_activity_id});;
    value_format_name: percent_1
  }

  measure: activies_completion_rate_60d {
    type: number
    sql: ${activies_completed_within_60d} / COUNT(DISTINCT ${user_activity_id});;
    value_format_name: percent_1
  }

  measure: activies_completion_rate_90d {
    type: number
    sql: ${activies_completed_within_90d} / COUNT(DISTINCT ${user_activity_id});;
    value_format_name: percent_1
  }

}
