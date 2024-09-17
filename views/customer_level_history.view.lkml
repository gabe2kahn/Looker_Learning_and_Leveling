view: customer_level_history {
  sql_table_name: "LEARNING_SYSTEM"."CUSTOMER_LEVEL_HISTORY" ;;

  dimension: bronze_version {
    type: string
    sql: ${TABLE}."BRONZE_VERSION" ;;
  }
  dimension: gold_version {
    type: string
    sql: ${TABLE}."GOLD_VERSION" ;;
  }
  dimension: platinum_version {
    type: string
    sql: ${TABLE}."PLATINUM_VERSION" ;;
  }
  dimension: silver_version {
    type: string
    sql: ${TABLE}."SILVER_VERSION" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: count {
    type: count
  }
}
