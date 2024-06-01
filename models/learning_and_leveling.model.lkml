connection: "snowflake_product"

include: "/views/*.view"

datagroup: learning_and_leveling_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: learning_and_leveling_default_datagroup

label: "Arro Learning and Leveling Monitoring"

explore: customer_goals {
  join: user_profile {
    type: inner
    sql_on: ${customer_goals.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  join: customer_levels {
    type: inner
    sql_on: ${customer_levels.user_id} = ${customer_goals.user_id}
      AND ${customer_levels.level_name} = ${customer_goals.level_name};;
    relationship: many_to_many
  }

  join: customer_lessons {
    type: inner
    sql_on: ${customer_goals.user_id} = ${customer_lessons.user_id}
      AND ${customer_goals.level_name} = ${customer_lessons.level_name};;
    relationship: many_to_many
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: customer_lessons {
  join: user_profile {
    type: inner
    sql_on: ${customer_lessons.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  join: customer_lessons_detailed {
    type: inner
    sql_on: ${customer_lessons.user_id} = ${customer_lessons_detailed.user_id}
      AND ${customer_lessons.user_lesson_id} = ${customer_lessons_detailed.user_lesson_id};;
    relationship: many_to_many
  }

  join: customer_levels {
    type: inner
    sql_on: ${customer_levels.user_id} = ${customer_lessons.user_id}
      AND ${customer_levels.level_name} = ${customer_lessons.level_name};;
    relationship: many_to_many
  }

  join: customer_goals {
    type: inner
    sql_on: ${customer_lessons.user_id} = ${customer_goals.user_id}
      AND ${customer_lessons.level_name} = ${customer_goals.level_name};;
    relationship: many_to_many
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: customer_lessons_detailed {
  join: user_profile {
    type: inner
    sql_on: ${customer_lessons_detailed.user_id} = ${user_profile.user_id} ;;
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

  join: goal_names {
    type: inner
    sql_on: ${customer_levels.level_name} = ${goal_names.level_name}
      AND ${customer_levels.level_version} = ${goal_names.level_version} ;;
    relationship: many_to_many
  }

  join: lesson_names {
    type: inner
    sql_on: ${customer_levels.level_name} = ${goal_names.level_name} ;;
    relationship: many_to_many
  }

  join: customer_lessons {
    type: left_outer
    sql_on: ${customer_levels.user_id} = ${customer_lessons.user_id}
      AND ${customer_levels.level_name} = ${customer_lessons.level_name}
      AND ${lesson_names.lesson_name} = ${customer_lessons.lesson_name} ;;
    relationship: many_to_many
  }

  join: customer_lessons_detailed {
    type: inner
    sql_on: ${customer_lessons.user_id} = ${customer_lessons_detailed.user_id}
      AND ${customer_lessons.user_lesson_id} = ${customer_lessons_detailed.user_lesson_id};;
    relationship: many_to_many
  }

  join: customer_goals {
    type: left_outer
    sql_on: ${customer_levels.user_id} = ${customer_goals.user_id}
      AND ${customer_levels.level_name} = ${customer_goals.level_name}
      AND ${goal_names.goal_name} = ${customer_goals.goal_name} ;;
    relationship: many_to_many
  }

  join: snapshot_pt {
    type: inner
    sql_on: ${customer_levels.user_id} = ${snapshot_pt.user_id}
      AND ${snapshot_pt.snap_date} >= ${customer_levels.level_started_ts_date};;
    relationship: many_to_many
  }

  always_filter: {
    filters: [user_profile.testing_stage: "Rollout"]
  }
}

explore: financial_health_score {
  join: user_profile {
    type: inner
    sql_on: ${financial_health_score.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }
}
