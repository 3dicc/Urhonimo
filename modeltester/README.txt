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

If that works then you could try converting a file of your own. Make a directory to work in:

mkdir mymodel
cd mymodel

Then run AssetImporter (try --help for more options) perhaps like this:

../AssetImporter model /some/path/to/mymodel.fbx mymodel.mdl -t -l

Then you should typically get:

mymodel.mdl
mymodel.txt
mymodel_something.ani
Textures/*.png
Materials/*.xml

The txt file is the material list, its created since we used "-l". modeltester will use it to load the materials.

...and then you can try it:

../modeltester mymodel.mdl mymodel.txt mymode_something.ani

