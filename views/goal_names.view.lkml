view: goal_names {
  sql_table_name: "LEARNING_SYSTEM"."GOAL_NAMES" ;;

  dimension: goal_name {
    type: string
    primary_key: yes
    sql: ${TABLE}."GOAL_NAME" ;;
  }
  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }
  dimension: level_version {
    type: string
    sql: ${TABLE}."LEVEL_VERSION" ;;
  }

}
