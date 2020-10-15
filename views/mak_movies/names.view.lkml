view: names {
  sql_table_name: `lookerdata.mak_movies.names`
    ;;

  dimension: birth_year {
    type: string
    sql: ${TABLE}.birth_year ;;
  }

  dimension: death_year {
    type: string
    sql: ${TABLE}.death_year ;;
  }

  dimension: known_for {
    type: string
    sql: ${TABLE}.known_for ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nconst {
    type: string
    sql: ${TABLE}.nconst ;;
  }

  dimension: primary_profession {
    type: string
    sql: ${TABLE}.primary_profession ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
