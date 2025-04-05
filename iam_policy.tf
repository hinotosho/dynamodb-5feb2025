resource "aws_iam_policy" "dynamodb_access_policy" {
  name        = "daisy-dynamodb-access-policy-list-read-tf"
  description = "IAM policy to allow access to list & read my DynamoDB plus all other DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "dynamodb:BatchGetItem",
          "dynamodb:DescribeImport",
          "dynamodb:ConditionCheckItem",
          "dynamodb:DescribeContributorInsights",
          "dynamodb:Scan",
          "dynamodb:ListTagsOfResource",
          "dynamodb:Query",
          "dynamodb:DescribeStream",
          "dynamodb:DescribeTimeToLive",
          "dynamodb:DescribeGlobalTableSettings",
          "dynamodb:PartiQLSelect",
          "dynamodb:DescribeTable",
          "dynamodb:GetShardIterator",
          "dynamodb:DescribeGlobalTable",
          "dynamodb:GetItem",
          "dynamodb:DescribeContinuousBackups",
          "dynamodb:DescribeExport",
          "dynamodb:GetResourcePolicy",
          "dynamodb:DescribeKinesisStreamingDestination",
          "dynamodb:DescribeBackup",
          "dynamodb:GetRecords",
          "dynamodb:DescribeTableReplicaAutoScaling"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:us-east-1:255945442255:table/daisy-bookinventory-5feb2025"
      },
      #The above allows List & Read access into my own DynamoDB.
      {
        Effect = "Allow",
        Action = [
          "sts:AssumeRole",
          "dynamodb:Scan",
          "dynamodb:ListContributorInsights",
          "dynamodb:DescribeReservedCapacityOfferings",
          "dynamodb:ListGlobalTables",
          "dynamodb:ListTables",
          "dynamodb:DescribeReservedCapacity",
          "dynamodb:ListBackups",
          "dynamodb:GetAbacStatus",
          "dynamodb:ListImports",
          "dynamodb:DescribeLimits",
          "dynamodb:DescribeEndpoints",
          "dynamodb:ListExports",
          "dynamodb:ListStreams"
        ],
        Resource = "*"
      }
      //The above allows List & Read into all other DynamoDB created by other ppl. Can also describe the policies such 
      //that it allows me Update or Delete other ppl's DynamoDB. 
    ]
  })
}