

/*BLUE SIDE*/


SET @side = 'Blue';   
/*blue fighter by quantity (uguale a quello sopra però più compatto) */
select sum(quantity)
 from Assigned join airbase on Airbase_idAirbase = idAirbase 
 where ( Role_idRole = 'CAP' or Role_idRole = 'GCI' ) and Role_idRole = @side;
	

SET @side = 'Blue';   
/*blue fighter-bomber, bomber by quantity (uguale a quello sopra però più compatto) */
select sum(quantity)
 from Assigned join airbase on Airbase_idAirbase = idAirbase 
 where ( Role_idRole = 'GA' or Role_idRole = 'CAS' or Role_idRole = 'BAI') and Role_idRole = @side; 
	
 

/* CAP */

/*blue CAP by Airbase, Aircraft and quantity OK ma più lunga

select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned, Role, Airbase 
 where assigned.Role_idRole = Role.idRole 
		and Role.idRole = 'CAP' 
		and assigned.Airbase_idAirbase = Airbase.idAirbase 
        and Airbase.side = 'Blue' 
	group by idAirbase, assigned.Aircraft_idAircraft;
*/


 SET @role = 'CAP';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
	
/* CAS */    
    
 SET @role = 'CAS';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
	
/* GA */    
    
 SET @role = 'GA';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;


/* BAI */    
    
 SET @role = 'BAI';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
 
 
 /* SEAD */    
    
 SET @role = 'SEAD';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
 
 
 /* SEAD */    
    
 SET @role = 'SEAD';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
 
/* GCI */    
    
 SET @role = 'GCI';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side; 
 
 
/* EWR */    
    
 SET @role = 'EWR';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;  
 
 
 /* REC */    
    
 SET @role = 'REC';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;  
 
 
 /* TRA */    
    
 SET @role = 'TRA';   
 SET @side = 'Blue';   
/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*blue total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;  
 
 
 
 
 
 
 
 /*RED SIDE*/


/* CAP */

/*Red CAP by Airbase, Aircraft and quantity OK ma più lunga

select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned, Role, Airbase 
 where assigned.Role_idRole = Role.idRole 
		and Role.idRole = 'CAP' 
		and assigned.Airbase_idAirbase = Airbase.idAirbase 
        and Airbase.side = 'Red' 
	group by idAirbase, assigned.Aircraft_idAircraft;
*/



 SET @role = 'CAP';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
	
/* CAS */    
    
 SET @role = 'CAS';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
	
/* GA */    
    
 SET @role = 'GA';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;


/* BAI */    
    
 SET @role = 'BAI';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
 
 
 /* SEAD */    
    
 SET @role = 'SEAD';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
 
 
 /* SEAD */    
    
 SET @role = 'SEAD';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;
 
/* GCI */    
    
 SET @role = 'GCI';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side; 
 
 
/* EWR */    
    
 SET @role = 'EWR';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;  
 
 
 /* REC */    
    
 SET @role = 'REC';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;  
 
 
 /* TRA */    
    
 SET @role = 'TRA';   
 SET @side = 'Red';   
/*Red by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
    
    
/*Red by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side 
	group by Airbase_idAirbase;    
    
/*Red total aircraft*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = @role and Airbase.side = @side;  