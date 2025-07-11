pipeline {
  agent any
  triggers {
    githubPush()
  }
  stages {
    stage("Terraform Apply") {
      steps {
        dir("terraform") {
          sh "terraform init"
          sh "terraform apply -auto-approve"
        }
      }
    }
    stage("Run Ansible") {
      steps {
        dir("ansible") {
          sh "ansible-playbook playbook.yml"
        }
      }
    }
  }
}
