
--[[ 

  Database delle risorse presenti  in DCS.
  Sviluppato per essere utilizzato nella campagna Gerogian_War
  
  sviluppatore: Marco Bellafante
  data: dicembre 2018
  
  ]]--
  

role_aircraft = { multi_role = 'multi_role', fighter = 'fighter', attack = 'attack', bomber = 'bomber', transport = 'transport', resupply = 'resupply', sead = 'sead', antisom = 'antisom'}

country = { russia = 'russia', usa = 'usa', georgia = 'georgia', abkhazia = 'abkhazia', england = 'england', germany = 'germany', ossetia = 'ossetia'}

resource = {
  
  aircraft = {
    
    Su27 = {
      
      role = role_aircraft.multi_role,
      
      weight = 12000,
      
      range = 2000,
      
      fuel = 1000,
      
      immission = 1980,
      
      retired = 2100,
      
      country = {country.russia, country.georgia, country.ossetia},
      
     },
    
    Su24 = {
      
      role = role_aircraft.attack,
      
      weight = 9000,
      
      range = 1000,
      
      fuel = 8000,
      
      immission = 1965,
      
      retired = 2100,
      
      country = {country.russia, country.georgia, country.ossetia},
      
    },
        
  },
  
  elicopter = nil,
  
  air_defence = nil,
  
  ship = nil,
  
  veichle = {
    
    armor = nil,
    
    air_defence = nil,
    
    infantry = nil,
    
    artillery = nil, 
    
    train = nil,
    
  }
  
}
  
  
  role_aircraft = { multi_role = 'multi_role', fighter = 'fighter', attack = 'attack', bomber = 'bomber', transport = 'transport', resupply = 'resupply', sead = 'sead', antisom = 'antisom'}
  country = { russia = 'russia', usa = 'usa', georgia = 'georgia', abkhazia = 'abkhazia', england = 'england', germany = 'germany', ossetia = 'ossetia'}
  
  print('aircraft =', resource.aircraft.Su27.country[1])
  print('aircraft =', resource['aircraft'].Su27.role)
  
  print('aircraft =', resource.aircraft.Su24.role)
  print('aircraft =', resource['aircraft']['Su24'].role)