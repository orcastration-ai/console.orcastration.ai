terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    region  = "us-east-1"
    encrypt = true
    # bucket and key provided via -backend-config in CI
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_route53_zone" "this" {
  name = var.root_domain
}

data "aws_ssm_parameter" "waf_acl_arn" {
  count = var.enable_waf ? 1 : 0
  name  = "/orca/${var.environment}/waf/cloudfront-web-acl-arn"
}

module "site" {
  source = "git::https://github.com/orcastration-ai/.github.git//terraform/modules/static-site?ref=main"

  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.this.zone_id
  environment = var.environment
  spa_mode    = true
  web_acl_id  = var.enable_waf ? data.aws_ssm_parameter.waf_acl_arn[0].value : ""
}
