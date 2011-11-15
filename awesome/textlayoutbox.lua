---------------------------------------------------------------------------
-- @author Julien Danjou &lt;julien@danjou.info&gt;
-- @copyright 2009 Julien Danjou
-- @release v3.4.10
---------------------------------------------------------------------------

local setmetatable = setmetatable
local ipairs = ipairs
local button = require("awful.button")
local layout = require("awful.layout")
local tag = require("awful.tag")
local beautiful = require("beautiful")
local capi = { text = text,
               screen = screen,
               widget = widget }

--- Layoutbox widget.
module("textlayoutbox")

local function update(w, screen)
    local layout = layout.getname(layout.get(screen))
    local names =
    {
      ["floating"]    = "f",
      ["tile"]        = "r",
      ["tileleft"]    = "l",
      ["tilebottom"]  = "b",
      ["tiletop"]     = "t",
      ["fairv"]       = "#",
      ["fairh"]       = "%",
      ["spiral"]      = "G",
      ["dwindle"]     = "D",
      ["max"]         = "+",
      ["fullscreen"]  = "F",
      ["magnifier"]   = "M"
    }
    if layout and beautiful["layout_" ..layout] then
        w.text = " [" .. names[layout] .. "] "
    else
        w.text = " [?] "
    end
end

--- Create a textlayoutbox widget. It draws a text with the current layout
-- name of the current tag.
-- @param screen The screen number that the layout will be represented for.
-- @param args Standard arguments for an textbox widget.
-- @return An textbox widget configured as a layoutbox.
function new(screen, args)
    local screen = screen or 1
    local args = args or {}
    args.type = "textbox"
    local w = capi.widget(args)
    update(w, screen)

    local function update_on_tag_selection(tag)
        return update(w, tag.screen)
    end

    tag.attached_add_signal(screen, "property::selected", update_on_tag_selection)
    tag.attached_add_signal(screen, "property::layout", update_on_tag_selection)

    return w
end

setmetatable(_M, { __call = function(_, ...) return new(...) end })

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
