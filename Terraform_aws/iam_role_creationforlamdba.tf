#role creation for lambda

resource "aws_iam_role" "creating_lambdarole" {
  name = "terraform_aws_lambda_role"
  path = "/"
  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

data "template_file" "lambda_policy_file" {
  template = file("policy/lambda_policy.json")
}

#IAM Policy for logging from a lambda

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name = "aws_policy_for_lambda_role"
  path = "/"
  description = "AWS IAM POLICY FOR managing aws lambda role"
  policy = data.template_file.lambda_policy_file.rendered
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


resource "aws_lambda_function" "lambda_function_terraform" {
  filename = "${path.module}/python/hello-python.zip"
  function_name = "myfirstlambdafunction"
  role = aws_iam_role.creating_lambdarole.arn
  handler = "hello-python.lambda_handler"
  runtime = "python3.8"
  depends_on = [ aws_iam_role_policy_attachment.attaching_role_to_policy]
}

output "terraform_awsrole_output" {
    value = "aws_iam_role.creating_lambdarole.name"
}

output "terraform_awsrole_arn_output" {
    value = "aws_iam_role.creating_lambdarole.arn"
}

output "terraform_awspolicy_arn_output" {
    value = "aws_iam_policy.iam_policy_for_lambda.arn"
}