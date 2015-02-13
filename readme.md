# Welcome to the Nim wrapper of Urho3D!

This is a Nim wrapper of the full Urho3D game engine. It has been built using
c2nim in a largely automated fashion, and its currently built against version
1.32 of Urho3D. You also need the latest Nim devel as of this time.

To run the examples, you need to compile Urho3D via cmake. Read Urho's instructions
for how to do that, its not hard. Then copy the resulting ``libUrho3D.a`` or ``urho3D.dll``
into ``lib/``.


Then type:

```
$ cd examples
$ nim cpp character.nim
```
...or any other example like hello.nim.

Note that ``nim c`` does NOT work and produces strange errors. You need to do
``nim cpp``.

To run the resulting binary you need the CoreData and Data directories from
Urho3D, just copy or link from your Urho3D directory into examples directory.

Then you should be able to run ``hello`` and ``character``, and it should
work on Windows, Linux and OSX.

Happy hacking!
