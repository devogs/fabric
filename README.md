# fabric

An automated solution to deploy a Cisco MP-BGP fabric integrated with a Kubernetes cluster. This project leverages Terraform for infrastructure provisioning, NetBox as the source of truth, Ansible for configuration management, and Jenkins for continuous integration and deployment.

## Overview

This repository provides an end-to-end automation pipeline that:

* Provisions network infrastructure using Terraform.
* Populates NetBox with the infrastructure details.
* Utilizes NetBox as a dynamic inventory for Ansible.
* Applies configurations to Cisco switches using Ansible.
* Automates the entire workflow through Jenkins pipelines.([GitHub][1], [NetBox Labs][2], [GitHub][3])

## Architecture

The solution is structured into the following components:([osism.tech][4])

* **Terraform Modules**: Located in the `terraform-netbox/` directory, these modules define the network topology and resources, interfacing with NetBox to register devices and configurations.
* **NetBox**: Acts as the single source of truth, storing detailed information about the network infrastructure.
* **Ansible Playbooks**: Found in the `ansible/` directory, these playbooks retrieve inventory data from NetBox and apply configurations to the network devices.
* **Jenkins Pipeline**: Defined in the `Jenkinsfile`, it orchestrates the automation process, triggering Terraform and Ansible tasks upon code changes.([GitHub][5], [Cisco DevNet][6], [Cisco Blogs][7])

## Prerequisites

Ensure the following tools are installed and configured:

* [Terraform](https://www.terraform.io/downloads.html)
* [NetBox](https://netbox.readthedocs.io/en/stable/installation/)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* [Jenkins](https://www.jenkins.io/doc/book/installing/)
* Cisco switches supporting MP-BGP in Spine-Leaf Architecture
* K8s Servers

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/devogs/fabric.git
cd fabric
```

### 2. Configure NetBox

* Install and set up NetBox following the [official documentation](https://netbox.readthedocs.io/en/stable/installation/).
* Ensure the NetBox API is accessible and obtain an API token.

### 3. Set Up Terraform

* Navigate to the `terraform-netbox/` directory.

* Initialize Terraform:([YouTube][8])

```bash
  terraform init
```



* Configure the `terraform.tfvars` file with your environment-specific variables.

* Apply the Terraform configuration:([Cisco Blogs][7])

```bash
  terraform apply
```



This step provisions the network infrastructure and populates NetBox with the relevant data.([NetBox Labs][2])

### 4. Configure Ansible

* Ensure the `ansible.cfg` file is set to use NetBox as the dynamic inventory source.

* Install the required Ansible collections:([NetBox Labs][2], [Ansible Documentation][9])

```bash
  ansible-galaxy collection install netbox.netbox
```



* Navigate to the `ansible/` directory and run the playbooks:([Reddit][10])

```bash
  ansible-playbook site.yml
```



This applies the necessary configurations to the Cisco switches based on the data from NetBox.

### 5. Set Up Jenkins

* Install Jenkins and the necessary plugins (e.g., Pipeline, Git, Ansible).
* Configure Jenkins credentials and environment variables as needed.
* Create a new Jenkins pipeline job and point it to this repository.
* Use the provided `Jenkinsfile` to define the pipeline stages.

Upon committing changes to the repository, Jenkins will automatically trigger the pipeline, executing Terraform and Ansible tasks accordingly.([GitHub][1])

## Directory Structure

```plaintext
fabric/
├── ansible/
│   ├── inventory/
│   ├── playbooks/
│   └── ansible.cfg
├── terraform-netbox/
│   ├── main.tf
│   ├── variables.tf
│   └── terraform.tfvars
├── Jenkinsfile
├── requirements.txt
└── README.md
```



## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

* [Terraform](https://www.terraform.io/)
* [NetBox](https://netbox.readthedocs.io/)
* [Ansible](https://www.ansible.com/)
* [Jenkins](https://www.jenkins.io/)