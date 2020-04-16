connection: "sy-cloudsql-demos"

include: "/views/cloudsql/*.view"                # include all views in the views/ folder in this project

datagroup: sy_demo_cloudsql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sy_demo_cloudsql_default_datagroup

explore: call_weather_report {
  join: seoul_weather_2018 {
    type: inner
    sql_on: left(${call_weather_report.addr_sido}, 2) = left(${seoul_weather_2018.sido}, 2)
              AND ${call_weather_report.addr_sigungu} = ${seoul_weather_2018.gungu}
              AND left(${call_weather_report.addr_dong}, 2) = left(${seoul_weather_2018.dong}, 2)
              AND ${call_weather_report.date} = ${seoul_weather_2018.date}
              AND ${call_weather_report.time_tier} = ${seoul_weather_2018.hour};;
    relationship: one_to_one
  }
}

explore: call_population_report {
  join: seoul_population {
    type: inner
    sql_on: left(${call_population_report.addr_sido}, 2) = left(${seoul_population.sido}, 2)
              AND ${call_population_report.addr_sigungu} = ${seoul_population.gungu}
              AND left(${call_population_report.addr_dong}, 2) = left(${seoul_population.dongmyeon}, 2);;
    relationship: one_to_one
  }
}


explore: call_delivery {}
explore: seoul_weather_2018 {
  hidden: yes
}
explore: seoul_population {
  hidden: yes
}
