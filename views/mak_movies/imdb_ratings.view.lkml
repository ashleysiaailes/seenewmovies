view: imdb_ratings {
  sql_table_name: `lookerdata.mak_movies.imdb_ratings`
    ;;

  dimension: avg_rating {
    type: number
    sql: ${TABLE}.avg_rating ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  dimension: vote_count {
    type: number
    sql: ${TABLE}.vote_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
