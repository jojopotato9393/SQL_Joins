/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select products.name, categories.name
from products
inner join categories
on products.CategoryID= categories.CategoryID
where categories.name like 'computers';



/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.name, products.Price, reviews.Rating
 from products
 join reviews
 on products.ProductID = reviews.ProductID
where reviews.Rating =5;
 
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.EmployeeID, sum(sales.Quantity) as 'total'
from employees
join sales 
on employees.EmployeeID = sales.EmployeeID
group by sales.EmployeeID
order by total desc;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.name, categories.name
from departments
inner join categories
on departments.DepartmentID = categories.DepartmentID
where categories.name like 'appliances' or categories.name like 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select products.name,
 Sum(sales.Quantity),
 Sum(sales.Quantity * sales.PricePerUnit)
 from products
inner join sales 
 on products.ProductID = sales.ProductID
 where products.Name like '%Hotel%California%'
 group by products.name;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.Reviewer, reviews.Rating, reviews.comment
from products 
inner join reviews
on products.ProductID= reviews.ProductID 
where products.name like '%visio%' AND reviews.rating = (SELECT MIN(rating) from reviews);
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select employees.employeeID, employees.firstname, employees.lastname, products.name, sum(sales.quantity)
from employees
inner join sales
on employees.EmployeeID=sales.EmployeeID
inner join products
on sales.ProductID = products.ProductID
group by employees.EmployeeID, products.ProductID
order by employees.EmployeeID;

select * from R
