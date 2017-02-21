SELECT S.USERNAME, S.SID,S.SERIAL#, S.STATUS, L.TYPE, O.OBJECT_ID,
       DECODE(L.LMODE,
              0,'',
              1,'Null',
              2,'Row-S (RS)',
              3,'Row-X (RX)',
              4,'Share (S)',
              5,'S/Row-X (SRX)',
              6,'Exclusive (X)') LMODE,
       DECODE(L.REQUEST,
              0,'',
              1,'Null',
              2,'Row-S (RS)',
              3,'Row-X (RX)',
              4,'Share (S)',
              5,'S/Row-X (SRX)',
              6,'Exclusive (X)') LREQUEST,
              P.SPID PID, a.object_name, o.session_id
  FROM v$lock l,
       v$session s,
       v$process p,
       v$locked_object o,
       DBA_OBJECTS a
 WHERE s.sid = l.sid
   AND p.addr = s.paddr
   AND s.username is not null
   AND s.sid = o.session_id
   AND a.object_id  = o.object_id
   AND TRIM(L.REQUEST) > 0
--   AND L.ID1 IN ('458809','65570')
 ORDER BY O.OBJECT_ID,L.request desc, L.id1, s.username, s.sid, request
/
