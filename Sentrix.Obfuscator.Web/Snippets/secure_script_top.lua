local game = game
local pcall = pcall
local xpcall = xpcall
local ypcall = ypcall
local workspace = workspace
local script = script
local math = math
local string = string
local table = table
local typeof = typeof
local type = type
local Instance = Instance
local print = print
local warn = warn
local error = error
local delay = delay
local spawn = spawn
local wait = wait
local tick = tick
local time = time
local require = require
local loadstring = loadstring
local ipairs = ipairs
local pairs = pairs
local next = next
local coroutine = coroutine
local utf8 = utf8
local UDim2 = UDim2
local Vector3 = Vector3
local CFrame = CFrame
local Color3 = Color3
local Enum = Enum

local Trap = setmetatable({}, {
	__tostring = function(...)
		while true do end
		return 'no'
	end,
})


local GameService_NameCall

xpcall(function(...)
	return game:GetService(Trap)	
end, function()
	GameService_NameCall = debug.info(2, 'f')
end)

xpcall(function(...)
	return GameService_NameCall(game, 'owo')	
end, function(a0) 
	GameService_NameCall = debug.info(2, 'f')
end)


local SafeGame = {}

function SafeGame:GetService(Service)
	return GameService_NameCall(game, Service) and game.service(game, Service) and game:FindService(Service) and game:FindFirstChild(Service) and game:WaitForChild(Service) and game:FindFirstChildOfClass(Service) and (function(owo)
		local FakePart = Instance.new('Part', game:GetService('ReplicatedStorage'))
		local Parent = FakePart.Parent.Parent
		FakePart:Destroy()
		return (Parent[owo] or Parent:GetService(owo)) 
	end)(Service) and game:FindFirstChildWhichIsA(Service)
	
	or error('no', 2)
end


setmetatable(SafeGame, {__index = game, __newindex = game, __tostring = tostring(game), __metatable = getmetatable(game)})

local Emulation = setmetatable({}, {
	__index = function(self, idx)
		if type(idx) == "string" then
			return self
		end
	end,
	__call = function(self, old_obj)
		local new_obj = newproxy(true)
		local new_mt = getmetatable(new_obj)

		new_mt.__index = function(self, idx)
			local val = old_obj[idx]
			if rawequal(idx, 'GetService') then
				return function(self, ...)
					return SafeGame:GetService(...) and val(old_obj, ...)
				end
			end
			
			if type(val) == "function" then
				return function(self, ...)
					
					return val(old_obj, ...)
				end
			end

			return old_obj[idx]
		end

		new_mt.__newindex = function(self, idx, new_val)
			old_obj[idx] = new_val
		end

		return new_obj
	end
})


local HttpService = Emulation(workspace.Parent):GetService('HttpService') :: HttpService
local ReplicatedStorage = Emulation(workspace.Parent):GetService('ReplicatedStorage') :: ReplicatedStorage
local ServerStorage = Emulation(workspace.Parent):GetService('ServerStorage') :: ServerStorage
local ServerScriptService = Emulation(workspace.Parent):GetService('ServerScriptService') :: ServerScriptService
local Players = Emulation(workspace.Parent):GetService('Players') :: Players
local Lighting = Emulation(workspace.Parent):GetService('Lighting') :: Lighting
local StarterGui = Emulation(workspace.Parent):GetService('StarterGui') :: StarterGui
local StarterPack = Emulation(workspace.Parent):GetService('StarterPack') :: StarterPack
local StarterPlayer = Emulation(workspace.Parent):GetService('StarterPlayer') :: StarterPlayer
local Teams = Emulation(workspace.Parent):GetService('Teams') :: Teams
local SoundService = Emulation(workspace.Parent):GetService('SoundService') :: SoundService
local TeleportService = Emulation(workspace.Parent):GetService('TeleportService') :: TeleportService
local RunService = Emulation(workspace.Parent):GetService('RunService') :: RunService
local UserInputService = Emulation(workspace.Parent):GetService('UserInputService') :: UserInputService
local Debris = Emulation(workspace.Parent):GetService('Debris') :: Debris
local Workspace = Emulation(workspace.Parent):GetService('Workspace') :: Workspace
local PathfindingService = Emulation(workspace.Parent):GetService('PathfindingService') :: PathfindingService
local LocalizationService = Emulation(workspace.Parent):GetService('LocalizationService') :: LocalizationService
local BadgeService = Emulation(workspace.Parent):GetService('BadgeService') :: BadgeService
local DataStoreService = Emulation(workspace.Parent):GetService('DataStoreService') :: DataStoreService
local MarketplaceService = Emulation(workspace.Parent):GetService('MarketplaceService') :: MarketplaceService
local MessagingService = Emulation(workspace.Parent):GetService('MessagingService') :: MessagingService
local PolicyService = Emulation(workspace.Parent):GetService('PolicyService') :: PolicyService
local TweenService = Emulation(workspace.Parent):GetService('TweenService') :: TweenService
local TextService = Emulation(workspace.Parent):GetService('TextService') :: TextService
local ProximityPromptService = Emulation(workspace.Parent):GetService('ProximityPromptService') :: ProximityPromptService
local VRService = Emulation(workspace.Parent):GetService('VRService') :: VRService
local PhysicsService = Emulation(workspace.Parent):GetService('PhysicsService') :: PhysicsService
local InsertService = Emulation(workspace.Parent):GetService('InsertService') :: InsertService


local function raweq2(a, b, nulls)
	local tb = {}
	a = a or (nulls and nil or 0)
	b = b or (nulls and nil or 0)
	tb[a] = true
	local res = tb[b]
	tb[a] = nil
	return res or false
end

local function superraweq(a, b)
	while (a ~= nil and b ~= nil) and ({ [a] = 'imagine trying to hook eq' })[b] 
		and ({ [b] = 'ok' })[a] 
		and tostring(a == b) == 'true' 
		and tostring(a ~= b) == 'false' 
		and not (a > b) 
		and not (a < b) 
		and raweq2(a, b) 
		and rawequal(a, b) 
	do
		return true
	end
	return false
end