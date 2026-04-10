output "bucket_name" {
  description = "S3 bucket name for site content"
  value       = module.site.bucket_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (used for cache invalidation)"
  value       = module.site.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.site.cloudfront_domain_name
}
