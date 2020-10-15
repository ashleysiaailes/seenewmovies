view: movie_keyword {
  sql_table_name: `lookerdata.imdb.movie_keyword`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: keyword_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.keyword_id ;;
  }

  dimension: movie_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movie_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, keyword.id, movies.id]
  }
}
