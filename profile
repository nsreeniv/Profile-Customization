#!/bin/sh
#
#
#  Production Path:
#  ----------------
#  $ProdPath: /etc/skel/.profile $
#
#  RCS Header:
#  -----------
#  $Header: /bb/source/admin/SRC/etc/.profile.skel,v 1.2 2005/09/28 18:01:38 ppriest Exp $
#
#  RCS Log:
#  --------
#  $Log: .profile.skel,v $
#  Revision 1.2  2005/09/28 18:01:38  ppriest
#  checked all the messed up PATH stuff to actaully make some sense.
#
#  Revision 1.1  1999/01/22 16:54:16  timb
#  Initial revision
#
#   __________________________________________
#  /                                          \
# {          Carefully set up PATH             }
#  \__________________________________________/
#

PATH=/bb/bin/override:$PATH

export PATH

if [ -d /usr/bin/X11 ]                  # If X11 is installed,
then                                    # include the binaries
    PATH=$PATH:/usr/bin/X11             # in PATH
fi

if [ -d /usr/dt/bin ]
then
    PATH=$PATH:/usr/dt/bin
fi

if [ -d /usr/openwin/bin ]
then
    PATH=$PATH:/usr/openwin/bin
fi

if [ -d /local/bin ]                    # If /local/bin exists,
then                                    # include the binaries
    PATH=$PATH:/local/bin               # in PATH
fi

if [ -d /usr/local/bin ]                # If /usr/local/bin exists,
then                                    # include the binaries
    PATH=$PATH:/usr/local/bin           # in PATH
fi

if [ -d /bb/bin ]                       # Finally, include the
then                                    # Bloomberg directories
    PATH=$PATH:/bb/bin                  # in PATH
fi

if [ -d /bb/shared/bin ]                # Finally, include the
then                                    # Bloomberg directories
    PATH=$PATH:/bb/shared/bin           # in PATH
fi

if [ -d /bb/shared/abin ]               # Finally, include the
then                                    # Bloomberg directories
    PATH=$PATH:/bb/shared/abin          # in PATH
fi

PATH=${PATH}:${HOME}/bin		# Append your own path to the END!

export PATH

#   __________________________________________
#  /                                          \
# {        Any other ENVIRONMENT Vars          }
#  \__________________________________________/
#


if [ -z "${HOSTNAME}" ]
then
  HOSTNAME=`uuname -l`
fi
PS1="${HOSTNAME}:\${PWD} ! \$ "
EDITOR=vi
PAGER=more
MAIL=/usr/mail/${LOGNAME:?}
LPDEST=put_your_printer_here
GROUP=put_your_group_here
XAPPLRESDIR=${HOME}/app-defaults
ENV=$HOME/.kshrc
GROUP=news-group

export GROUP
export NEWSSVN
export CVSROOT
export PATH HOSTNAME EDITOR PAGER LPDEST PS1 GROUP XAPPLRESDIR ENV
#   __________________________________________
#  /                                          \
# {               Runtime Options              }
#  \__________________________________________/
#

stty erase \^\h kill \^u intr \^c	# workstations
stty echoe echok ixon ixoff -ixany

if [ "$0"x = "-ksh"x ]; then
  if [ -x /bin/bash ]; then
    SHELL=/bin/bash
    export SHELL
    exec /bin/bash
  fi
fi
