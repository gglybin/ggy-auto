#!/bin/bash

export ACTION=${1}
export ORACLE_SID=${2}
export ORACLE_HOME=${3}
export LSNR_NAME=${4}

#################
start() {

${ORACLE_HOME}/bin/sqlplus / as sysdba <<EOF
whenever sqlerror exit sql.sqlcode;
startup;
host ${ORACLE_HOME}/bin/lsnrctl start ${LSNR_NAME}
exit;
EOF
}

#################
stop() {

${ORACLE_HOME}/bin/sqlplus / as sysdba <<EOF
alter system checkpoint;
host ${ORACLE_HOME}/bin/lsnrctl stop ${LSNR_NAME}
shutdown immediate;
exit;
EOF
}

####################
restart() {

${ORACLE_HOME}/bin/sqlplus / as sysdba <<EOF
alter system checkpoint;
host ${ORACLE_HOME}/bin/lsnrctl stop ${LSNR_NAME}
shutdown immediate;
host sleep 5
startup;
host ${ORACLE_HOME}/bin/lsnrctl start ${LSNR_NAME}
exit;
EOF
}

########## Main ##########

case ${1} in
    'start')
        start && exit 0
        ;;
    'stop')
        stop && exit 0
        ;;
    'restart')
        restart && exit 0
        ;;
esac
