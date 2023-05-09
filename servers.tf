module "database_servers" {

  for_each = var.database_servers

  source = "./module"
  component_name = each.value["name"]
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null")
  provisioner = true

}

module "application_servers" {

  depends_on = [module.database_servers]

  for_each = var.application_servers

  source = "./module"
  component_name = each.value["name"]
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null")

}