var originX = argument0
var originY = argument1
var txt = argument2
var tutorialSep = 4
var textOutline = 1
var magicOffsetY = -9
originY += magicOffsetY
var cachedTutWidth = string_width(txt) + 2 * (tutorialSep + sprite_get_width(sprHUDRect9Slice) + textOutline)
var cachedTutHeight = string_height(txt) + global.ui_text_offset + 2 * (sprite_get_height(sprHUDRect9Slice) + textOutline)
draw_hudrect_9slice((originX - cachedTutWidth / 2), (originY - cachedTutHeight), cachedTutWidth, cachedTutHeight)
var offsetY = originY - cachedTutHeight + sprite_get_height(sprHUDRect9Slice) + textOutline + global.ui_text_offset
draw_text_outline(originX, offsetY, txt)
