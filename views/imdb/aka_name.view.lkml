view: aka_name {
  sql_table_name: `lookerdata.imdb.aka_name`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.person_id ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id, name]
  # }
}
