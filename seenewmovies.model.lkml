connection: "lookerdata"

include: "/views/imdb/*.view.lkml"
include: "/views/mak_movies/*.view.lkml"
include: "/views/netflix/*.view.lkml"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: movies {
  join: netflix_original_films {
    sql_on: ${movies.title}=${netflix_original_films.title} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: oscar_nominations_movies {
    from: oscar_nominations
    sql_on: ${movies.title}=${oscar_nominations_movies.entity} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: genres {
    sql_on: ${movies.id}=${genres.movieid} ;;
    relationship: one_to_many
    type: inner
  }

  join: cast_crew {
    sql_on: ${movies.imdbid}=${cast_crew.tconst} ;;
    relationship: one_to_many
    type: inner
  }

  join: names {
    sql_on: ${cast_crew.nconst}=${names.nconst} ;;
    relationship: many_to_one
    type: inner
  }

}


explore: netflix_movies {
  hidden: yes
  from: movie_details

  join: netflix_original_films {
    sql_on: ${netflix_movies.name}=${netflix_original_films.title} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: oscar_nominations_movies {
    from: oscar_nominations
    sql_on: ${netflix_movies.name}=${oscar_nominations_movies.entity} ;;
    relationship: one_to_many
    type: left_outer
  }
}
