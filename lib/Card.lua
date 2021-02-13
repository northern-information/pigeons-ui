local Card = {}

function Card:new(title, x, y)
  local c = setmetatable({}, {
    __index = Card
  })
  c.id = fn.id("card")
  c.title = "CARD " .. title
  c.x = x
  c.y = y
  c.selected = false
  return c
end

function Card:is_selected()
  return self.selected
end

function Card:deselect()
  self.selected = false
end

function Card:select()
  self.selected = true
end

function Card:get_title()
  return self.title
end

return Card