  json.id cable.id
  json.name cable.name
  json.price cable.price
  json.length cable.length
  json.function cable.function
  json.images cable.images #calls images method from cable model class and provides all image information
  json.model_year cable.model_year
  json.description cable.description
  json.in_stock? cable.in_stock
  json.discount cable.is_discounted?
  json.tax cable.tax
  json.total cable.total
  json.vendor_info cable.vendor #calls vendor method from cable model class and provides all vendor information