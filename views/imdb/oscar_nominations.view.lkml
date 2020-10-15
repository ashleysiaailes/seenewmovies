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

  measure: count {
    type: count
    drill_fields: []
  }
}
