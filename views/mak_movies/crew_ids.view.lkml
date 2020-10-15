view: crew_ids {
  sql_table_name: `lookerdata.mak_movies.crew_ids`
    ;;

  dimension: directors {
    type: string
    sql: ${TABLE}.directors ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  dimension: writers {
    type: string
    sql: ${TABLE}.writers ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
