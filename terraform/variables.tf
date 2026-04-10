variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "domain_name" {
  description = "FQDN for the site (e.g. console.dev.orcastration.ai)"
  type        = string
}

variable "root_domain" {
  description = "Root domain for Route 53 zone lookup (e.g. dev.orcastration.ai)"
  type        = string
}

variable "enable_waf" {
  description = "Whether to attach the WAF WebACL to the CloudFront distribution"
  type        = bool
  default     = false
}
