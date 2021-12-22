# Pull base image
FROM rockylinux/rockylinux:8

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-rockylinux8

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
  && yum -y clean all

ADD install_gcctoolset11.sh /script/
RUN /script/install_gcctoolset11.sh
SHELL [ "scl", "enable", "gcc-toolset-11" ]

ADD install_cmake3221.sh /script/
RUN /script/install_cmake3221.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost178.sh /script/
RUN /script/install_boost178.sh
ENV Boost_DIR /usr/local/boost_1_78_0

ADD install_cryptopp860.sh /script/
RUN /script/install_cryptopp860.sh

ADD install_googletest1110.sh /script/
RUN /script/install_googletest1110.sh

ADD install_python.sh /script/
RUN /script/install_python.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck26.sh /script/
RUN /script/install_cppcheck26.sh

ADD install_zsh58.sh /script/
RUN /script/install_zsh58.sh

ADD install_ninja1102.sh /script/
RUN /script/install_ninja1102.sh

ADD install_ffmpeg441.sh /script/
RUN /script/install_ffmpeg441.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "gcc-toolset-11", "zsh"]
