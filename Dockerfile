FROM centos:7

RUN         mkdir -p ~/.pip ; \
            echo "[global]" >~/.pip/pip.conf ; \
            echo "trusted-host=pypi.douban.com" >>~/.pip/pip.conf ; \
            echo "index-url=https://pypi.douban.com/simple/" >>~/.pip/pip.conf ; \
            ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ; \
            curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - ; \
            curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo  ; \
            yum install epel-release -y ; \
            yum install -y python-pip gcc gcc-c++ make python-devel wget openssh openssh-server bzip2 git vim nodejs yarn; \
            pip install -U pip ; \
            pip install -U wheel setuptools ; \
            pip install -U pyyaml ; \
            wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz ; \
            tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz ; \
            rm -f go1.10.3.linux-amd64.tar.gz: \
            yum clean all ; \
            rm -rf ~/.cache ; \
            ssh-keygen -q -t rsa1 -f /etc/ssh/ssh_host_key -C '' -N ''; \
            chgrp ssh_keys /etc/ssh/ssh_host_key; \
            chmod 640 /etc/ssh/ssh_host_key; \
            chmod 644 /etc/ssh/ssh_host_key.pub; \
            ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''; \
            chgrp ssh_keys /etc/ssh/ssh_host_rsa_key; \
            chmod 640 /etc/ssh/ssh_host_rsa_key; \
            chmod 644 /etc/ssh/ssh_host_rsa_key.pub; \
            ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -C '' -N ''; \
            chgrp ssh_keys /etc/ssh/ssh_host_ecdsa_key; \
            chmod 640 /etc/ssh/ssh_host_ecdsa_key; \
            chmod 644 /etc/ssh/ssh_host_ecdsa_key.pub; \
            ssh-keygen -q -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -C '' -N ''; \
            chgrp ssh_keys /etc/ssh/ssh_host_ed25519_key; \
            chmod 640 /etc/ssh/ssh_host_ed25519_key; \
            chmod 644 /etc/ssh/ssh_host_ed25519_key.pub; \
            echo -e "123456\n123456" |passwd

VOLUME ["/root"]
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH
WORKDIR /root

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]