view: movie_info {
  sql_table_name: `lookerdata.imdb.movie_info`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: info {
    type: string
    sql: ${TABLE}.info ;;
  }

  dimension: info_type_id {
    type: number
    sql: ${TABLE}.info_type_id ;;
  }

  dimension: movie_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movie_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, movies.id]
  }
}
