pkg_name=libcircmetrics
pkg_description="A C library for tracking metrics"
pkg_origin=smartb
pkg_version="master"
pkg_maintainer="smartB Engineering <dev@smartb.eu>"
pkg_license=('BSD 3')
pkg_source="https://github.com/circonus-labs/${pkg_name}"
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_build_deps=(
  core/autoconf
  core/gcc
  core/make
  smartb/libcircllhist/master
  smartb/ck
  core/glibc
)

do_verify() {
  return 0
}

do_download()
{
  return 0
}

do_clean()
{
    return 0
}

do_unpack()
{
    return 0
}

do_build()
{
  export LDFLAGS="-Wl,-rpath,$(pkg_path_for core/glibc)/lib $LDFLAGS"
  cd /src
  autoconf
  ./configure --prefix=${pkg_prefix}
  make
  return $?
}

do_install() {
  cd /src
  make install
  return $?
}
