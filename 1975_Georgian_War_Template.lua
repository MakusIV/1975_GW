--[[


1975 Georgian War


autor: Marco Bellafante
date: december 2018


note sviluppo:

definisci in ME tutti i template relativi alle unità da utilizzare: Aircraft, Veichle, Ship, ecc. utilizzando la nomenclatura definita in Moose:

per Aircraft:
name, pilot: = SQ <coalition> <role> <aircraft>
<role> : = GCI , CAP_Long, CAP_Medium, ATTACK_1, ... ecc..
<aircraft> := SU-27, ....
<coalition> := red, blue

per Veichle:

warhouse:


verifica se in runtime riesci ad interrogare il database di DCS sugli aerei:

mediante il nome dell'unità template es: nome = 'SQ red CAP Mig_23MLD', unit.findByName(name), name_missile = unit.getDescr.getMissile.name, out_info(name_missile)




 
 LOAD MISSION LOG FILE:
  
    filename = 'F:\\Programmi\\luaDevTool\\workspace\\Test_Moose_Missions\\My Mission\\moose.lua'
    dofile(filename) se il file è in lua come credo che sia (mission.lua)

 
 PARSING MISSION LOG FILE: 
 
   airbase avalaible, airbase_aircraft_avalaible,  
   
   valutare la possibilità di duplicare il file log di missione salvandolo con un nome specifico per l'utilizzo nella missione
   
   
   analisi:
   
   - valutazione perdite in relazione al contingente militare (*) di riferimento per la zona 
   
   
   
   
 (*): il contingente militare è costituito da tutte le unità/gruppi (tactical_group) che agiscono in una determinata zona tattica (tactical_zone) (**)
 
 (**): la zona tattica può essere rappresentata mediante una trigger zone. Il "fronte" può essere rappresentato da zone tattiche muovibili in runtime. 
 NOTA: l'eventuale aggiornamento della situazione può essere effettuato in runtime (come nei server multiplayer) in modo da realizzare una situazione dinamica. 
 La chiusura della missione comporterebbe solo il salvataggio dello stato attuale.
 
 
 
 Forse conviene utilizzare la modalità server multiplayer in modo da proporre più missioni al player lasciando alla  AI la gestione dei piloti/missioni non selezionati:
 vedi:

   - https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/AI.AI_Balancer.html
   - https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/AIB%20-%20AI%20Balancing
  
  
  per spawning:
  
  https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Core.Spawn.html
https://github.com/FlightControl-Master/MOOSE_MISSIONS/tree/master/SPA%20-%20Spawning
 
 
-- La detection non dovrebbe essere modificato in quanto serve solo ad associare al sistema di rilevamento tutte le unità di rilevameno con nome conforme al prefix_detector.

-- La posizione delle detector units (EWR) può eventualmente essere cambiata in base alla evoluzione della situazione.

-- Il dispatcher potrebbe essere modificato in base alla situazione: il gci_radius potrebbe essere ridotto cosi come l'engage radius.

-- assign_squadron_at_airbase viene modificato in base alla situazione: gli squadroni assegnati alla specifica airbase e il numero di aerei disponibili.

-- assign_gci viene modificato in base alla situazione definendo le missioni GCI in base alle zone tattiche relative alle basi aeree e alle zone strategiche definite.

-- assign_cap viene modificato in base alla situazione definendo le missioni CAP in base alle zone tattiche definite.

 
  GRUPPO TATTICO TERRESTRE
  tactical_ground_group: tabella contenente l'elenco dei gruppi tattici con definita per ciascuna unità la posizione (vect3d?) e . Il gruppo tattico ha una warhouse contenente
  i rifornimenti per le unità. Al gruppo tattico è associato il morale (che inciderà negli skill di combattimento), la tactical_zone dove agisce, la categoria di appartenenza 
  (artiglieria, fanteria(meccanizzata), corazzati, Air defence ecc.). 
  
  ZONA TATTICA TERRESTRE
  tactical_ground_zone: tabella contenente la posizione delle trigger zone (vect3d?)    
 
  GRUPPO TATTICO AEREO
  
  ZONA TATTICA AEREA
  
  
 

]]--





-- DATABASE
---
--  coalition table
--  
--  red, blue, neutral
--  
local coalition = {red = 'red', blue = 'blue', neutral = 'neutral'} -- coalizzione attive in ME


---   airbase   table
--   
--    AIRBASE.Caucasus.Gelendzhik
--    AIRBASE.Caucasus.Krasnodar_Pashkovsky
--    AIRBASE.Caucasus.Sukhumi_Babushara
--    AIRBASE.Caucasus.Gudauta
--    AIRBASE.Caucasus.Batumi
--    AIRBASE.Caucasus.Senaki_Kolkhi
--    AIRBASE.Caucasus.Kobuleti
--    AIRBASE.Caucasus.Kutaisi
--    AIRBASE.Caucasus.Tbilisi_Lochini
--    AIRBASE.Caucasus.Soganlug
--    AIRBASE.Caucasus.Vaziani
--    AIRBASE.Caucasus.Anapa_Vityazevo
--    AIRBASE.Caucasus.Krasnodar_Center
--    AIRBASE.Caucasus.Novorossiysk
--    AIRBASE.Caucasus.Krymsk
--    AIRBASE.Caucasus.Maykop_Khanskaya
--    AIRBASE.Caucasus.Sochi_Adler
--    AIRBASE.Caucasus.Mineralnye_Vody
--    AIRBASE.Caucasus.Nalchik
--    AIRBASE.Caucasus.Mozdok
--    AIRBASE.Caucasus.Beslan
local airbase = { Kutaisi = AIRBASE.Caucasus.Kutaisi, Sochi_Adler = AIRBASE.Caucasus.Sochi_Adler, Mozdok = AIRBASE.Caucasus.Mozdok, Senaki_Kolkhi = AIRBASE.Caucasus.Senaki_Kolkhi, 
                  Maykop = AIRBASE.Caucasus.Maykop_Khanskaya, Novo = AIRBASE.Caucasus.Novorossiysk, Mineralnye = AIRBASE.Caucasus.Mineralnye_Vody, Nalchik = AIRBASE.Caucasus.Nalchik,
                  Beslan = AIRBASE.Caucasus.Beslan, Gudauta = AIRBASE.Caucasus.Gudauta, Gelendzhik = AIRBASE.Caucasus.Gelendzhik, Krasnodar_Pashkovsky = AIRBASE.Caucasus.Krasnodar_Pashkovsky,
                  Sukhumi_Babushara = AIRBASE.Caucasus.Sukhumi_Babushara, Kobuleti = AIRBASE.Caucasus.Kobuleti, Tbilisi_Lochini = AIRBASE.Caucasus.Tbilisi_Lochini, Soganlug = AIRBASE.Caucasus.Soganlug,
                  Vaziani = AIRBASE.Caucasus.Vaziani, Anapa_Vityazevo = AIRBASE.Caucasus.Anapa_Vityazevo, Krasnodar_Center = AIRBASE.Caucasus.Krasnodar_Center, Krymsk = AIRBASE.Caucasus.Krymsk, } -- aeroporti attivi in ME


local sam = {SA_6 = 'SA_6', SA_10 = 'SA_10'}

local skill = { excellent = 'excellent', high = 'high', good = 'good', normal = 'normal', random = 'random' } -- skill influenzato anche dal morale

---
--  cap_zone_db  table
--  
--  Qui devi riportare i nomi delle cap create in ME
--
local cap_zone_db = {

  red = {C1 = "RED CAP ZONE BESLAN"},
  
  blue =  {C1 = "BLUE CAP ZONE KUTAISI", C2 = "BLUE CAP ZONE KUTAISI NE"}
  
 }



--- air_template table:
--
-- red:
-- 
-- Sq1 = 'SQ red GCI Mig_21Bis', Sq2 = 'SQ red GCI Mig_23MLD', Sq3 = 'SQ red GCI Mig_25PD', 
-- 
-- Sq4 = 'SQ red CAP Mig_21Bis', Sq5 = 'SQ red CAP Mig_23MLD', Sq6 = 'SQ red CAP Mig_25PD',
-- 
-- Sq7 = 'SQ red CAP L_39C', Sq8 = 'SQ red CAP L_39ZA', Sq9 = 'SQ red ATTACK Mig_27K', 
-- 
-- Sq10 = 'SQ red ATTACK SU_17M4', Sq11 = 'SQ red ATTACK MI_24V', Sq12 = 'SQ red RECO Mig_25RTB',
-- 
-- Sq13 = 'SQ red BOMBER TU_142', Sq14 = 'SQ red BOMBER TU_22', Sq15 = 'SQ red BOMBER SU_24', 
-- Sq16 = 'SQ red RECO SU_24MR', Sq17 = 'SQ red TRANSPORT AN_26', Sq18 = 'SQ red TRANSPORT YAK_40'  },
-- 
-- 
-- blue:
-- 
-- Sq1 = 'SQ blue GCI Mig_21Bis', Sq2 = 'SQ blue GCI Mig_23MLD', Sq3 = 'SQ blue GCI Mig_25PD', 
-- 
-- Sq4 = 'SQ blue CAP Mig_21Bis', Sq5 = 'SQ blue CAP Mig_23MLD', Sq6 = 'SQ blue CAP Mig_25PD',
-- 
-- Sq7 = 'SQ blue CAP L_39C', Sq8 = 'SQ blue CAP L_39ZA', Sq9 = 'SQ blue ATTACK Mig_27K', 
-- 
-- Sq10 = 'SQ blue ATTACK SU_17M4', Sq11 = 'SQ blue ATTACK MI_24V', Sq12 = 'SQ blue RECO Mig_25RTB',
-- 
-- Sq13 = 'SQ blue BOMBER TU_142', Sq14 = 'SQ blue BOMBER TU_22', Sq15 = 'SQ blue BOMBER SU_24', 
-- 
-- Sq16 = 'SQ blue RECO SU_24MR', Sq17 = 'SQ blue TRANSPORT AN_26', Sq18 = 'SQ blue TRANSPORT YAK_40',
-- 
-- Sq19 = 'SQ blue GCI F_4', Sq20 = 'SQ blue GCI F_5', Sq21 = 'SQ blue CAP F_4', Sq22 = 'SQ blue CAP F_5', 
-- 
-- Sq23 = 'SQ blue BOMBER B-1B', Sq24 = 'SQ blue BOMBER B-52H', Sq25 = 'SQ blue  TRANSPORT UH-1H',
-- 
-- Sq26 = 'SQ blue  TRANSPORT UH-60A'  }
-- 
local air_template = {

  red = { Sq1 = 'SQ red GCI Mig_21Bis', Sq2 = 'SQ red GCI Mig_23MLD', Sq3 = 'SQ red GCI Mig_25PD', Sq4 = 'SQ red CAP Mig_21Bis', Sq5 = 'SQ red CAP Mig_23MLD', Sq6 = 'SQ red CAP Mig_25PD',
          Sq7 = 'SQ red CAP L_39C', Sq8 = 'SQ red CAP L_39ZA', Sq9 = 'SQ red ATTACK Mig_27K', Sq10 = 'SQ red ATTACK SU_17M4', Sq11 = 'SQ red ATTACK MI_24V', Sq12 = 'SQ red RECO Mig_25RTB',
          Sq13 = 'SQ red BOMBER TU_142', Sq14 = 'SQ red BOMBER TU_22', Sq15 = 'SQ red BOMBER SU_24', Sq16 = 'SQ red RECO SU_24MR', Sq17 = 'SQ red TRANSPORT AN_26', Sq18 = 'SQ red TRANSPORT YAK_40'  },

  blue = {Sq1 = 'SQ blue GCI Mig_21Bis', Sq2 = 'SQ blue GCI Mig_23MLD', Sq3 = 'SQ blue GCI Mig_25PD', Sq4 = 'SQ blue CAP Mig_21Bis', Sq5 = 'SQ blue CAP Mig_23MLD', Sq6 = 'SQ blue CAP Mig_25PD',
          Sq7 = 'SQ blue CAP L_39C', Sq8 = 'SQ blue CAP L_39ZA', Sq9 = 'SQ blue ATTACK Mig_27K', Sq10 = 'SQ blue ATTACK SU_17M4', Sq11 = 'SQ blue ATTACK MI_24V', Sq12 = 'SQ blue RECO Mig_25RTB',
          Sq13 = 'SQ blue BOMBER TU_142', Sq14 = 'SQ blue BOMBER TU_22', Sq15 = 'SQ blue BOMBER SU_24', Sq16 = 'SQ blue RECO SU_24MR', Sq17 = 'SQ blue TRANSPORT AN_26', Sq18 = 'SQ blue TRANSPORT YAK_40',
          Sq19 = 'SQ blue GCI F_4', Sq20 = 'SQ blue GCI F_5', Sq21 = 'SQ blue CAP F_4', Sq22 = 'SQ blue CAP F_5', Sq23 = 'SQ blue BOMBER B-1B', Sq24 = 'SQ blue BOMBER B-52H', Sq25 = 'SQ blue  TRANSPORT UH-1H', 
          Sq26 = 'SQ blue  TRANSPORT UH-60A'  }

}


local ground_group_template = {}

local ground_zone_template = {}

--[[

-- Russian ground troops attacking Gori Valley
Spawn_RU_Troops =
  { 'RU Attack Gori 1',  -- template name del groups (unita:veicoli, truppa, sam)
    'RU Attack Gori 2',
    'RU Attack Gori 3',
    'RU Attack Gori 4',
    'RU Attack Gori 5',
    'RU Attack Gori 6',
    'RU Attack Gori 7',
    'RU Attack Gori 8',
    'RU Attack Gori 9',
    'RU Attack Gori 10'
  }


Spawn_RU_Troops_Left = SPAWN
  :New( "RU Attack Gori Left" )  -- name del percorso definito dal unarmed Transport UAZ-469 (velocita 75 km/h)
  :InitLimit( 15, 40 )
  :InitRandomizeTemplate( Spawn_RU_Troops ) -- scegli a caso dalla tabella dei template delle  troops di sopra?
  :InitRandomizeRoute( 1, 1, 2000 )
  --:InitArray( 349, 30, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

]]--



--- prefix_detector
-- 
-- red = {"DF CCCP AWACS", "DF CCCP EWR"
-- 
-- DF GEORGIA AWACS", "DF GEORGIA EWR"
-- 
-- 
local prefix_detector = { 

  red = {"DF CCCP AWACS", "DF CCCP EWR" },
  
  blue = {"DF GEORGIA AWACS", "DF GEORGIA EWR" }
  
  }


-- trigger_zone_group = -- trigger zone gorup definite in ME: sono le zone dove agiscono i gruppi

-- END DATABASE





-- DEFINE FUNCTION --


-- DETECTION

-- La detection non dovrebbe essere modificato in quanto serve solo ad associare al sistema di rilevamento tutte le unità di rilevameno con nome conforme al prefix_detector.
-- Eventualmente la posizione delle detector units (EWR) può essere cambiata in base alla evoluzione della situazione.


--- Create a detection zone based on a group of detector units. 
--  The detector group is created utilizing detector units with name formed with prefix_detector.
-- 
--     
-- @param prefix_detector:  table with name of EWR unit in Mission Editor
-- @param range:  range max of detection target
-- @return DETECTION_AREAS
function detection(prefix_detector, range)

  local DetectionSetGroup = SET_GROUP:New()
  DetectionSetGroup:FilterPrefixes( prefix_detector )
  DetectionSetGroup:FilterStart()
  Detection = DETECTION_AREAS:New( DetectionSetGroup, range )
  
  return Detection
  
end


-- DISPATCHER

-- Il dispatcher potrebbe essere modificato in base alla situazione: il gci_radius potrebbe essere ridotto cosi come l'engage radius.
 

--- Create a dispatcher.
--  The dispatcher offer detection service (info on intruder e flight situation) for CAP and GCI mission.       
--     
-- @param detection:  DETECTION_AREAS
-- @param gci_radius:  The radius to ground control intercept detected targets from the nearest airbase
-- @param engage_radius:  Initialize the dispatcher, setting up a radius of 50km where any airborne friendly without an assignment within 50km radius from a detected target, will engage that target.
-- @param view_tactical_display:  (true/false) Visualize tactical display
-- @return AI_A2A_DISPATCHER
function dispatcher(detection, gci_radius, engage_radius, view_tactical_display)

  -- A2ADispatcher:
  A2ADispatcher = AI_A2A_DISPATCHER:New( detection )

  -- default setup for dispatcher
  -- A2ADispatcher.SetDefaultTakeoffFromParkingCold()

  -- Set the ground intercept radius as the radius to ground control intercept detected targets from the nearest airbase.
  A2ADispatcher:SetGciRadius( gci_radius )

  -- Initialize the dispatcher, setting up a radius of 50km where any airborne friendly without an assignment within 50km radius from a detected target, will engage that target.
  A2ADispatcher:SetEngageRadius( engage_radius )

  A2ADispatcher:SetTacticalDisplay( view_tactical_display )

  return A2ADispatcher
  
end


-- ASSIGN SQUADRON AT AIRBASE

-- assign_squadron_at_airbase viene modificato in base alla situazione: gli squadroni assegnati alla specifica airbase e il numero di aerei disponibili

--- Setting up and assign an air squadron at airbase.
-- 
--     
--     
--  @param airbase_name:  airbase name
--  @param airbase:  AIRBASE
--  @param squadron_name:  specific air template name created in ME
--  @param no_aircraft:  number of aircraft assigned at airbase 
--  @param A2ADispatcher:  AI_A2A_DISPATCHER
function assign_squadron_at_airbase (airbase_name, airbase, squadron_name, no_aircraft, A2ADispatcher) 
  
  A2ADispatcher:SetSquadron( airbase_name, airbase, { squadron_name }, no_aircraft )

end
   

-- ASSIGN CAP

--  assign_cap viene modificato in base alla situazione definendo le missioni CAP in base alle zone tattiche definite.

--- Setting up and authorize CAP mission for Squadron assigned at specific airbase.
-- 
--     
--  @param cap_zone:  specific cap zone name created in ME   
--  @param airbase_name:  airbase name
--  @param alt_min: minimum CAP altitude 
--  @param alt_max: maximum CAP altitude
--  @param speed_min_patrol: minimum patrol CAP speed 
--  @param speed_max_patrol: maximum patrol CAP speed
--  @param speed_min_engage: minimum engage CAP speed
--  @param speed_max_engage: maximum engage CAP speed
--  @param num_cap_squad: number of squad assigned for single CAP mission 
--  @param max_time_new_cap: maximum time assigned for complete a CAP mission
--  @param probability: not used
--  @param take_off: AI_A2A_DISPATCHER.<*>  (  AI_A2A_DISPATCHER.Takeoff.Air/Runway/Hot/Cold  )
--  @param landing:  AI_A2A_DISPATCHER.<*> ( AI_A2A_DISPATCHER.Landing.AtRunway/NearAirbase/AtEngineShutdown )
--  @param A2ADispatcher:  AI_A2A_DISPATCHER
function assign_cap ( cap_zone, airbase_name, alt_min, alt_max, speed_min_patrol, speed_max_patrol, 
                      speed_min_engage, speed_max_engage, num_cap_squad, min_time_new_cap, max_time_new_cap, 
                      probability, take_off, landing, A2ADispatcher ) 

  local zone = ZONE_POLYGON:New( cap_zone, GROUP:FindByName( cap_zone ) )
  A2ADispatcher:SetSquadronCap( airbase_name, zone, alt_min, alt_max, speed_min_patrol, speed_max_patrol, speed_min_engage, speed_max_engage )
  A2ADispatcher:SetSquadronCapInterval( airbase_name, num_cap_squad, min_time_new_cap, max_time_new_cap, probability )
  A2ADispatcher:SetSquadronTakeoff( airbase_name, take_off )
  A2ADispatcher:SetSquadronLanding( airbase_name, landing )
  

end


-- ASSIGN GCI

--  assign_gci viene modificato in base alla situazione definendo le missioni GCI in base alle zone tattiche relative alle basi aeree e alle zone strategiche definite.


--- Setting up and authorize GCI mission for Squadrons assigned at specific airbase.
-- 
--        
--  @param airbase_name:  airbase name
--  @param speed_min_gci: minimum GCI speed 
--  @param speed_max_gci: maximum GCI speed
--  @param A2ADispatcher:  AI_A2A_DISPATCHER
function assign_gci (airbase_name, speed_min_gci, speed_max_gci, A2ADispatcher) 

   -- Activate airbase for gci operation 
   A2ADispatcher:SetSquadronGci( airbase_name, speed_min_gci, speed_max_gci )
 
end
   
   
   
   


-- END DEFINE FUNCTION










--[[

Risorse aeree
-- 
-- deve essere inizializzato in base alle unita definite come template. Quindi
-- ricerca delle unita con prefisso SQ NO solo in runtime
--

red

MIG-21Bis, fighter, 5.4k, 1.8k
MIG-23MLD, fighter, 10.4k, 1.9k
MIG-25PD, interceptor, 20 k, 1.2k
MIG-27K, attack , 22k, 1.9k
SU-17M4, attack, 10.6 k, 1.7k
SU-24, bomber, 22k, 1.2k
TU-142, bomber, 96k, 10.5k
TU-160, bomber, ???
TU-22, bomber, 50k, 5.1k
TU-95, bomber, 96k, 6.4k
MIG-25RTB, reco, 20k, 1.9k
SU-24MR, reco, 22.3k, 1.2k
L-39C, trainer, 3.4k, 1.6k
L-39ZA, trainer, 3.4k, 1.6k
AN-26, trasporto, 15.8k, 2.6k
IL-76MD, trasporto, 100k, 7.3k
YAK-40, trasporto, 9.4k, 2.5k

MI-24V, attacco, 8.2k, 0.5k


blue

F-5, Fighter, 4.3k, 2k
F-4, Fighter, 24k, 2.6k
A-10 A ???
S-3??
B-1B, bomber, 87k, 12k
B-52H, bomber, 120k, 16k


UH-1H, trasporto,.3k, 0.4k
UH-60A, trasporto, 5.7k, 0.6k

]]--




-- SITUATION A



--[[
-- FUNZIONA!!!!!!!! LEGGE IL FILE IN RUNTIME!
filename = 'F:\\Programmi\\luaDevTool\\workspace\\Test_Moose_Missions\\My Mission\\nothing.lua'
dofile(filename)
trigger.action.outText(nothing ,5 , false)
]]--







-- Nota le GCI sono attivate quando non c'è nessuno che ingaggi l'incursore
-- 
-- Il dispatcher() imposta l'intercettazione dalla base più vicina distante meno del gci_radius. Credo che la base più vicina dovrebbe essere scelta da quelle abilitate trmite assign_gci
-- 
-- Credo che per poter utilizzare esclusivamente le gci suad devi dedicare a loro l'uso di un aeroporto: quindi scegli per le cap gli aeroporti vicino al fronte, mentre quelli lontani per i gci



-- RED FORCE CAP-GCI


-- Setup generale

-- detection:
Detection_Red = detection(prefix_detector.red, 30000)
  
-- A2ADispatcher:
A2ADispatcher_Red = dispatcher(Detection_Red, 100000, 50000, true)



-- Setup CAP e GCI

-- assign squadron at airbase Mozdok
assign_squadron_at_airbase ('Mozdok', airbase.Mozdok, air_template.red.Sq4, 15, A2ADispatcher_Red)
 
-- assign mission cap for Mozdok Squadron 
assign_cap ( cap_zone_db.red.C1, airbase.Mozdok, 4000, 8000, 600, 800, 800, 1200, 2, 10, 30, 1, AI_A2A_DISPATCHER.Takeoff.Cold, AI_A2A_DISPATCHER.Landing.AtRunway, A2ADispatcher )

-- assign CGI mission for Mozdok Squadron: 
assign_gci('Mozdok', 800, 1200, A2ADispatcher_Red)


-- Setup only GCI

-- assign squadron at airbase
assign_squadron_at_airbase ('Sochi', airbase.Sochi_Adler, air_template.blue.Sq1, 7, A2ADispatcher_Red)

-- assign CGI mission for Squadron: 
assign_gci('Sochi', 800, 1200, A2ADispatcher_Red)


-- END RED FORCE CAP-GCI






-- BLUE FORCE CAP-GCI


-- Setup generale

-- detection:
Detection_Blue = detection(prefix_detector.blue, 30000)
  
-- A2ADispatcher:
A2ADispatcher_Blue = dispatcher(Detection_Blue, 100000, 50000, true)



-- Setup cap e gci

-- CAP and GCI

-- assign squadron at airbase
assign_squadron_at_airbase ('Kutaisi', airbase.Kutaisi, air_template.blue.Sq21, 15, A2ADispatcher_Blue)
 
-- assign mission cap for Squadron 
assign_cap ( cap_zone_db.blue.C1, airbase.Kutaisi, 4000, 8000, 600, 800, 800, 1200, 2, 10, 30, 1, AI_A2A_DISPATCHER.Takeoff.Cold, AI_A2A_DISPATCHER.Landing.AtRunway, A2ADispatcher_Blue )

-- assign CGI mission for Squadron: 
assign_gci('Kutaisi', 800, 1200, A2ADispatcher_Blue)



-- assign squadron at airbase
assign_squadron_at_airbase ('Senaki', airbase.Senaki_Kolkhi, air_template.blue.Sq22, 15, A2ADispatcher_Blue)
 
-- assign mission cap for Squadron 
assign_cap ( cap_zone_db.blue.C1, airbase.Senaki_Kolkhi, 4000, 8000, 600, 800, 800, 1200, 2, 10, 30, 1, AI_A2A_DISPATCHER.Takeoff.Cold, AI_A2A_DISPATCHER.Landing.AtRunway, A2ADispatcher_Blue )

-- assign CGI mission for Squadron: 
assign_gci('Senaki', 800, 1200, A2ADispatcher_Blue)



-- ONLY GCI

-- assign squadron at airbase
assign_squadron_at_airbase ('Gudauta', airbase.Gudauta, air_template.blue.Sq1, 7, A2ADispatcher_Blue)

-- assign CGI mission for Squadron: 
assign_gci('Gudauta', 800, 1200, A2ADispatcher_Blue)



