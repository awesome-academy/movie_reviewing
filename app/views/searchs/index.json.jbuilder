json.array!(@posts) do |post|
  json.name post.title
  json.url post_review_path(post)
end
json.array!(@films) do |film|
  json.name film.name
  json.url film_path(film)
end

