# Pull base image
FROM nvidia/cuda:13.2.1-devel-rockylinux8

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-rockylinux8

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Install EPEL repo + enable PowerTools (permanent)
RUN dnf install -y epel-release dnf-plugins-core \
 && dnf config-manager --set-enabled powertools \
 && dnf -y clean all

# Install
RUN dnf install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl3 \
  openssl3-devel \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  gdb-gdbserver \
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
  libunwind-devel \
  libwebp-devel \
  protobuf-compiler \
  patch \
  && dnf -y clean all

ADD install_gcctoolset15.sh /script/
RUN /script/install_gcctoolset15.sh
ENV BUILD_TOOLSET_ENABLE=/opt/rh/gcc-toolset-15/enable

ADD install_cmake443.sh /script/
RUN /script/install_cmake443.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost192.sh /script/
RUN /script/install_boost192.sh
ENV Boost_DIR /usr/local/boost_1_92_0

ADD install_cryptopp890.sh /script/
RUN /script/install_cryptopp890.sh

ADD install_googletest1180.sh /script/
RUN /script/install_googletest1180.sh

ADD install_python.sh /script/
RUN /script/install_python.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck2210.sh /script/
RUN /script/install_cppcheck2210.sh

ADD install_zsh.sh /script/
RUN /script/install_zsh.sh

ADD install_ninja1132.sh /script/
RUN /script/install_ninja1132.sh

ADD install_srt157.sh /script/
RUN /script/install_srt157.sh

ADD install_ffmpeg901.sh /script/
RUN /script/install_ffmpeg901.sh

ADD install_golang1271.sh /script/
RUN /script/install_golang1271.sh

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
CMD ["scl", "enable", "gcc-toolset-15", "zsh"]
