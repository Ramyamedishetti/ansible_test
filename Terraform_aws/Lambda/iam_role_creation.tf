#role creation for lambda

resource "aws_iam_role" "creating_lambdarole" {
  name = "terraform_aws_lambda_role"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole"
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
  }
  EOF
}

#IAM Policy for logging from a lambda

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name = "aws_policy_for_lambda_role"
  path = "/"
  description = "AWS IAM POLICY FOR managing aws lambda role"
  policy = <<EOF
  {
   "Version": "2012-10-07",
   "Statement": [
     {
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*",
        "Effect": "Allow"
     }
   ] 
  }
  EOF
}

#attaching policy to the role

resource "aws_iam_role_policy_attachment" "attaching_role_to_policy" {
  role = aws_iam_role.creating_lambdarole.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}

#Generate an archieve from content 

data "archive_file" "zipthepythoncode" {
  type = "zip"
  source_dir = "${path.module}/python/"
  output_path = "${path.module}/python/hello-python.zip"
}


