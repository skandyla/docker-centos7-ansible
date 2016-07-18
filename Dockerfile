FROM       centos:centos7
#FROM      ansible/centos7-ansible:stable
MAINTAINER Sergey Kandyla <skandyla@gmail.com>

# Add your playbooks to the Docker image
#ADD  ansible /srv/ansible
#WORKDIR  /srv/ansible

RUN  yum -y install epel-release \
     && yum -y install ansible \
     && echo -e "[local]\nlocalhost" > /etc/ansible/hosts


# Install some roles from galaxy
# Let's keep in mind docker philosophy - only one process per container
#
#RUN  ansible-galaxy install example-role

# Execute Ansible with your playbook's primary entry point.
# The "-c local" argument causes Ansible to use a "local connection" that
# won't attempt to  ssh in to localhost.
#
#RUN  ansible-playbook site.yml -c local
