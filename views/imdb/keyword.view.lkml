view: keyword {
  sql_table_name: `lookerdata.imdb.keyword`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  measure: count {
    type: count
    drill_fields: [id, movie_keyword.count]
  }
}
