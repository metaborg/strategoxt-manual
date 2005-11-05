AC_PREREQ(2.58)
AC_INIT([strategoxt-manual],[0.16],[stratego-bugs@cs.uu.nl])
AM_INIT_AUTOMAKE

test "x$prefix" = xNONE && prefix=$ac_default_prefix

# XT_PRE_RELEASE
XT_USE_JRE
XT_USE_BATIK
USE_DOCBOOK

AC_PROG_INSTALL

AC_CONFIG_FILES([
  Makefile
  src/Makefile
  doc/Makefile
  svg/Makefile
  html/Makefile
  pdf/Makefile
  man/Makefile
])
AC_OUTPUT
