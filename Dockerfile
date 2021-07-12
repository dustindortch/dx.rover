FROM centos:centos7.7.1908

ARG hashicorpRelease=RHEL
ARG versionAnsible=2.9.12

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y openssh-clients; \
    yum install -y expect; \
    yum install -y sshpass; \
    yum install -y git; \
    yum install -y powershell; \
    yum install yum-utils; \
    yum clean all; \
    pip3 install --upgrade pip

RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/${hashicorpRelease}/hashicorp.repo; \
    yum install -y terraform; \
    yum install -y packer; \
    yum install -y vault

RUN pip3 install "ansible==${versionAnsible}"; \
    pip3 install ansible[azure]; \
    pip3 install ansible-lint
