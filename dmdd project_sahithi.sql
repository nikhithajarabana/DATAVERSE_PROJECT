begin
        EXECUTE IMMEDIATE 'drop table orderlist';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table supplier';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table orders';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table delievery';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table customer';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table product_stock';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table product';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table store';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/

begin
        EXECUTE IMMEDIATE 'drop table admin';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode != -942 THEN
                RAISE;
            end if;
    end;
/