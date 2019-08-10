set backtrace past-main on
set history save on
set history size 1000000
set history filename ~/.gdb_history
set listsize 20
set print array on
set print array-indexes on
set print asm-demangle on
set print demangle on
set print inferior-events on
set print object on
set print pretty on
set print symbol-filename on
set print vtbl on
set python print-stack full
python
def prompt_hook(current_prompt):
	import shutil
	tui_enabled = shutil.get_terminal_size().lines != gdb.parameter('height')

	thread = gdb.selected_thread()
	frame = gdb.selected_frame() if thread else None
	return gdb.prompt.substitute_prompt(
			'{}(gdb{}{}){} '.format(
				 '\[\e[1m\]' if not tui_enabled else '',
				'@' + str(thread.ptid[1]) if thread else '',
				': ' + frame.name()[-min(40, len(frame.name())):] if frame and frame.name() else '',
				 '\[\e[0m\]' if not tui_enabled else ''
			)
		)
gdb.prompt_hook = prompt_hook
end
