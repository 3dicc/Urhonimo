Here are the original C++ headers from Urho3D. Some of these had to be modified
for ``c2nim`` but a simple diff against the original Urho3D headers shows the
modifications. Then I used ``nim c -r convert.nim`` to generate a .nim module
for every header file. These .nim modules then had to be modified again and the
results are in the modules/ subdirectory. Again a simple diff shows the
differences. In the future we can automate more of this process.

Andreas Rumpf
