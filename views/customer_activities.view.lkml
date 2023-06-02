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
  }

  dimension: activity_set_name {
    type: string
    sql: ${TABLE}."ACTIVITY_SET_NAME" ;;
  }

  dimension_group: activity_unlocked_ts {
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
    sql: ${TABLE}."ACTIVITY_UNLOCKED_TS" ;;
  }

  dimension: customer_learning_system_id {
    type: string
    sql: ${TABLE}."CUSTOMER_LEARNING_SYSTEM_ID" ;;
  }

  dimension: days_available_after_level_up {
    type: number
    sql: ${TABLE}."DAYS_AVAILABLE_AFTER_LEVEL_UP" ;;
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

  measure: count {
    type: count
    drill_fields: [activity_set_name, level_name, activity_name]
  }
}
