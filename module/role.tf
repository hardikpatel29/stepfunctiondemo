resource "aws_iam_role" "step_functions_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "states.amazonaws.com"
        }
      }
    ]
  })

  inline_policy {
    name = "lambda_full_access"

    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action = "lambda:*",
          Effect = "Allow",
          Resource = "*"
        }
      ]
    })
  }

  inline_policy {
    name = "sns_full_access"

    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action = "sns:*",
          Effect = "Allow",
          Resource = "*"
        }
      ]
    })
  }

  inline_policy {
    name = "cloudwatch_logs_full_access"

    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action = "logs:*",
          Effect = "Allow",
          Resource = "*"
        }
      ]
    })
  }

  inline_policy {
    name = "xray_full_access"

    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action = [ 
            "xray:PutTraceSegments",
            "xray:PutTelemetryRecords",
            "xray:GetSamplingRules",
            "xray:GetSamplingTargets"
            ]
          Effect = "Allow",
          Resource = "*"
        }
      ]
    })
  }
}

#===================LammbdaRole=============================

resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  inline_policy {
    name = "lambda_execution_policy"

    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action = "logs:CreateLogGroup",
          Effect = "Allow",
          Resource = "*"
        },
        {
          Action = "logs:CreateLogStream",
          Effect = "Allow",
          Resource = "*"
        },
        {
          Action = "logs:PutLogEvents",
          Effect = "Allow",
          Resource = "*"
        },
        {
          Action = "xray:PutTraceSegments",
          Effect = "Allow",
          Resource = "*"
        }
        
      ]
    })
  }
}
