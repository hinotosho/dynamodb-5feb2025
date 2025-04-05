resource "aws_dynamodb_table" "bookinventory" {
  name         = "daisy-bookinventory-5feb25"
  billing_mode = "PAY_PER_REQUEST" # Automatically scales based on usage
  hash_key     = "ISBN"            # Partition key
  range_key    = "Genre"           # Sort key

  attribute {
    name = "ISBN"
    type = "S" # 'S' for string type
  }

  attribute {
    name = "Genre"
    type = "S" # 'S' for string type
  }

  tags = {
    Environment = "Dev"
    Name        = "Book_Inventory_Table_5feb2025"
  }
}