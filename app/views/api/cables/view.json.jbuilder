

@cables.each do |cable| 
  json.name cable.name
  json.price cable.price
  json.length cable.length
  json.function cable.function
  json.model_year cable.model_year
  json.cable cable.description
end




