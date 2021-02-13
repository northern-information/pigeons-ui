graphics = {}

function graphics.init()
  screen.aa(0)
  screen.font_face(0)
  screen.font_size(8)
  graphics.fps = 30
  graphics.frame = 0
end

function graphics:draw_cards(cards)
  for k, card in pairs(cards) do
    self:draw_card(card)
  end
end

function graphics:draw_card(card)
  -- this card
  local x = card.x + plane:get_x_offset()
  local y = card.y + plane:get_y_offset()

  -- all cards
  local w = 40
  local h = 48
  self:rect(x, y, w, h, 15)
  -- n/w corner
  self:mlrs(x + 0, y, 1, 4, 0)
  self:mlrs(x + 1, y, 1, 3, 0)
  self:mlrs(x + 2, y, 1, 2, 0)
  self:mlrs(x + 3, y, 1, 1, 0)
  -- n/e corner
  self:mlrs(w + x - 1, y, 1, 4, 0)
  self:mlrs(w + x - 2, y, 1, 3, 0)
  self:mlrs(w + x - 3, y, 1, 2, 0)
  self:mlrs(w + x - 4, y, 1, 1, 0)
  -- s/w corner
  self:mlrs(x + 0, h + y - 4, 1, 4, 0)
  self:mlrs(x + 1, h + y - 3, 1, 3, 0)
  self:mlrs(x + 2, h + y - 2, 1, 2, 0)
  self:mlrs(x + 3, h + y - 1, 1, 3, 0)
  -- s/e corner
  self:mlrs(w + x - 1, h + y - 4, 1, 4, 0)
  self:mlrs(w + x - 2, h + y - 3, 1, 3, 0)
  self:mlrs(w + x - 3, h + y - 2, 1, 2, 0)
  self:mlrs(w + x - 4, h + y - 1, 1, 3, 0)
  -- bevel
  self:mlrs(w + x - 3, y + 4, 1, 40, 5)
  self:mlrs(w + x - 2, y + 5, 1, 38, 5)
  self:mlrs(w + x - 4, h + y - 5, 2, 1, 5)
  self:mlrs(w + x - 5, h + y - 4, 2, 1, 5)
  self:mlrs(x + 4, h + y - 3, 32, 1, 5)
  self:mlrs(x + 5, h + y - 2, 30, 1, 5)
  -- title
  self:text(x + 3, y + 8, card:get_title(), 0)
end

-- start ni graphics library

function graphics.redraw_clock()
  while true do
    if fn.dirty_screen() then
      redraw()
      fn.dirty_screen(false)
    end
    clock.sleep(1 / graphics.fps)
  end
end

function graphics:setup()
  screen.clear()
end

function graphics:teardown()
  screen.update()
end

function graphics:mlrs(x1, y1, x2, y2, l)
  screen.level(l or 15)
  screen.move(x1, y1)
  screen.line_rel(x2, y2)
  screen.stroke()
end

function graphics:mls(x1, y1, x2, y2, l)
  screen.level(l or 15)
  screen.move(x1, y1)
  screen.line(x2, y2)
  screen.stroke()
end

function graphics:rect(x, y, w, h, l)
  screen.level(l or 15)
  screen.rect(x, y, w, h)
  screen.fill()
end

function graphics:circle(x, y, r, l)
  screen.level(l or 15)
  screen.circle(x, y, r)
  screen.fill()
end

function graphics:text(x, y, s, l)
  screen.level(l or 15)
  screen.move(x, y)
  screen.text(s)
end

function graphics:text_right(x, y, s, l)
  screen.level(l or 15)
  screen.move(x, y)
  screen.text_right(s)
end

function graphics:text_center(x, y, s, l)
  screen.level(l or 15)
  screen.move(x, y)
  screen.text_center(s)
end

-- end ni graphics library

return graphics