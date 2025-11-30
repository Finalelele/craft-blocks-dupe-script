local rs = game:GetService('ReplicatedStorage')
if rs:FindFirstChild('GameRemotes') then
	local HttpService = game:GetService("HttpService")
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/KavoUi/main/KavoUi.lua"))()
	local Window = Library.CreateLib("Dupe gui", "Midnight")
	local Tab = Window:NewTab("Main")
	local Section = Tab:NewSection("Dupe")
	local gr = rs.GameRemotes
	local si = gr.SortItem
	gr.Demo:Destroy()
	Section:NewButton("Instant chest dupe", "It may seem that the chest is empty, but you need to close it and open it again", function()
		for i=36,62 do
			spawn(function()
				si:InvokeServer(i)
			end)
		end
	end)
end
