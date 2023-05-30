#!/usr/bin/env python

from i3ipc import Connection, Event

i3 = Connection()

prev_workspace = "4"
cur_workspace = "4"

def workspace_track(self, e):
    if e.current:
        global cur_workspace
        global prev_workspace
        prev_workspace = cur_workspace
        cur_workspace = e.current.name

def undo_event(self, e):
    if e.binding.event_state_mask[0] == "Mod4" and e.binding.symbol == "z":
        i3.command('workspace number "%s"' % prev_workspace)

i3.on(Event.WORKSPACE_FOCUS, workspace_track)
i3.on(Event.BINDING, undo_event)
i3.main()
