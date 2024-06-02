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
        'Pay off 1st full statement (Gold, Hard)') THEN 'Pay off 1st full statement balance'
      WHEN ${goal_name} IN ('Make 5 on-time minimum or greater statement payment (Gold, Streak, Easy)',
        'Make 7 on-time minimum or greater statement payment (Gold, Streak)') THEN 'Gold Streak (5 Easy, 7 Hard)'
      WHEN ${goal_name} IN ('Pay off at least $200 since Gold was unlocked', 'Pay off at least $400',
      'Pay off at least $500 since Gold was unlocked') THEN '1st Gold Cum. Payment Goal ($200 Easy, $500 Hard, $400 Default)'
      WHEN ${goal_name} IN ('Pay off at least $300 since Gold was unlocked', 'Pay off at least $500')
        THEN '2nd Gold Cum. Payment Goal ($300 Easy, $500 Default)'
      WHEN ${goal_name} IN ('Make 2 on-time minimum or greater statement payment (Silver, Streak)',
        'Make 3 on-time minimum or greater statement payment (Silver, Streak)') THEN 'Silver Streak (2 Easy, 3 Hard)'
      WHEN ${goal_name} IN ('Pay off at least $200', 'Pay off at least $300', 'Pay off at least $200 since Silver was Unlocked',
      'Pay off at least $300 since Silver was unlocked') THEN 'Silver Cum. Payment Goal ($200 Easy, $300 Hard)'
      WHEN ${goal_name} IN ('Pay off at least $1,000', 'Pay off at least $700 since Platinum was unlocked')
        THEN '1st Platinum Cum. Payment Goal ($700 Easy, $1000 Default')
      WHEN ${goal_name} IN ('Pay off at least $1,250', 'Pay off at least $1000 since Platinum was unlocked')
        THEN '2nd Platinum Cum. Payment Goal ($1,000 Easy, $1,250 Default')
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
