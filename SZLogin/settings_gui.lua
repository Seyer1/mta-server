local font = {
	[1] = dxCreateFont("font/medium.ttf", 10),
	[2] = dxCreateFont("font/medium.ttf", 14)
}

-- window
dgsSetFont(dx.window[1], font[1])
dgsSetFont(dx.window[2], font[1])
-- labels
for i, v in pairs(dx.label) do
	dgsSetFont(v, font[1])
	if v == dx.label[2] or v == dx.label[4] or v == dx.label[6] or v == dx.label[8] or v == dx.label[11] then
		dgsLabelSetColor(v, 255, 0, 0)
	end
end
dgsSetFont(dx.label[1], font[1])
dgsSetFont(dx.label[2], font[1])
dgsSetFont(dx.label[3], font[1])
dgsSetFont(dx.label[4], font[1])
dgsSetFont(dx.label[5], font[1])
dgsSetFont(dx.label[6], font[1])
dgsSetFont(dx.label[7], font[1])
dgsSetFont(dx.label[8], font[1])
dgsSetFont(dx.label[9], font[1])
dgsSetFont(dx.label[10], font[1])
dgsSetFont(dx.label[11], font[1])
-- buttons
dgsSetFont(dx.button[1], font[2])
dgsSetFont(dx.button[2], font[2])
dgsSetFont(dx.button[3], font[2])
dgsSetFont(dx.button[4], font[2])
--- edits
dgsSetFont(dx.edit[1], font[1])
dgsSetFont(dx.edit[2], font[1])
dgsSetFont(dx.edit[3], font[1])
dgsSetFont(dx.edit[4], font[1])
dgsSetFont(dx.edit[5], font[1])