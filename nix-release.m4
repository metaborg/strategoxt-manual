#     							-*- Autoconf -*-
# serial 3
#
# Author: Eelco Visser <visser@cs.uu.nl>
#
# This Autoconf macro file provides parameters for a package that is built
# with the XT bundle of program transformation tools.
# The macros are organized hierarchically such that packages that are included
# in a larger bundle do not need to be provided explicitly.

# XT_ left in configure is the sign a macro was not defined, or there was a typo
# in a macro invocation.
m4_pattern_forbid([^XT_])

############ SVN REVISION ########################################################

AC_DEFUN([XT_SVN_REVISION],
[
AC_MSG_CHECKING([for the SVN revision of the source tree])

if test -e ".svn"; then
   REVFIELD="1"
   SVN_REVISION=`svn status -v -N -q ./ | awk "{ if(\\\$NF == \".\") print \\\$$REVFIELD }"`
   AC_MSG_RESULT($SVN_REVISION)
else
  if test -e "svn-revision"; then
    SVN_REVISION="`cat svn-revision`"
    AC_MSG_RESULT($SVN_REVISION)
  else
    SVN_REVISION="0"
    AC_MSG_RESULT([not available, defaulting to 0])
  fi
fi
AC_SUBST([SVN_REVISION])

])

############ Extended version numbers #############################################
AC_DEFUN([XT_PRE_RELEASE],
[
  AC_REQUIRE([XT_SVN_REVISION])
  VERSION="${VERSION}pre${SVN_REVISION}"
  PACKAGE_VERSION="${PACKAGE_VERSION}pre${SVN_REVISION}"
])
