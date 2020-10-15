view: actor_firstname_title_year {
  sql_table_name: `lookerdata.imdb.actor_firstname_title_year`
    ;;

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [full_name, name]
  }
}
