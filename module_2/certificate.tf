resource "aws_acm_certificate" "acm_tf" {
  domain_name       =  "www.example.com"
  validation_method = "DNS"
  tags = {
    Name = "certificate_alb_project"
  }

}



resource "aws_acm_certificate_validation" "acm_cer_vali" {
  certificate_arn         = aws_acm_certificate.acm_tf.arn
  validation_record_fqdns = [for record in aws_route53_record.r53_record : record.fqdn]
}

