-- ped = ig_trafficwarden, 0x5719786d
-- bus = bus, -713569950, 0xD577C962

local player = PlayerId()


-- Creating bus and peds spawn
local bus = GetHashkey("bus")
local ped = {
   {type=4,GetHashkey("ig_trafficwarden"), x= -402.246, y= -650.092, z= 28.188, a= 46.395}


-- Loading at map start
AddEventHandler('onClientMapStart', function()


-- Making Bus & peds spawn
RequestModel(0xD577C962) -- Bus
while not HadModelLoaded(0xD577C962) do
   Wait(1)
end
    
RequestModel(0x5719786d) -- Ped
while not HadModelLoaded(0x5719786d) do
   Wait(1)
end
         
-- Spawning the BUS     
         
for _, item in pairs(bus) do
	bus =  CreateVehicle(item.hash, item.x, item.y, item.z, item.a, false, false)
	SetVehicleOnGroundProperly(bus)
end
         
         

-- Spawning the PEDS and giving them weapons and 'relationship'
         
for _, item in pairs(peds) do
	ped = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
	GiveWeaponToPed(ped, 0x99B507EA, 2800, false, true) -- knives
	SetPedCombatAttributes(ped, 46, true)
	SetPedFleeAttributes(ped, 0, 0)
	SetPedArmour(ped, 100)
	SetPedMaxHealth(ped, 100)
	SetPedRelationshipGroupHash(ped, GetHashKey("CIVMALE"))
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND_PATROL", 0, true)
	SetPedCanRagdoll(ped, false)
	SetPedDiesWhenInjured(ped, false)
	end     
         

-- vehicle_generator bus { -405.24, -650.09, 28.18, heading = 28.53 } // Is it better?

			
-- Bus station blip
busstation = AddBlipForCoord(-402.246, -650.092, 28.188)
SetBlipSprite(busstation, 66)
SetBlipDisplay(busstation, 4)
SetBlipColor(busstation, 2)

      
end)
	
	
-- Now let's write the job part
	-- Press DEL to get started
	-- Get a BLIP for the nearest bus stop
	-- Go there, wait for ped getting in bus
	-- Peds pay 3$ when going on the bus
	-- Go to next bus stop
	-- Peds getting in or out
	-- Repeat for an amount of bus stops (maybe not every on the city but build 2 or 3 bus lines)
	-- Go back to Bus station when done


