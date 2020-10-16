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
explore: netflix_movies {
  from: movie_details
  join: netflix_original_films {
    sql_on: ${netflix_movies.name}=${netflix_original_films.title} ;;
    relationship: one_to_one
    type: left_outer
  }
}
