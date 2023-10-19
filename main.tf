terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}


provider "aws" {
  
  region     = var.region

  default_tags {
    tags = {

      Owner   = "HardikPatel"
      Project = "StepFunctionWorkflowDemo"
    }
  }
}


module "step_function_workflow" {
  source   = "./module"
  name     = var.stepfunction
  lambda_role_name = var.lambdarole
  role_name = var.role_name
  lambda_function_name = var.lambda_function_name
  
}
