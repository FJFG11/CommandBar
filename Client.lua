local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local bar = ReplicatedStorage:WaitForChild("RTGFGV556VHBGG7yghGH6")
local barui = script.Parent:WaitForChild("Command_Frame")

local fadeInInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local fadeOutInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local Startup = barui.Parent:WaitForChild("StartUp")

local function tweenTransparency(ui, goalValue, info)
	local tweens = {}

	if ui:IsA("Frame") then
		table.insert(tweens, TweenService:Create(ui, info, { BackgroundTransparency = goalValue }))
	elseif ui:IsA("ImageLabel") or ui:IsA("ImageButton") then
		table.insert(tweens, TweenService:Create(ui, info, { ImageTransparency = goalValue }))
	end

	for _, obj in ipairs(ui:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") then
			table.insert(tweens, TweenService:Create(obj, info, { TextTransparency = goalValue }))
		elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
			table.insert(tweens, TweenService:Create(obj, info, { ImageTransparency = goalValue }))
		elseif obj:IsA("Frame") then
			table.insert(tweens, TweenService:Create(obj, info, { BackgroundTransparency = goalValue }))
		elseif obj:IsA("UIStroke") then
			table.insert(tweens, TweenService:Create(obj, info, { Transparency = goalValue }))
		end
	end

	for _, tween in ipairs(tweens) do
		tween:Play()
	end

	return tweens
end

bar.OnClientEvent:Connect(function()
	if barui.Visible then
		local tweens = tweenTransparency(barui, 1, fadeOutInfo)
		tweens[#tweens].Completed:Connect(function()
			barui.Visible = false
		end)
	else
		barui.Visible = true
		Startup:Play()
		Startup:Destroy()
		tweenTransparency(barui, 0, fadeInInfo)
		
	end
end)
