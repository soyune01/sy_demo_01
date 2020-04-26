view: seoul_households {
  sql_table_name: `stf-development.looker_demo.seoul_households`
    ;;

  dimension: dongmyeon {
    type: string
    sql: ${TABLE}.dongmyeon ;;
  }

  dimension: gungu {
    type: string
    sql: ${TABLE}.gungu ;;
  }

  dimension: household_1 {
    type: number
    sql: ${TABLE}.household_1 ;;
  }

  dimension: households_2 {
    type: number
    sql: ${TABLE}.households_2 ;;
  }

  dimension: households_3 {
    type: number
    sql: ${TABLE}.households_3 ;;
  }

  dimension: households_4 {
    type: number
    sql: ${TABLE}.households_4 ;;
  }

  dimension: households_5 {
    type: number
    sql: ${TABLE}.households_5 ;;
  }

  dimension: households_6 {
    type: number
    sql: ${TABLE}.households_6 ;;
  }

  dimension: households_more6 {
    type: number
    sql: ${TABLE}.households_more6 ;;
  }

  dimension: sido {
    type: string
    sql: ${TABLE}.sido ;;
  }

  dimension: total_households {
    type: number
    sql: ${TABLE}.total_households ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: sum {
    type: sum
    sql: ${TABLE}.total_households ;;
    drill_fields: [sido, gungu, dongmyeon, year, household_1, households_2, households_3, households_4, households_5, households_6, households_more6]
  }
}
