view: weather_seoul {
  sql_table_name: `stf-development.looker_demo.weather_seoul`
    ;;

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: mean_temperature {
    type: number
    sql: ${TABLE}.mean_temperature ;;
  }

  dimension: rain_period {
    type: number
    sql: ${TABLE}.rain_period ;;
  }

  dimension: rainfall {
    type: number
    sql: ${TABLE}.rainfall ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
