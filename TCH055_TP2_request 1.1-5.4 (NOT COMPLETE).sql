--Section 1
-- Requete 1.1 Fonctionne
SELECT
    COUNTRY_NAME
FROM
    COUNTRIES;
    
--Requete 1.2 Fonctionne
SELECT
    PRODUCT_ID
FROM
    PRODUCTS
WHERE
    LIST_PRICE >= 1.4 * STANDARD_COST;
    
--requete 1.3 Fonctionne
SELECT
    NAME
FROM
    CUSTOMERS
WHERE
    CREDIT_LIMIT > 150
AND
   ADDRESS LIKE '%IN';

--requete 1.4 Fonctionne
SELECT
    FIRST_NAME || ' ' || LAST_NAME AS "Nom Complet"
FROM
    CONTACTS
WHERE
    PHONE LIKE '+49%';

--requete 1.5 FONCTIONNE
SELECT
    DISTINCT SUBSTR(address, -2, 2)
FROM
    CUSTOMERS
WHERE
    ADDRESS LIKE '%, __';
     
--Bloc 2
--requete 2.1 FONCTIONNE
SELECT product_name
FROM products
inner join product_categories
on products.category_id = product_categories.category_id
WHERE category_name='Mother Board';

--requete 2.2 FONCTIONNE
SELECT warehouse_name
FROM warehouses
inner join locations
on warehouses.location_id = locations.location_id
inner join countries
on locations.country_id = countries.country_id
inner join regions
on countries.region_id = regions.region_id
WHERE region_name='Asia';

-- requete 2.3 FONCTIONNE
SELECT distinct employee_id
FROM employees
inner join orders
on employees.employee_id=orders.salesman_id
where orders.status='Shipped'
and orders.order_date<=ADD_MONTHS(employees.hire_date,3)
and orders.order_date>=employees.hire_date;

-- requete 2.4 FONCTIONNE
SELECT SUM(quantity)
from order_items
inner join orders
on order_items.order_id=orders.order_id
where orders.order_date>= DATE '2017-01-01'
and orders.order_date<= DATE '2017-12-31';

--requete 2.5 FONCTIONNE (Aucun employé enagé après 2016 dans la BD)
SELECT 
last_name || ',' || first_name || 'id: '|| employee_id || 'Engagé le: ' || hire_date AS "INFO EMPLOYÉS"
FROM employees
WHERE hire_date>= DATE '2016-01-01';

-- section 3 

--requete 3.1 FONCTIONNE

SELECT EMPLOYEE_ID
FROM EMPLOYEES
LEFT JOIN ORDERS ON EMPLOYEES.EMPLOYEE_ID = ORDERS.SALESMAN_ID
WHERE SALESMAN_ID IS NULL;


-- REQUETE 3.2 ne donne pas le bon résultat

SELECT DISTINCT REGION_NAME
FROM REGIONS
INNER JOIN COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID
INNER JOIN LOCATIONS ON COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID
left JOIN WAREHOUSES ON LOCATIONS.LOCATION_ID = WAREHOUSES.LOCATION_ID
WHERE LOCATIONS.LOCATION_ID NOT IN (SELECT LOCATION_ID FROM WAREHOUSES) ;



--REQUETE 3.3 FONCTIONNE

SELECT CUSTOMERS.CUSTOMER_ID, NAME, ADDRESS
FROM CUSTOMERS 
LEFT JOIN ORDERS ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
WHERE CUSTOMERS.CUSTOMER_ID NOT IN (SELECT CUSTOMER_ID FROM ORDERS);


--REQUETE 3.4 FONCTIONNE

SELECT address FROM customers
UNION
SELECT address || state || ' ' || postal_code AS NEW_ADDRESS
FROM locations
ORDER BY address;


--REQUETE 3.5 FONCTIONNE

SELECT NAME, 'CUSTOMERS' AS TYPE_PERS
FROM CUSTOMERS
UNION ALL
SELECT first_name || last_name AS EMPLOYEE_NAME, 'EMPLOYEES' AS TYPE_PERS
FROM EMPLOYEES
ORDER BY NAME;

--Section 4

-- requete 4.1 FONCTIONNE   
SELECT COUNT(product_name)
FROM products
WHERE product_name LIKE '%i7%';

--requete 4.2 fonctionne pas
SELECT DISTINCT phone
FROM contacts
WHERE phone LIKE '%%%_________';

--requete 4.3 FONCTIONNE
SELECT  regions.region_name, COUNT(DISTINCT country_name)
from countries
inner join regions on regions.region_id=countries.region_id
group by regions.region_name;

--requete 4.4 FONCTIONNE
SELECT product_id, product_name, list_price
FROM products
WHERE list_price >= (SELECT AVG(list_price) FROM products);

--requete 4.5 NE FONCTIONNE PAS
SELECT distinct employee_id
FROM employees
inner join orders
on employees.employee_id=orders.salesman_id
INNER join order_items 
on orders.order_id=order_items.order_id
where 
;

--Section 5

--requete 5.1 FONCTIONNE
SELECT distinct last_name || ','  || first_name  AS "Nom complet"
FROM employees
WHERE employee_id IN (select distinct manager_id
                      from employees);
                      
--requete 5.2
SELECT EMPLOYEE_ID
FROM EMPLOYEES
WHERE 
;

--REQUETE 5.3



--REQUETE 5.4 À COMPLÉTER
SELECT count(CATEGORY_ID) as nb
, CATEGORY_ID
, WAREHOUSE_ID
FROM ORDER_ITEMS
INNER JOIN PRODUCTS P on ORDER_ITEMS.PRODUCT_ID = P.PRODUCT_ID
INNER JOIN INVENTORIES I on P.PRODUCT_ID = I.PRODUCT_ID
GROUP BY CATEGORY_ID, WAREHOUSE_ID
order by count(CATEGORY_ID) desc;
