local fn = {}

function fn.init()
  fn.id_prefix = "pigeons-"
  fn.id_counter = 1000
end

function fn.id(prefix)
  fn.id_counter = fn.id_counter + 1
  return fn.id_prefix .. prefix .. "-".. os.time(os.date("!*t")) .. "-" .. fn.id_counter
end

function fn.dirty_screen(bool)
  if bool == nil then return p.screen_dirty end
  p.screen_dirty = bool
  return p.screen_dirty
end



function rerun()
  norns.script.load(norns.state.script)
end

function r()
  rerun()
end

return fn