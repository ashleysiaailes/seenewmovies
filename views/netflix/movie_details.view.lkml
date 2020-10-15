view: movie_details {
  sql_table_name: `lookerdata.makoto_thesis.makoto_movies`
    ;;

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: director {
    type: string
    sql: ${TABLE}.director ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: gross {
    type: number
    sql: ${TABLE}.gross ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: released {
    type: string
    sql: ${TABLE}.released ;;
  }

  dimension: runtime {
    type: number
    sql: ${TABLE}.runtime ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: star {
    type: string
    sql: ${TABLE}.star ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.votes ;;
  }

  dimension: writer {
    type: string
    sql: ${TABLE}.writer ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
