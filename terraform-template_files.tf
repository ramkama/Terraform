resource "template_file" "ec2-instance_userdata" {
  template  = "${file("tplfile-ec2-instance_userdata")}"
  vars {
    iamAccessKey  = "${var.aws_access_key}"
    iamSecretKey  = "${var.aws_secret_key}"
    activeRegion  = "${var.aws_region}"
  }
}

resource "template_file" "iam-appuser_credentials" {
  template = "${file("tplfile-iam-appuser_credentials")}"
  vars {
    iamAccKey = "${aws_iam_access_key.appuser.id}"
    iamSecKey = "${aws_iam_access_key.appuser.secret}"
  }
}

resource "template_file" "github-repository_info" {
  template = "${file("tplfile-github-repository_info")}"
  vars {
    github_username     = "${var.project_gitrepo_uname}"
    github_password     = "${var.project_gitrepo_upass}"
    github_repo_url     = "${var.project_gitrepo_url}"
    github_repo_branch  = "${var.project_gitrepo_branch}"
  }
}

resource "template_file" "github-repository_sshprvkey" {
  template = "${file("tplfile-github-repository_sshprvkey")}"
  vars {
    github_ssh_prv_key  = "${var.project_gitrepo_ssh_keypair_private}"
  }
}

## Application vHost Configuration Files

  resource "template_file" "vhost-nginx_conf" {
    template = "${file("tplfile-vhost-nginx_conf")}"
    vars {
      app_eco = "${var.prj_ecosystem}"
      app_name = "${var.prj_application}"
    }
  }

  resource "template_file" "vhost-phpfpm_conf" {
    template = "${file("tplfile-vhost-phpfpm_conf")}"
    vars {
      app_eco = "${var.prj_ecosystem}"
      app_name = "${var.prj_application}"
    }
  }

  resource "template_file" "vhost-newrelic_conf" {
    template = "${file("tplfile-vhost-newrelic_conf")}"
    vars {
      project_name = "${var.project_name}"
    }
  }

## Cloudwatch Logs Monitoring Configuration Files

  resource "template_file" "cloudwatch-allInstances_app_logs_conf" {
    template = "${file("tplfile-cloudwatch-allInstances_app_logs_conf")}"
    vars {
      app_eco   = "${var.prj_ecosystem}"
      app_name  = "${var.prj_application}"
      app_env   = "${var.prj_environment}"
    }
  }

  resource "template_file" "cloudwatch-allInstances_gqm_qc_daemons_logs_conf" {
    template = "${file("tplfile-cloudwatch-allInstances_gqm_qc_daemons_logs_conf")}"
    vars {
      app_eco   = "${var.prj_ecosystem}"
      app_name  = "${var.prj_application}"
      app_env   = "${var.prj_environment}"
    }
  }

  resource "template_file" "cloudwatch-allInstances_services_logs_conf" {
    template = "${file("tplfile-cloudwatch-allInstances_services_logs_conf")}"
    vars {
      app_eco   = "${var.prj_ecosystem}"
      app_name  = "${var.prj_application}"
      app_env   = "${var.prj_environment}"
    }
  }

  resource "template_file" "cloudwatch-allInstances_vhost_logs_conf" {
    template = "${file("tplfile-cloudwatch-allInstances_vhost_logs_conf")}"
    vars {
      app_eco   = "${var.prj_ecosystem}"
      app_name  = "${var.prj_application}"
      app_env   = "${var.prj_environment}"
    }
  }
