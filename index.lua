while true do
pad = Controls.read()

if (Controls.check(pad, KEY_Y)) and not (Controls.check(oldpad, KEY_Y)) then
System.takeScreenshot(System.currentDirectory().. number .. ".jpg", false)
number = number + 1
end

if (Controls.check(pad,KEY_DUP)) and not (Controls.check(oldpad,KEY_DUP)) then
y = y - 1
end
if (Controls.check(pad,KEY_DDOWN)) and not (Controls.check(oldpad,KEY_DDOWN)) then
y = y + 1
end
if maxy < y then
y = 1
end
if y <= 0 then
y = 4
end

Screen.waitVblankStart()
Screen.refresh()
Screen.clear(TOP_SCREEN)
lol = {unselect,unselect,unselect,unselect}
lol[y] = selected
Screen.debugPrint(45,0,"Megalegacy's Homebrew Menu v 0.1a",unselect,TOP_SCREEN)
Screen.debugPrint(45,30,"Load Game Cartridge",lol[1],TOP_SCREEN)
Screen.debugPrint(45,45,"Load Homebrew",lol[2],TOP_SCREEN)
Screen.debugPrint(45,60,"Reboot System",lol[3],TOP_SCREEN)
Screen.debugPrint(45,75,"Exit",lol[4],TOP_SCREEN)
Screen.flip()

if homebrew == 1 then
dofile(System.currentDirectory().."/homebrew.lua")
end

if gamecard == 1 then
dofile(System.currentDirectory().."/gamecard.lua")
end

if (Controls.check(pad,KEY_A)) and not (Controls.check(oldpad,KEY_A)) and y == 1 then
gamecard = 1
end

if (Controls.check(pad,KEY_A)) and not (Controls.check(oldpad,KEY_A)) and y == 2 then
homebrew = 1
end

if (Controls.check(pad,KEY_A)) and not (Controls.check(oldpad,KEY_A)) and y == 3 then
System.reboot()
end

if (Controls.check(pad,KEY_A)) and not (Controls.check(oldpad,KEY_A)) and y == 4 then
Sound.term()
System.exit()
end

Screen.refresh()
Screen.waitVblankStart()
oldpad = pad
end