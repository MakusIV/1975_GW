CREATE VIEW `blue fighter by quantity` AS    
select sum(quantity)
 from Assigned join airbase on Airbase_idAirbase = idAirbase 
 where ( Role_idRole = 'CAP' or Role_idRole = 'GCI' ) and Role_idRole = 'Blue';
