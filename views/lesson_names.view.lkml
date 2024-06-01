view: lesson_names {
  sql_table_name: "LEARNING_SYSTEM"."LESSON_NAMES" ;;

  dimension: lesson_name {
    type: string
    primary_key: yes
    sql: ${TABLE}."LESSON_NAME" ;;
  }
  dimension: level_name {
    type: string
    sql: ${TABLE}."LEVEL_NAME" ;;
  }

}
