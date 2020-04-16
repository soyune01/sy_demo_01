view: call_weather_report {
  sql_table_name: call_delivery
    ;;

  dimension: addr_dong {
    type: string
    sql: ${TABLE}.addr_dong;;
  }

  dimension: addr_sido {
    type: string
    sql: ${TABLE}.addr_sido ;;
  }

  dimension: addr_sigungu {
    type: string
    sql: ${TABLE}.addr_sigungu ;;
  }

  dimension: call_cnt {
    type: number
    sql: ${TABLE}.call_cnt ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: industry_item {
    type: string
    sql: ${TABLE}.industry_item ;;
  }

  dimension: time_tier {
    type: string
    sql: ${TABLE}.time_tier ;;
  }

  measure: count {
    type: count
    drill_fields: [call_details*]
  }

  measure: call_sum {
    type: sum
    sql: ${TABLE}.call_cnt ;;
    drill_fields: [call_details*]
  }

  measure: call_sum_chicken {
    type:sum
    sql: CASE WHEN  ${TABLE}.industry_item = '치킨' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }
  measure: call_sum_pizza {
    type: sum
    sql: CASE WHEN  ${TABLE}.industry_item = '피자' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }
  measure: call_sum_china {
    type: sum
    sql: CASE WHEN  ${TABLE}.industry_item = '음식점-중국음식' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }
  measure: call_sum_pork {
    type: sum
    sql: CASE WHEN  ${TABLE}.industry_item = '음식점-족발/보쌈전문' THEN ${TABLE}.call_cnt ELSE 0 END ;;
  }

  set: call_details {
    fields: [addr_sido, addr_sigungu, addr_dong, date, time_tier, industry_item,call_cnt]
  }

}
