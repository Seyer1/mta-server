local font = {
	[1] = dxCreateFont("font/medium.ttf", 10)
}

-- window
dgsSetFont(dx.window[1], font[1])
-- gridlist
dgsSetFont(dx.gridlist[1], font[1])
-- tab 
dgsSetFont(dx.tab[1], font[1])
-- labels
for i, v in pairs(dx.label) do
	dgsSetFont(v, font[1])
	if v == dx.label[1] or v == dx.label[6] or v == dx.label[14] or v == dx.label[19] or v == dx.label[24] then
		dgsLabelSetColor(v, 255, 0, 0)
	end
end
-- buttons
dgsSetFont(dx.button[1], font[1])
dgsSetFont(dx.button[2], font[1])
dgsSetFont(dx.button[3], font[1])
dgsSetFont(dx.button[4], font[1])
dgsSetFont(dx.button[5], font[1])
dgsSetFont(dx.button[6], font[1])
dgsSetFont(dx.button[7], font[1])
dgsSetFont(dx.button[8], font[1])
---[Radios]---
dgsSetFont(dx.radio[1], font[1])
dgsSetFont(dx.radio[2], font[1])
dgsSetFont(dx.radio[3], font[1])
dgsSetFont(dx.radio[4], font[1])
dgsSetFont(dx.radio[5], font[1])