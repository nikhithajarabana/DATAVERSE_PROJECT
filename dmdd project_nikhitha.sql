BEGIN
        EXECUTE IMMEDIATE 'drop sequence product_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence store_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence supplier_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence category_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence stock_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence customer_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence order_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence orderlist_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop sequence delivery_id';
    EXCEPTION
        WHEN OTHERS THEN
            IF sqlcode = -942 THEN
                RAISE;
            END IF;
    END;
/