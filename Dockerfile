FROM rhel7-init
RUN yum -y install httpd traceroute
RUN yum clean all; systemctl enable httpd
RUN echo "Hello World!" > /var/www/html/index.html
RUN echo "redhat" | passwd --stdin root
STOPSIGNAL SIGRTMIN+3
EXPOSE 80
CMD ["/usr/sbin/init"]
