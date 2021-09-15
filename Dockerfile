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

ADD install_gcctoolset10.sh /script/
RUN /script/install_gcctoolset10.sh
SHELL [ "scl", "enable", "gcc-toolset-10" ]

ADD install_cmake3212.sh /script/
RUN /script/install_cmake3212.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost177.sh /script/
RUN /script/install_boost177.sh
ENV Boost_DIR /usr/local/boost_1_77_0

ADD install_cryptopp850.sh /script/
RUN /script/install_cryptopp850.sh

ADD install_googletest1110.sh /script/
RUN /script/install_googletest1110.sh

ADD install_python.sh /script/
RUN /script/install_python.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck25.sh /script/
RUN /script/install_cppcheck25.sh

ADD install_zsh58.sh /script/
RUN /script/install_zsh58.sh

ADD install_ninja1102.sh /script/
RUN /script/install_ninja1102.sh

ADD install_ffmpeg44.sh /script/
RUN /script/install_ffmpeg44.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "gcc-toolset-10", "zsh"]
