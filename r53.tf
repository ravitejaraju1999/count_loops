resource "route53_record" "roboshop" {
  count   = LENGTH(var.instances) # it returns count value dynamically based on lenth of list
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.raviteja.store
  type    = "A"
  ttl     = 300
  records = [aws_instance.terraform.*.public_ip]
}