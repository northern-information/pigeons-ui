local plane = {}

function plane.init()
  -- plane.width = 10
  -- plane.height = 10
  plane.x = 0 -- total x 
  plane.y = 0 -- total y
  plane.x_offset = 0
  plane.y_offset = 0
  plane.selected_card = 1
  plane.cards = {}
  plane.card_view = {}
  plane.card_view.width = 40
  plane.card_view.height = 48
  plane.card_view.margin = 8
  temp = {}
  temp[1] = -32
  temp[2] = 16
  temp[3] = 64
  temp[4] = 112
  for i = 1, 4 do
    plane:add_card(i, temp[i], 8)
  end
end

-- left off here - need to switch x and y from px to just indices on the plane
function plane:add_card(title, x, y)
  local card = Card:new(title, x, y)
  -- temp assignment
  self.cards[x] = card
  -- for now this is only in the x dimension
  self.x = #self.cards
end

function plane:render()
  graphics:setup()
  graphics:draw_cards(self.cards)
  graphics:teardown()
end

function plane:scroll_x(d)
  self.x_offset = self.x_offset + d
end

function plane:scroll_y(d)
  self.y_offset = self.y_offset + d
end


  -- local selection = util.wrap(plane.x + d, 0, #self:get_cards())
  -- self:set_selected_card(selection)
function plane:set_selected_card(i)
  self.selected_card = i
  self.cards[i]:select()
end

function plane:get_cards()
  return self.cards
end

function plane:get_x_offset()
  return self.x_offset
end

function plane:get_y_offset()
  return self.y_offset
end

return plane