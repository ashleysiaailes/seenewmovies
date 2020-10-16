view: cast_crew {
  sql_table_name: `lookerdata.mak_movies.cast_crew`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: characters {
    hidden: yes
    type: string
    sql: ${TABLE}.characters ;;
  }

  dimension: job {
    type: string
    sql: ${TABLE}.job ;;
  }

  dimension: nconst {
    hidden: yes
    type: string
    sql: ${TABLE}.nconst ;;
  }

  dimension: ordering {
    hidden: yes
    type: string
    sql: ${TABLE}.ordering ;;
  }

  dimension: tconst {
    hidden: yes
    type: string
    sql: ${TABLE}.tconst ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
