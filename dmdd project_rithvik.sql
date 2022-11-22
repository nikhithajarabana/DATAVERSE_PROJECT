BEGIN
        EXECUTE IMMEDIATE 'drop view product_category';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view total_productstock_quantity';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view customer_order_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view supplier_product_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/

BEGIN
        EXECUTE IMMEDIATE 'drop view supplier_store_details';
    EXCEPTION
        WHEN OTHERS THEN
            if sqlcode != -942 THEN
                RAISE;
            END IF;
    END;
/