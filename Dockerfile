# Pull base image
FROM rockylinux/rockylinux:8

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-rockylinux8

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl \
  openssl-devel \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  valgrind \
  mariadb-devel \
  postgresql-server-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mariadb-connector-odbc \
  sysstat \
  psmisc \
  yum-utils \
  tbb-devel \
  gperftools-devel \
  iproute \
  net-tools \
  ccache \
  libunwind-devel \
  libwebp-devel \
  protobuf-compiler \
  patch \
  && yum -y clean all

ADD install_gcctoolset13.sh /script/
RUN /script/install_gcctoolset13.sh
SHELL [ "scl", "enable", "gcc-toolset-13" ]

ADD install_cmake3302.sh /script/
RUN /script/install_cmake3302.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost185.sh /script/
RUN /script/install_boost185.sh
ENV Boost_DIR /usr/local/boost_1_85_0

ADD install_cryptopp890.sh /script/
RUN /script/install_cryptopp890.sh

ADD install_googletest1152.sh /script/
RUN /script/install_googletest1152.sh

ADD install_python.sh /script/
RUN /script/install_python.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck2142.sh /script/
RUN /script/install_cppcheck2142.sh

ADD install_zsh59.sh /script/
RUN /script/install_zsh59.sh

ADD install_ninja1121.sh /script/
RUN /script/install_ninja1121.sh

ADD install_openssl3014.sh /script/
RUN /script/install_openssl3014.sh

ADD install_ffmpeg702.sh /script/
RUN /script/install_ffmpeg702.sh

ADD install_golang1230.sh /script/
RUN /script/install_golang1230.sh

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

ADD install_wrk420.sh /script/
RUN /script/install_wrk420.sh

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Define default command
CMD ["scl", "enable", "gcc-toolset-13", "zsh"]
