commit;

alter session set "_ORACLE_SCRIPT"=true;
BEGIN
       EXECUTE IMMEDIATE 'DROP ROLE Supplier';
    EXCEPTION
       WHEN OTHERS THEN
          IF SQLCODE = -942 THEN
             RAISE;
          END IF;
    END;
/

BEGIN
       EXECUTE IMMEDIATE 'DROP ROLE Customer';
    EXCEPTION
       WHEN OTHERS THEN
          IF SQLCODE = -942 THEN
             RAISE;
          END IF;
    END;
/

BEGIN
       EXECUTE IMMEDIATE 'DROP ROLE Manager';
    EXCEPTION
       WHEN OTHERS THEN
          IF SQLCODE = -942 THEN
             RAISE;
          END IF;
    END;
/

commit;
