connection: "snowflake_product"

include: "/views/*.view"

datagroup: learning_and_leveling_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: learning_and_leveling_default_datagroup

label: "Arro Learning and Leveling Monitoring"
