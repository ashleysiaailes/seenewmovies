view: oscar_nominations {
  sql_table_name: `lookerdata.imdb.oscar_nominations`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: winner {
    type: yesno
    sql: ${TABLE}.winner ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: is_oscar_nominated {
    type: yesno
    sql: ${TABLE}.entity is not null ;;
  }

  dimension: is_oscar_winner {
    type: yesno
    sql: ${TABLE}.winner is true ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
