resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "this" {
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  private_key_pem = tls_private_key.this.private_key_pem

  subject {
    common_name  = aws_alb.code_runner_alb.dns_name
    organization = "Example Co"
  }

  validity_period_hours = 8760 # 1 year
}

resource "aws_acm_certificate" "self_signed" {
  private_key       = tls_private_key.this.private_key_pem
  certificate_body  = tls_self_signed_cert.this.cert_pem
  certificate_chain = tls_self_signed_cert.this.cert_pem
}
