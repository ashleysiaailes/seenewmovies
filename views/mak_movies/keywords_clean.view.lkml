view: keywords_clean {
  sql_table_name: `lookerdata.mak_movies.keywords_clean`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: movieid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.movieid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, movies.id]
  }
}
