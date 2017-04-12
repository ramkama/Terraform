## Aplication Symfony Parameters yml

  resource "template_file" "app-symfony_parameters_yml" {
    template = "${file("tplfile-app-symfony_parameters_yml")}"
    vars {
      }
  }
