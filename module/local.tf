locals {
  //name = var.env != ""? "${var.component_name}-${var.env}" : var.component_name

  db_commands = [
    "rm -rf roboshop_shell1",
    "git clone https://github.com/rajace7/roboshop_shell1.git",
    "cd roboshop_shell1",
    "sudo bash ${var.component_name}.sh  ${var.password}"
  ]

  app_commands = [
  "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/rajace7/roboshop-ansible1.git roboshop.yml -e role_name = ${var.component_name} -e env=${var.env}"
  ]

}
