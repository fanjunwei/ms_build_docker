FROM centos:7

RUN          mkdir ~/.pip && \
             echo "[global]" >~/.pip/pip.conf && \
             echo "trusted-host=mirrors.aliyun.com" >>~/.pip/pip.conf && \
             echo "index-url=https://mirrors.aliyun.com/pypi/simple/" >>~/.pip/pip.conf && \
             ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
             yum install epel-release -y &&  \
             yum install -y python-pip gcc gcc-c++ make python-devel && \
             yum clean all && \
             pip install -U pip&& \
             pip install -U wheel setuptools
