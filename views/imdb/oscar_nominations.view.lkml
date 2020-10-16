view: oscar_nominations {
  sql_table_name: `lookerdata.imdb.oscar_nominations`
    ;;

  dimension: category {
    label: "Award Catgory"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: entity {
    label: "Award Recipient"
    description: "Person or Movie Title of Award Recipient"
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: winner {
    label: "Is Oscar Winner"
    type: yesno
    sql: ${TABLE}.winner is true ;;
  }

  dimension: year {
    label: "Award Year"
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: is_oscar_nominated {
    type: yesno
    sql: ${TABLE}.entity is not null ;;
  }

  measure: count {
    type: count
    drill_fields: [title.title,year,category,entity,winner]
  }
}
