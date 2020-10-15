view: netflix_original_non_films {
  sql_table_name: `lookerdata.makoto_thesis.NetflixOriginalNonFilms`
    ;;

  dimension: genre {
    type: string
    sql: ${TABLE}.Genre ;;
  }

  dimension_group: release {
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
    sql: ${TABLE}.Release ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
