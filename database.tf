resource "aws_dynamodb_table_item" "item_one" {
  table_name = aws_dynamodb_table.bookinventory.name
  hash_key   = "ISBN"
  range_key  = "Genre"

  item = jsonencode({
    "ISBN" : { "S" : "978-0134685991" },
    "Genre" : { "S" : "Technology" },
    "Title" : { "S" : "Effective Java" },
    "Author" : { "S" : "Joshua Bloch" },
    "Stock" : { "N" : "1" }
  })
}

resource "aws_dynamodb_table_item" "item_two" {
  table_name = aws_dynamodb_table.bookinventory.name
  hash_key   = "ISBN"
  range_key  = "Genre"

  item = jsonencode({
    "ISBN" : { "S" : "978-0134685009" },
    "Genre" : { "S" : "Technology" },
    "Title" : { "S" : "Learning Python" },
    "Author" : { "S" : "Mark Lutz" },
    "Stock" : { "N" : "2" }
  })
}

resource "aws_dynamodb_table_item" "item_three" {
  table_name = aws_dynamodb_table.bookinventory.name
  hash_key   = "ISBN"
  range_key  = "Genre"

  item = jsonencode({
    "ISBN" : { "S" : "974-0134789698" },
    "Genre" : { "S" : "Fiction" },
    "Title" : { "S" : "The Hitchhiker" },
    "Author" : { "S" : "Douglas Adams" },
    "Stock" : { "N" : "10" }
  })
}
