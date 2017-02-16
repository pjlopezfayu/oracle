set head off
set feedback off
set pagesize 0
spool main.yml
select '---'||chr(13)||chr(10)||'  addvlan:'||chr(13)||chr(10) from dual;

select '   - vlan: ABQ_'||to_char(TAG)||'_'||rtrim(nombre)
           ||chr(13)||chr(10)||'     address: '||substr(ltrim(dir),1,instr(dir,'/',1)-1)
           ||chr(13)||chr(10)||'     mask: '||substr(dir,instr(dir,'/',1)+1,2)
           ||chr(13)||chr(10)||'     gateway: '||substr(dir,1,instr(dir,'.',1,3))||to_char(to_number(substr(dir,instr(dir,'.',1,3)+1,instr(dir,'/',1)-instr(dir,'.',1,3)-1))+1)
           ||chr(13)||chr(10)||'     num_ips: '||to_char(num_ips)
           ||chr(13)||chr(10)||'     first_ip: '||substr(dir,1,instr(dir,'.',1,3))||to_char(to_number(substr(dir,instr(dir,'.',1,3)+1,instr(dir,'/',1)-instr(dir,'.',1,3)-1))+2)
           ||chr(13)||chr(10)||'     tag: '||tag
--dir,
--substr(dir,instr(dir,'.',1,3)+1,instr(dir,'/',1)-instr(dir,'.',1,3)-1),
--length(dir)-length(replace(dir,'.',''))
--to_number(substr(dir,instr(dir,'/',1)+1,2))+1,
--substr(dir,instr(dir,'/',1)),
--instr(dir,'.',1,3),
--substr(dir,1,instr(dir,'.',1,3))||to_char(to_number(substr(dir,instr(dir,'.',1,3)+1,instr(dir,'/',1)-instr(dir,'.',1,3)-1))+1),
from vlan2 a, vlan_ips b
where dir is not null
 and b.mask = to_number(substr(dir,instr(dir,'/',1)+1,2))
 and length(dir)-length(replace(dir,'.','')) = 3
 and tag > 1201
-- and tag between 1201 and 1600
order by to_number(tag)
/
spool off
set head on
set feedback on
set pagesize 66
