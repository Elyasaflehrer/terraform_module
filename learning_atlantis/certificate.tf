# FIRST CERTIFICATE
resource "aws_acm_certificate" "acm_cer_atlantis_ser" {
  domain_name       =  aws_route53_record.alias_r53_record_runatlantis_ser.name
  validation_method = "DNS"
  tags = {
    Name = "runatlantis_server"
  }
}

resource "aws_acm_certificate_validation" "acm_cer_vali_atlantis_ser" {
  certificate_arn         = aws_acm_certificate.acm_cer_atlantis_ser.arn
  validation_record_fqdns = [for record in aws_route53_record.r53_record_anc : record.fqdn]
}