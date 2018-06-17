FROM centos:7

RUN         mkdir -p ~/.pip ; \
            echo "[global]" >~/.pip/pip.conf ; \
            echo "trusted-host=pypi.douban.com" >>~/.pip/pip.conf ; \
            echo "index-url=https://pypi.douban.com/simple/" >>~/.pip/pip.conf ; \
            ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ; \
            curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - ; \
            curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo  ; \
            yum install epel-release -y ; \
            yum install -y python-pip gcc gcc-c++ make python-devel wget openssh-server git vim; \
            pip install -U pip ; \
            pip install -U wheel setuptools ; \
            pip install -U pyyaml ; \
            yum -y install nodejs ; \
            yum -y install yarn  ; \
            wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz ; \
            tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz ; \
            rm -f go1.10.3.linux-amd64.tar.gz: \
            yum clean all ; \
            rm -rf ~/.cache

ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH