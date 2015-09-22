FROM centos:7
MAINTAINER lyon "ll_nwpu@163.com"
# install packages
RUN set -x \
    && yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm \
    && yum install -y http://rdo.fedorapeople.org/openstack-kilo/rdo-release-kilo.rpm \
    && yum install -y openstack-selinux \
    && yum install -y openstack-keystone httpd mod_wsgi python-openstackclient memcached python-memcached

VOLUME /etc/keystone
EXPOSE 5000 35357
# copy sql script
COPY keystone.sql /root/keystone.sql

# add bootstrap script and make it executable
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh && chmod a+x /etc/bootstrap.sh
ENTRYPOINT ["/etc/bootstrap.sh"]
