# Alpha-wordpress

**using Terraform to spin up a WordPress application.**

This project is used to spin Wordpress Content Management System on an Ubuntu Machine on AWS EC2 Instance.

The wordpress.tpl file in the repo contains the set of bash commands required to provision a wordpress application on an ubuntu machine.

We first installed an apache web server, then a mysql database server which is used as a management databases for Wordpress databases. Then, we installed PHP which is the backend language for Wordpress.