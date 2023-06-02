connection: "snowflake_product"

include: "/views/*.view"

datagroup: learning_and_leveling_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: learning_and_leveling_default_datagroup

label: "Arro Learning and Leveling Monitoring"

explore: customer_actions {
  join: user_profile {
    type: inner
    sql_on: ${customer_actions.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: customer_activities {
  join: user_profile {
    type: inner
    sql_on: ${customer_activities.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: customer_activities_detailed {
  join: user_profile {
    type: inner
    sql_on: ${customer_activities_detailed.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: customer_levels {
  join: user_profile {
    type: inner
    sql_on: ${customer_levels.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}
