 /*#1*/
    SELECT b.name AS supplier_name,
	       c.name AS consumer_name,
		   d.name AS product_name,
		   a.Quantity,
		   a.price
      FROM Tb_Transactions a LEFT JOIN
           Tb_Supplier b ON a.supp_id=b.supp_id LEFT JOIN
	       Tb_Consumer c ON a.con_id=c.con_id LEFT JOIN
		   Tb_Product d ON a.prod_id=d.Prod_ID
     WHERE b.City='Madison' AND c.city='Stevens Point' AND a.price > 10.000

/*2.*/
    SELECT a.name AS supp_name,
	       a.supp_id
	  FROM Tb_Supplier a
	 WHERE a.supp_id IN (SELECT supp_id     
	                       FROM Tb_Offers
						  WHERE prod_id IN (SELECT prod_id         
						                      FROM Tb_Product
											 WHERE name='orange'
										   )
					    ) AND 
		   a.supp_id IN (SELECT supp_id     
	                       FROM Tb_Offers
						  WHERE prod_id IN (SELECT prod_id         
						                      FROM Tb_Product
											 WHERE name='computer'
										   )
					    ) 

/*3.*/
    SELECT /*supp_id,*/
	       name AS supp_name
	  FROM Tb_Supplier a
	 WHERE a.city='Wausau' OR
	       supp_id IN (SELECT supp_id    
		                 FROM Tb_Offers
						 WHERE prod_id IN (SELECT prod_id         
						                      FROM Tb_Product
											 WHERE name IN ('computer','oranges')
										   )
					    ) 
	ORDER BY a.name
	
/*4.*/
   SELECT a.name AS supp_name,
	       a.supp_id
	  FROM Tb_Supplier a
	 WHERE a.supp_id IN (SELECT supp_id     
	                       FROM Tb_Offers
						  WHERE prod_id IN (SELECT prod_id         
						                      FROM Tb_Product
											 WHERE name='orange'
										   )
					    ) AND 
		   a.supp_id IN (SELECT supp_id     
	                       FROM Tb_Offers
						  WHERE prod_id IN (SELECT prod_id         
						                      FROM Tb_Product
											 WHERE name='computer'
										   )
					    ) AND 
		   a.supp_id IN (SELECT supp_id     
	                       FROM Tb_Offers
						  WHERE prod_id IN (SELECT prod_id         
						                      FROM Tb_Product
											 WHERE name='auto'
										   )
					    ) 

/*5. come back to this one*/
  
    SELECT DISTINCT prod_id
	  FROM Tb_offers
	 WHERE supp_id NOT IN (SELECT supp_id  
	                         FROM Tb_Supplier
							 WHERE city='Chicago'
						  )  

/*6.*/
    SELECT DISTINCT  
	       name
	  FROM Tb_Consumer 
	 WHERE con_id IN (SELECT con_id
		                    from  Tb_Requests
						   where prod_id in (select prod_id 
						                       from Tb_Product
											   where name='computer'
											)
						 ) AND
		   con_id NOT IN (SELECT con_id
		                    from  Tb_Requests
						   where prod_id in (select prod_id 
						                       from Tb_Product
											   where name<>'computer'
											)
						 )
/*7.*/
    SELECT name 
	  FROM Tb_Product s
	 where not exists(SELECT *
	                    FROM Tb_Consumer p
					   WHERE NOT EXISTS (SELECT *
					                       FROM Tb_Requests
										  WHERE s.prod_id=Tb_Requests.prod_id AND con_id=p.con_id
										)
                      )

/*8. I DONT THINK THIS IS RIGHT*/

    SELECT name  
	  FROM Tb_Product
	 WHERE prod_id IN (SELECT prod_id
	                     FROM Tb_Transactions
						WHERE con_id NOT IN (SELECT con_id           
						                       FROM Tb_Consumer
											   WHERE city='Stevens Point'
											)
					  )

 SELECT DISTINCT  
	                b.name,
         			 c.city
	             FROM Tb_Transactions a LEFT JOIN
		              Tb_Product b ON a.prod_id=b.prod_id LEFT JOIN
			          Tb_Consumer c ON a.CON_id=c.CON_id

					  

