view: title {
  sql_table_name: `lookerdata.imdb.title`
    ;;
  #drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: episode_nr {
    hidden: yes
    type: number
    sql: ${TABLE}.episode_nr ;;
  }

  dimension: episode_of_id {
    hidden: yes
    type: number
    sql: ${TABLE}.episode_of_id ;;
  }

  dimension: i1 {
    hidden: yes
    type: string
    sql: ${TABLE}.i1 ;;
  }

  dimension: i2 {
    hidden: yes
    type: string
    sql: ${TABLE}.i2 ;;
  }

  dimension: i3 {
    hidden: yes
    type: string
    sql: ${TABLE}.i3 ;;
  }

  dimension: kind_id {
    hidden: yes
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: production_year {
    type: number
    sql: ${TABLE}.production_year ;;
  }

  dimension: season_nr {
    hidden: yes
    type: number
    sql: ${TABLE}.season_nr ;;
  }

  dimension: series_year {
    hidden: yes
    type: string
    sql: ${TABLE}.series_year ;;
  }

  dimension: title {
    label: "Movie Title"
    type: string
    sql: ${TABLE}.title ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id]
  # }
}
