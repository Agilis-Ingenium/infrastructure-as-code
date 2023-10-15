resource "railway_project" "project" {
  name = "api.nubadoo.com"
}

resource "railway_service" "service" {
  name       = "api"
  project_id = railway_project.project.id
  source_repo = "Agilis-Ingenium/api.nubadoo.com"
}

resource "railway_deployment_trigger" "deployment" {
  repository     = "Agilis-Ingenium/api.nubadoo.com"
  branch         = "main"
  check_suites   = true
  environment_id = railway_project.project.default_environment.id
  service_id     = railway_service.service.id
}

resource "railway_custom_domain" "api" {
  domain     = "api.nubadoo.com"
  environment_id = railway_project.project.default_environment.id
  service_id     = railway_service.service.id
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = railway_custom_domain.api.host_label
  type    = "CNAME"
  ttl     = 300
  records = [railway_custom_domain.api.dns_record_value]
}

data "aws_route53_zone" "domain" {
  name = "nubadoo.com"
}

