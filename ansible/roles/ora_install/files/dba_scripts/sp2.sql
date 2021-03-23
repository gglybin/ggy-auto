set lines 400 pages 1000;
set linesize 120
set head off

select
'================= Connection Info  ======================',
'LOGON_TIME .............................................: '||to_char(s.logon_time, 'DD-MON-YY HH24:MI'),
'SID, SERIAL# ...........................................: '||s.sid||','||s.serial#,
'OS PID .................................................: '||p.spid Server,
'USERNAME ...............................................: '||s.username,
'SCHEMA_NAME ............................................: '||s.schemaname,
'DATABASE_NAME ..........................................: '||(select name from v$database),
'DATABASE_ROLE ..........................................: '||(select database_role from v$database),
'OPEN_MODE ..............................................: '||(select open_mode from v$database),
'INSTANCE_NAME ..........................................: '||(select instance_name from v$instance),
'INSTANCE_ID ............................................: '||s.inst_id,
'INSTANCE_STATUS ........................................: '||(select status from v$instance),
'VERSION ................................................: '||(select version from v$instance),
'PROGRAM ................................................: '||nvl(s.program,'-'),
'MODULE .................................................: '||nvl(s.module,'-'),
'ACTION .................................................: '||nvl(s.action,'-'),
'TERMINAL ...............................................: '||nvl(s.terminal,'-'),
'CLIENT_MACHINE .........................................: '||nvl(s.machine,'-'),
'CLIENT_IP_ADDRESS ......................................: '||nvl(to_char((select sys_context('USERENV', 'IP_ADDRESS') from dual)),'-')
from  gv$session s,
      gv$process p
where p.addr = s.paddr
and   s.audsid = sys_context('USERENV', 'SESSIONID')
and   s.sid = sys_context('USERENV', 'SID')
and   s.inst_id = userenv('INSTANCE');

set head on;
