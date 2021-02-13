include("lib/includes")

function init()
  fn.init()
  graphics.init()
  plane.init()
  p = {}
  p.redraw_clock_id = clock.run(graphics.redraw_clock)
  p.screen_dirty = true
end

function redraw()
  if not fn.dirty_screen() then return end
  plane:render()
  fn.dirty_screen(false)
end

function key(n, z)
  if z == 0 then return end
  fn.dirty_screen(true)
end

function enc(e, d)
  if e == 1 then
    print("e1", d)
  elseif e == 2 then
    plane:scroll_x(d)
  elseif e == 3 then
    plane:scroll_y(d)
  end
  fn.dirty_screen(true)
end