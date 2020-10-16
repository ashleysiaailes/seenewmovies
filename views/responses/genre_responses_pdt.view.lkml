view: genre_responses_pdt {
  derived_table: {
    sql: with response_log as
      (Select unique_key,
          concat(Watch_Party_Date,"-",Host_Email)as host_key,
          Watch_Party_Date,
          Host_Email,
          email_address,
          Timestamp
      from seemovies.movie_responses),

      genre_dt as(
      Select unique_key,
      split(What_are_you_in_the_mood_for_,",") as genre,
      An_Actor_Actress_you_d_like_to_see_on_the_screen as actor,
      concat(Watch_Party_Date,"-",Host_Email)as host_key
      from seemovies.movie_responses
      ),

      genre_log as (Select unique_key || '-' || genre as pk, host_key, genre
      from genre_dt
      cross join UNNEST(genre_dt.genre)as genre),

      votes as (SELECT
      response_log.host_key,
        response_log.host_email,
        response_log.watch_party_date,
        genre_log.genre  AS genre,
        COUNT(DISTINCT genre_log.pk) AS genre_votes
      FROM response_log
      INNER JOIN genre_log ON response_log.host_key=genre_log.host_key
      group by 1,2,3,4)

      SELECT
        host_key,
        host_email,
        watch_party_date,
        genre,
        genre_votes,
        rank() over (partition by host_email, watch_party_date order by genre_votes desc) as genre_rank
      from votes
       ;;
      persist_for: "1 minute"
  }

  dimension: pk {
    type: string
    primary_key: yes
    sql: ${TABLE}.host_key || '-' || ${TABLE}.genre;;
    hidden: yes
    }

  dimension: host_key {
    type: string
    sql: ${TABLE}.host_key ;;
  }

  dimension: host_email {
    type: string
    sql: ${TABLE}.host_email ;;
  }

  dimension: watch_party_date {
    type: date
    datatype: date
    sql: ${TABLE}.watch_party_date ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: genre_votes {
    type: number
    sql: ${TABLE}.genre_votes ;;
  }

  dimension: genre_rank {
    type: number
    sql: ${TABLE}.genre_rank ;;
  }

  set: detail {
    fields: [host_email, watch_party_date, genre, genre_votes, genre_rank]
  }
}
