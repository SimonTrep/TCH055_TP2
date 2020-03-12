--Section 1
-- Requete 1.1 Fonctionne
SELECT
    "A1"."COUNTRY_NAME" "COUNTRY_NAME"
FROM
    "EQUIPE113"."COUNTRIES" "A1";
    
--Requete 1.2 Fonctionne
SELECT
    "A1"."PRODUCT_ID" "PRODUCT_ID"
FROM
    "EQUIPE113"."PRODUCTS" "A1"
WHERE
    "A1"."LIST_PRICE" >= 1.4 * "A1"."STANDARD_COST";
    
--requete 1.3 Fonctionne
SELECT
    "A1"."NAME" "NAME"
FROM
    "EQUIPE113"."CUSTOMERS" "A1"
WHERE
    "A1"."CREDIT_LIMIT" > 150
    AND
   "A1"."ADDRESS" LIKE '%IN';

--requete 1.4 Fonctionne
SELECT
    CONCAT(CONCAT("A1"."FIRST_NAME",' '),"A1"."LAST_NAME") AS "Nom Complet"
FROM
    "EQUIPE113"."CONTACTS" "A1"
WHERE
    "A1"."PHONE" LIKE '+49%';

--requete 1.5 A CORRIGER LE SELECT RIGHT LE RESTE FONCTIONNE CORRECTEMENT
SELECT
      DISTINCT RIGHT("A1".ADDRESS, 2) AS "ETAT"
FROM
    "EQUIPE113"."CUSTOMERS" "A1"
WHERE
     "A1"."ADDRESS" LIKE '%, __';
     
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
and orders.order_date<=employees.hire_date+300
and orders.order_date>=employees.hire_date;

-- requete 2.4 FONCTIONNE
SELECT SUM(quantity)
from order_items
inner join orders
on order_items.order_id=orders.order_id
where orders.order_date>='20170101'
and orders.order_date<='20171231';

--requete 2.5 FONCTIONNE (Aucun employé enagé après 2016 dans la BD)
SELECT 
CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(last_name,','),first_name),' id:'),employee_id),' Engagé le:'),hire_date) AS "INFO EMPLOYÉS"
FROM employees
WHERE hire_date>='20170101';







