AC_PREREQ(2.58)
AC_INIT([strategoxt-manual],[0.17],[stratego-bugs@cs.uu.nl])
AM_INIT_AUTOMAKE

test "x$prefix" = xNONE && prefix=$ac_default_prefix

# if VERSION_SUFFIX not is set then it's a pre release
if ! test -n "${VERSION_SUFFIX+X}"; then
  XT_PRE_RELEASE
else
  # if VERSION_SUFFIX is set and not "" then it's a pre release
  if test -n "${VERSION_SUFFIX}"; then
    XT_PRE_RELEASE
  fi
fi

XT_USE_JRE
XT_USE_BATIK
USE_DOCBOOK

AC_PROG_INSTALL

AC_CONFIG_FILES([
  Makefile
  prepare-manual.sh
  src/Makefile
  doc/Makefile
  svg/Makefile
  html/Makefile
  html/chunk-chapter/Makefile
  html/chunk-part/Makefile
  html/chunk-book/Makefile
  html/one-page/Makefile
  pdf/Makefile
  man/Makefile
])
AC_OUTPUT
