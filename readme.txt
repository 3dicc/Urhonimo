To run the demo, you need to compile Urho3D via cmake. Read Urho's instructions
for how to do that. Then copy the resulting ``libUrho3D.a`` or ``urho3D.dll``
into ``lib/``.


Then type::

  cd examples
  nim cpp --threads:on character.nim

On Windows ``--threads:on`` is not required. On Linux ``--threads:on`` is
required so that it links with pthreads support which is what Urho3D requires.

Note that ``nim c`` does NOT work and produces strange errors. You need to do
``nim cpp``.
