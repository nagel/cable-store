json.array! @cables.each do |cable| 
  json.partial! "cable.json.jbuilder", cable: cable
end




