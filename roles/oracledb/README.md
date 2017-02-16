Role oracledb
=============
[![oracledb_logo](https://raw.githubusercontent.com/ServiceStack/Assets/master/img/livedemos/techstacks/oracle-logo.png)](https://www.oracle.com/es/database/index.html)

This role install and configure Oracle Database 12c Standalone and manages the creation of tablespaces and schemas. It supports Standard and Enterprise Edition.

Requirements
------------

A Linux machine with more than 1G of memory, 8G of free space in system VG for Oracle engine, and at least a 10G disk for data filesystems. 

Role Variables
--------------

Variables used for DB creation:

 - oracle_sid: SID of database (e.g. 'TEST')
 - oracle_pass: Database passwords (e.g. 'temporal')
 - oracle_charset: Character set for database (e.g. 'AL32UTF8')
 - oracle_memory: Percentage of memory used for datase (e.g. '40')
 - oracle_data_path: Path for storing datafiles (e.g. '/oracledata')
 - oracle_data_size: Size for data filesystem (e.g. '10g')
 - oracle_fra_path: Path for Fast Recovery Area (e.g. '/oraclefra')
 - oracle_fra_size: Size for fra filesystem (e.g '2g')
 - oracle_lsn_port: Listening port (e.g '1521')
 - oracle_tbs_list: List of tablespace to be created (e.g. - { tbs_name: 'PRUEBA', tbs_size: '100M', tbs_file: PRUEBA01.dbf })
 - oracle_schema_list: List of users to be created (e.g. - { schema_name: 'SCH1', schema_pass: 'temporal' }
 - oracle_monitor: Configure user and permissions needed for monitoring database with argos (e.g. yes)

Variables for installation:

 - oracle_install_folder: Temporary directory used for installation files (e.g. '/softoracle')
 - oracle_base: Base directory for installation (e.g. '/oracleeng')
 - oracle_edition: Database Edition. EE = Enterprise | SE = Standard (e.g. 'SE')
 - oracle_installer_remote_path: Remote location of installer files (e.g. 'http://10.228.186.13/repo/Oracle/Database/12c') must be inserted
 - oracle_install_version: Oracle version installed (e.g '12.1.0')
 - oracle_dbhome_name: Name for home folder (e.g. 'dbhome_1')
 - oracle_inventory: Inventory path (e.g. '{{ oracle_base }}/oraInventory')
 - oracle_dba_group: dba group (e.g. dba)
 - oracle_user: System user for oracle (e.g. oracle)
 - oracle_user_pass: Crypted system user password (e.g. '$6$naNDtL//$ugkz7...')
 - oracle_group: Oracle install group (e.g. oinstall)
 - oracle_groups: List of extra groups for system user (e.g. - dba)
 - oracle_eng_path: Path for Oracle engine (e.g. '/oracleeng')
 - oracle_eng_size: Size for Oracle engine filesystem (e.g. '8g')
 - oracle_datavg: Name of VG to store data filesystems (e.g. datosvg)
 - oracle_systemvg: Name of VG to store engine filesystem (e.g. rootvg)
 - oracle_disks: List of disks to create data VG (e.g. '/dev/xvdb')


Example Playbook
----------------

```
 oracle_sid: 'TEST'
 oracle_pass: 'temporal'
 oracle_charset: 'AL32UTF8'
 oracle_data_path: '/oracledata'
 oracle_data_size: '10g'
 oracle_lsn_port: '1521'

 oracle_tbs_list:
  - { tbs_name: 'TABLESPACE1', tbs_size: '1G' }
  - { tbs_name: 'TABLESPACE2', tbs_size: '100M' }

 oracle_schema_list:
  - { schema_name: 'SCHEMA1', schema_pass: 'temporal', schema_tbs: 'TABLESPACE1' }
  - { schema_name: 'SCHEMA2', schema_pass: 'temporal2', schema_tbs: 'TABLESPACE2' }

```
Author Information
------------------

IT_AUTOMATION

