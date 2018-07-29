FROM centos:7
MAINTAINER Curtis John <cujo0224@gmail.com>
ENV LANG="en_US.UTF-8" s6_overlay_version="1.17.1.2" APP_NAME="subsonic" IMG_NAME="subsonicplus" TAG_NAME="latest" S6_LOGGING="0"

RUN yum -y update \
  && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
  && yum -y install flac \
    lame \
    sox \
    java \
  && curl -skL https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-amd64.tar.gz -o /tmp/s6-overlay-amd64.tar.gz \
  && tar xf /tmp/s6-overlay-amd64.tar.gz -C / \
  && echo $(curl -skL https://sourceforge.net/projects/subsonic/rss | grep link| grep download | grep tar.gz | sed -n s%"\s\+<link>\([^<]*\).*"%"\1"%p | head -1 | awk -F/ '{print $8}') > /subsonic.version \
  && curl -skL $(curl -skL https://sourceforge.net/projects/subsonic/rss | grep link | grep download | grep tar.gz | sed -n s%"\s\+<link>\([^<]*\).*"%"\1"%p | head -1 | sed s%/download$%%) -o /tmp/subsonic.tar.gz \
  && mkdir -p /opt/subsonic \
  && tar xf /tmp/subsonic.tar.gz -C /opt/subsonic \
  && rpm -e --nodeps --allmatches --noscripts \
	`rpm -qa | grep aaa_base` \
	`rpm -qa | grep acl | grep -v lib` \
	`rpm -qa | grep cpio` \
	`rpm -qa | grep cryptsetup` \
	`rpm -qa | grep dracut` \
	`rpm -qa | grep fipscheck` \
	`rpm -qa | grep kbd` \
	`rpm -qa | grep kmod` \
	`rpm -qa | grep mapper` \
	`rpm -qa | grep ncurses-utils` \
	`rpm -qa | grep perl` \
	`rpm -qa | grep pigz` \
	`rpm -qa | grep pinentry` \
	`rpm -qa | grep pkg-config` \
	`rpm -qa | grep qrencode` \
	`rpm -qa | grep sg3_utils` \
  && localectl set-locale LANG=en_US.utf8 \
  && yum clean all \
  && rm -rf /usr/share/{man,doc,info,gnome*} \
  && rm -rf /var/cache/yum* \
  && rm -rf /tmp/* \
  && rm -rf /var/log/*

COPY root /
ENTRYPOINT ["/init"]
