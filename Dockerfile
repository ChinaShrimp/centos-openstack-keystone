FROM centos:7
MAINTAINER lyon "ll_nwpu@163.com"
# install packages
RUN set -x \
    && yum install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm \
    && yum install http://rdo.fedorapeople.org/openstack-kilo/rdo-release-kilo.rpm \
    && yum install openstack-selinux \
    && yum install openstack-keystone httpd mod_wsgi python-openstackclient memcached python-memcached
