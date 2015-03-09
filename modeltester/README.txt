This is the modeltester application which is meant for quick testing of 3D
models (both static and animated) in the Urho3D engine. Instead of fiddling
in the Urho3D Editor this application fires up a model very quickly and there
are keys to do zooming, rotation, navigation around it and more.

Build it:

	nim cpp modeltester.nim

Run it:

	./modeltester --help

...to get info on command syntax and what keys you can use.

The samba directory is just a sample model to show it works:

	./run.sh samba

...or manually:

	cd samba
	../modeltester *.mdl *.txt *.ani
