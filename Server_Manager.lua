local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OPEN_COMMAND = Instance.new("RemoteEvent")
OPEN_COMMAND.Parent = ReplicatedStorage
OPEN_COMMAND.Name = "RTGFGV556VHBGG7yghGH6"

local SPS = script.Parent:WaitForChild("StarterPlayerScripts")
local sp = game.StarterPlayer.StarterPlayerScripts
SPS.Parent = sp

OPEN_COMMAND.OnServerEvent:Connect(function(player)
	OPEN_COMMAND:FireClient(player)
end)
