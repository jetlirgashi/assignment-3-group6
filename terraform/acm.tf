module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = data.aws_route53_zone.appstellar-training.name
  zone_id      = data.aws_route53_zone.appstellar-training.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "jetlir-assignment3.${data.aws_route53_zone.appstellar-training.name}"
  ]

  wait_for_validation = true

  tags = {
    Name = "jetlir-assignment3.${data.aws_route53_zone.appstellar-training.name}"
  }
}