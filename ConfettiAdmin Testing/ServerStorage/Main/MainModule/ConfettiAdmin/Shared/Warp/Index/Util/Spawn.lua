-- @ScriptType: ModuleScript
--!native
--!strict
--!optimize 2
local thread: thread? = nil

local function passer(fn, ...): ()
	local hold = thread
	thread = nil
	if type(fn) == "function" then
		fn(...)
	end
	thread = hold
end

local function yield(): never
	while true do
		passer(coroutine.yield())
	end
end

if not thread then
	thread = coroutine.create(yield)
	coroutine.resume(thread :: any, thread)
end

return function(fn: (...any) -> (...any?), ...: any): ()
	if not thread then
		thread = coroutine.create(yield)
		coroutine.resume(thread :: any, thread)
	end
	task.spawn(thread :: thread, fn, ...)
end