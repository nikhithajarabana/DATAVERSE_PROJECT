create user nikhitha identified by N1DmddDatabase;
create user sahithi identified by S1DmddDatabase;
create user rithvik identified by R1DmddDatabase;
create user anouksha identified by A1DmddDatabase;

grant connect, resource to nikhitha;
grant connect, resource to sahithi;
grant connect, resource to rithvik;
grant connect, resource to anouksha;

grant unlimited tablespace to nikhitha;
grant unlimited tablespace to sahithi;
grant unlimited tablespace to rithvik;
grant unlimited tablespace to anouksha;