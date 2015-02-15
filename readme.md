# Welcome to the Nim wrapper of Urho3D!

This is a Nim wrapper of the full Urho3D game engine. It has been built using
c2nim in a largely automated fashion, and its currently built against version
1.32 of Urho3D. Its verified to work on Linux, OSX and Windows.

To use it you need:

1. Nim compiler version 0.10.3 or later.
2. Urho3D version 1.32 (exactly) compiled as a library for your platform.
3. A bit of patience.

## Install Nim

To get Nim version 0.10.3 (which is current devel, not released yet) you have to
follow the bootstrap instructions at the bottom of [the download page](http://nim-lang.org/download.html)
and replace ``-b master`` with ``-b devel`` for **both** clone commands.

When that is done, just put bin/nim in your PATH either by adding the bin directory to
your path or making a softlink to the nim compiler. Nim will then find everything it needs
relative to its own position.

If all works out running ``nim --version`` should show 0.10.3.

## Install Urho3D

To compile Urho3D for your platform we refer to [Urho3D build documentation](http://urho3d.github.io/documentation/1.32/_building.html)
which is very specific and not that hard to perform. On Linux and OSX ``cmake_gcc.sh`` works fine, your mileage may vary.

When Urho3D is built (no need to install it) you will find the library - ``libUrho3D.a`` or ``urho3D.dll`` - in the ``Lib`` directory.
Copy it into the ``lib`` directory here in Urhonimo.

## Compiling and running examples

To compile an example, go into the examples directory and compile like this:

```
$ cd examples
$ nim cpp character.nim
```
...or any other example like hello.nim.

Note that ``nim c`` (compiling by generating C) does NOT work and produces strange errors. You need to compile via C++ using ``nim cpp``.

To run the resulting binary you need the ``CoreData`` and ``Data`` directories from
Urho3D, just copy or link from your Urho3D directory into the examples directory.

Then you should be able to run ``hello`` and ``character``, and it should work on Windows, Linux and OSX.

Happy hacking!
