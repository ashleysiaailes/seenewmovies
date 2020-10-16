view: genres {
  sql_table_name: `lookerdata.mak_movies.genres`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
    case_sensitive: no
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
