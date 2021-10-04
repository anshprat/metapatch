FROM amazonlinux
ADD . /root
RUN yum install -y \
    rpmdevtools \
    rpmlint \
    createrepo && \
    mkdir /mnt/local_repo
WORKDIR /root
RUN /root/buildrpm.sh
