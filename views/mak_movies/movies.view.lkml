view: movies {
  sql_table_name: `lookerdata.mak_movies.movies`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: adult {
    type: yesno
    sql: BOOLEAN(${TABLE}.adult) ;;
  }

  dimension: belongs_to_collection {
    type: yesno
    sql: ${TABLE}.belongs_to_collection ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: genres {
    hidden: yes
    type: string
    sql: ${TABLE}.genres ;;
  }

  dimension: homepage {
    type: string
    sql: ${TABLE}.homepage ;;
  }

  dimension: imdbid {
    type: string
    sql: ${TABLE}.imdbid ;;
    link: {
    label: "IMDB Link"
    url: "https://www.imdb.com/title/{{ value }}"
    }
  }

  dimension: IMDB_Link{
    type: string
    sql: "https://www.imdb.com/title/" || ${TABLE}.imdbid ;;
    link: {
      label: "IMDB Link"
      url: "{{ value }}"
    }
  }

  dimension: original_language {
    type: string
    sql: ${TABLE}.original_language ;;
  }

  dimension: original_title {
    hidden: yes
    type: string
    sql: ${TABLE}.original_title ;;
  }

  dimension: overview {
    type: string
    sql: ${TABLE}.overview ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

  dimension: poster_image {
    type: string
    sql: ${TABLE}.poster_path;;
    html: <img src="https://image.tmdb.org/t/p/w342{{value}}" /> ;;
  }

  dimension: poster_path {
    type: string
    sql: "https://image.tmdb.org/t/p/w342" || ${TABLE}.poster_path ;;
  }

  dimension: production_companies {
    type: string
    sql: ${TABLE}.production_companies ;;
  }

  dimension: production_countries {
    type: string
    sql: ${TABLE}.production_countries ;;
  }

  dimension_group: release {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_date ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: runtime {
    type: number
    sql: ${TABLE}.runtime ;;
  }

  dimension: spoken_languages {
    type: string
    sql: ${TABLE}.spoken_languages ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tagline {
    type: string
    sql: ${TABLE}.tagline ;;
  }

  dimension: title {
    label: "Movie Title"
    type: string
    sql: ${TABLE}.title;;
    link: {
      label: "IMDB Link"
      url: "https://www.imdb.com/title/{{movies.imdbid._rendered_value}}"
    }
  }

  dimension: video {
    type: yesno
    sql: ${TABLE}.video ;;
  }

  dimension: vote_average {
    type: number
    sql: ${TABLE}.vote_average ;;
  }

  dimension: vote_count {
    type: number
    sql: ${TABLE}.vote_count ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      movie_companies.count,
      movie_info.count,
      cast_info.count,
      collections.count,
      directors.count,
      genres.count,
      movie_keyword.count,
      keywords_clean.count,
      links.count,
      production_companies.count,
      spoken_languages.count,
      writers.count,
      production_countries.count
    ]
  }
}
