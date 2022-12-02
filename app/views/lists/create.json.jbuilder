if @list.persisted?
  json.form render(partial: "lists/list", formats: :html, locals: {list: @list})
  json.inserted_item render(partial: "lists/list", formats: :html, locals: {list: @list})
# else
#   json.form render(partial: "reviews/form", formats: :html, locals: {restaurant: @restaurant, review: @review})
end
