view: actor_responses_pdt {
  derived_table: {
    sql: with response_log as
      (Select unique_key,
          concat(Watch_Party_Date,"-",Host_Email)as host_key,
          Watch_Party_Date,
          Host_Email,
          email_address,
          Timestamp
      from seemovies.movie_responses),

actor_log as (Select unique_key,
    concat(Watch_Party_Date,"-",Host_Email)as host_key,
    An_Actor_Actress_you_d_like_to_see_on_the_screen as actor
from seemovies.movie_responses),

      votes as (SELECT
      response_log.host_key,
        response_log.host_email,
        response_log.watch_party_date,
        actor_log.actor AS actor,
        COUNT(distinct actor_log.unique_key) AS actor_votes
      FROM response_log
      INNER JOIN actor_log ON response_log.host_key=actor_log.host_key
      group by 1,2,3,4)

      SELECT
        host_key,
        host_email,
        watch_party_date,
        actor,
        actor_votes,
        rank() over (partition by host_email, watch_party_date order by actor_votes desc) as actor_rank
      from votes
 ;;
  }

  dimension: pk {
    type: string
    primary_key: yes
    sql: ${TABLE}.host_key || '-' || ${TABLE}.actor;;
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

  dimension: actor {
    type: string
    sql: ${TABLE}.actor ;;
  }

  dimension: actor_votes {
    type: number
    sql: ${TABLE}.actor_votes ;;
  }

  dimension: actor_rank {
    type: number
    sql: ${TABLE}.actor_rank ;;
  }

  set: detail {
    fields: [
      host_key,
      host_email,
      watch_party_date,
      actor,
      actor_votes,
      actor_rank
    ]
  }
}
