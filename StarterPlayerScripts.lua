local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sps = game.StarterPlayer.StarterPlayerScripts

local OPEN_COMMAND = ReplicatedStorage:WaitForChild("RTGFGV556VHBGG7yghGH6")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.F2 then
		OPEN_COMMAND:FireServer()
	end
end)
