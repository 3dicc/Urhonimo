To run the examples, you need to compile Urho3D via cmake. Read Urho's instructions
for how to do that. Then copy the resulting ``libUrho3D.a`` or ``urho3D.dll``
into ``lib/``.


Then type::

  cd examples
  nim cpp character.nim

...or any other example like hello.nim.

Note that ``nim c`` does NOT work and produces strange errors. You need to do
``nim cpp``.

To run you need CoreData and Data from Urho3D, just copy or link from your
Urho3D directory into examples directory.

