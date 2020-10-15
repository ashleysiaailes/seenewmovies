view: title_basics {
  sql_table_name: `lookerdata.makoto_thesis.title_basics`
    ;;

  dimension: end_year {
    type: string
    sql: ${TABLE}.endYear ;;
  }

  dimension: genre1 {
    type: string
    sql: ${TABLE}.genre1 ;;
  }

  dimension: genre2 {
    type: string
    sql: ${TABLE}.genre2 ;;
  }

  dimension: genre3 {
    type: string
    sql: ${TABLE}.genre3 ;;
  }

  dimension: is_adult {
    type: string
    sql: ${TABLE}.isAdult ;;
  }

  dimension: original_title {
    type: string
    sql: ${TABLE}.originalTitle ;;
  }

  dimension: primary_title {
    type: string
    sql: ${TABLE}.primaryTitle ;;
  }

  dimension: runtime_minutes {
    type: string
    sql: ${TABLE}.runtimeMinutes ;;
  }

  dimension: start_year {
    type: string
    sql: ${TABLE}.startYear ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  dimension: title_type {
    type: string
    sql: ${TABLE}.titleType ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
