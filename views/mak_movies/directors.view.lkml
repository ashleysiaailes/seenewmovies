view: directors {
  sql_table_name: `lookerdata.mak_movies.directors`
    ;;
  drill_fields: [director_id]

  dimension: director_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.director_id ;;
  }

  dimension: movie_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.movie_id ;;
  }

  measure: count {
    type: count
    drill_fields: [director_id, movies.id]
  }
}
