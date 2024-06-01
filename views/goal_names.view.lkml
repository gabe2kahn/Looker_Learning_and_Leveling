view: goal_names {
  sql_table_name: "LEARNING_SYSTEM"."GOAL_NAMES" ;;

  dimension: goal_name {
    type: string
    primary_key: yes
    sql: ${TABLE}."GOAL_NAME" ;;
  }

  dimension: goal_name_condensed {
    type: string
    sql: CASE
      WHEN ${goal_name} IN ('Make 2nd consecutive, on-time, minimum payment',
        'Make 2nd consecutive, on-time, minimum statement payment',
        'Silver Streak: 2 on-time, minimum statement payments') THEN 'Make 2nd consecutive, on-time, minimum payment'
      WHEN ${goal_name} IN ('Pay $100 off your balance','Pay off $100') THEN 'Pay $100 off your balance'
      WHEN ${goal_name} IN ('Make 3rd consecutive, on-time, minimum statement payment',
        'Make 3rd consecutive, on-time, minimum payment') THEN 'Make 3rd consecutive, on-time, minimum payment'
      WHEN ${goal_name} IN ('Pay off full statement balance (Gold)', 'Pay off full statement balance',
        'Pay off 1st full statement (Gold, Hard)') THEN 'Pay off first full statement balance'
      WHEN ${goal_name} IN ('Make 5 on-time minimum or greater statement payment (Gold, Streak, Easy)',
        'Make 7 on-time minimum or greater statement payment (Gold, Streak)') THEN 'Gold Streak (5 Easy, 7 Hard)'
      ELSE ${goal_name}
      END ;;
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
