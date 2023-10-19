# main.tf

resource "aws_sfn_state_machine" "MyExample" {
  name     = var.name
  role_arn = aws_iam_role.step_functions_role.arn
  type = "EXPRESS"
  definition = data.template_file.my_state_machine.rendered
  depends_on = [ aws_lambda_function.my_lambda ] 
}

data "template_file" "my_state_machine" {
  template = file("${path.module}/step-function.json")
  vars = {
    lambda_arn = aws_lambda_function.my_lambda.arn
  }
}


