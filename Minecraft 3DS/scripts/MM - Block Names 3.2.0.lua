-- Add the BlangParser into the script, allowing for reading/writing of blang files.
---@type BlangParser
local blang_parser = dofile(Core.getModpath("lunacoreapi") .. "/src/utils/blang_parser.lua")
-- Obtains the title id of the current game.
local titleId = Core.getTitleId()

--[[ First declares a variable named localeFile, then opens the blang file of the current instance.
     Uses string.format and %s to place the title id into the path, and opens the blang file in r+ mode.
     r+ mode only writes to the file in the certain amount of data specified, in this case being the custom names and the original names.]]
local localeFile = Core.Filesystem.open(string.format("sdmc:/luma/titles/%s/romfs/loc/en_US-pocket.blang", titleId), "r+")

-- Does something to read the data presented in the localeParser:addText below, using the localFile variable.
local localeParser = blang_parser.newParser(localeFile)

--[[ Uses r+ mode to find the data of the first input and replaces it with the second.
     'tile.reserved6.name' would be replaced with 'Mud', and so on.]]
localeParser:addText("tile.reserved6.name", "Mud")
localeParser:addText("tile.info_update2.name", "Mud Bricks")
localeParser:addText("tile.info_update.name", "Tuff")
localeParser:addText("tile.netherreactor", "Polished Tuff")
localeParser:addText("tile.stonecutter.name", "Tuff Bricks")

-- Saves the new name data to the file
localeParser:dumpFile(localeFile)
-- Deletes unused/unneeded data stored in memory
collectgarbage("collect")

-- Frees up the localeFile variable
localeFile:close()

-- Rinse and repeat for the other languages
local localeFile = Core.Filesystem.open(string.format("sdmc:/luma/titles/%s/romfs/loc/en_GB-pocket.blang", titleId), "r+")

local localeParser = blang_parser.newParser(localeFile)

localeParser:addText("tile.reserved6.name", "Mud")
localeParser:addText("tile.info_update2.name", "Mud Bricks")
localeParser:addText("tile.info_update.name", "Tuff")
localeParser:addText("tile.netherreactor", "Polished Tuff")
localeParser:addText("tile.stonecutter.name", "Tuff Bricks")

localeParser:dumpFile(localeFile)
collectgarbage("collect")

localeFile:close()

local localeFile = Core.Filesystem.open(string.format("sdmc:/luma/titles/%s/romfs/loc/ru_RU-pocket.blang", titleId), "r+")

local localeParser = blang_parser.newParser(localeFile)

localeParser:addText("tile.reserved6.name", "Mud") 
localeParser:addText("tile.info_update2.name", "Mud Bricks")
localeParser:addText("tile.info_update.name", "Tuff")
localeParser:addText("tile.netherreactor", "Polished Tuff")
localeParser:addText("tile.stonecutter.name", "Tuff Bricks")

localeParser:dumpFile(localeFile)
collectgarbage("collect")

localeFile:close()