view: netflix_original_films {
  sql_table_name: `lookerdata.makoto_thesis.NetflixOriginalFilms`
    ;;

  dimension: genre {
    hidden: yes
    type: string
    sql: ${TABLE}.Genre ;;
  }

  dimension_group: release {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: is_netflix_original {
    view_label: "Netflix Movies"
    type: yesno
    sql: ${TABLE}.Title is not null ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
