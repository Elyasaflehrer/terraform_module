resource "aws_acm_certificate" "acm_tf" {
  domain_name       =  "www.example.com"
  validation_method = "DNS"
  tags = {
    Name = "certificate_alb_project"
  }

}

data "aws_route53_zone" "example" {
  name         = "your_domain_name_from_rout53"
  private_zone = false
}

resource "aws_route53_record" "alias_r53_record" {
  zone_id = data.aws_route53_zone.example.zone_id
  name    = "www.example.com"
  type    = "A"

  alias {
    name                   = aws_lb.aws_lb.dns_name
    zone_id                = aws_lb.aws_lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "r53_record" {
  
  for_each = {
    for dvo in aws_acm_certificate.acm_tf.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.example.zone_id
}

resource "aws_acm_certificate_validation" "acm_cer_vali" {
  certificate_arn         = aws_acm_certificate.acm_tf.arn
  validation_record_fqdns = [for record in aws_route53_record.r53_record : record.fqdn]
}

