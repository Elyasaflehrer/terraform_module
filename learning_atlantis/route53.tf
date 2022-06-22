data "aws_route53_zone" "route53_zone" {
  name         = var.route53_zone_domain_name
  private_zone = false
}

resource "aws_route53_record" "alias_r53_record_runatlantis_ser" {
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  name    = "runatlantis.cclab.cloud-castles.com"
  type    = "A"

  alias {
    name                   = aws_lb.lb_atlantis_ser.dns_name
    zone_id                = aws_lb.lb_atlantis_ser.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "r53_record_anc" {
  
  for_each = {
    for dvo in aws_acm_certificate.acm_cer_atlantis_ser.domain_validation_options : dvo.domain_name => {
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
  zone_id         = data.aws_route53_zone.route53_zone.zone_id
}


