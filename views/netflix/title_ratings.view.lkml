view: title_ratings {
  sql_table_name: `lookerdata.makoto_thesis.title_ratings`
    ;;

  dimension: average_rating {
    type: number
    sql: ${TABLE}.averageRating ;;
  }

  dimension: num_votes {
    type: number
    sql: ${TABLE}.numVotes ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
