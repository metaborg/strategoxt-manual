# XT_USE_JRE
# --------------
AC_DEFUN([XT_USE_JRE], [
  AC_ARG_WITH([jre],
    AS_HELP_STRING([--jre=DIR],
                   [use JRE at DIR]),
    [JRE=$withval],
    [JRE="none"]
  )

  if test "$JRE" = "none"; then
    AC_PATH_PROG([JAVA],[java],[none])

    if test "$JAVA" = "none"; then
      AC_MSG_ERROR([java is required. Make sure it is on the path or specify a prefix --with-jdk])
    fi

    JRE="$(dirname $(dirname $JAVA))"
  else
    JAVA=$JRE/bin/java

    AC_MSG_CHECKING([for java at $JAVA])
    test -x "$JAVA"
    if test $? -eq 0; then
      AC_MSG_RESULT([yes])
    else
      AC_MSG_RESULT([no])
      AC_MSG_ERROR([cannot find java. Please check the path you specified --with-jdk.])
    fi
  fi

  AC_SUBST([JRE])
  AC_SUBST([JAVA])
])

# XT_USE_BATIK
# --------------
AC_DEFUN([XT_USE_BATIK], [
  AC_ARG_WITH(batik, 
    AC_HELP_STRING([--with-batik=DIR], [use Batik at DIR @<:@PREFIX@:>@]), 
    BATIK="$withval/batik", 
    AC_MSG_ERROR([Please specify the location of Batik.])
  )
  AC_SUBST([BATIK])
])
