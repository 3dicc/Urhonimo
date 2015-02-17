import urhomain, ui, stringHash, variant, component, uielement,
  resourcecache, inputevents, context, engine, xmlelement, console, debughud

import hashmap except Node

# enable auto-deref:
{.experimental.}

# Call this from main
proc createConsole*() =
  var cache = urhomain.getSubsystemResourceCache()
  let xmlFile = getResource[XMLFile](cache, "UI/DefaultStyle.xml")
  let console = getEngine().createConsole()
  console.setCommandInterpreter("MainApplication")
  console.setDefaultStyle(xmlFile)
  console.getBackground().setOpacity(0.8f32)
  # Create debug HUD.
  let debugHud = getEngine().createDebugHud()
  debugHud.setDefaultStyle(xmlFile)

# A handler the sample should either call or set up a subscribtion for
proc handleConsole*(userData: pointer; eventType: StringHash;
                      eventData: var VariantMap) {.cdecl.} =
  let key = eventData["Key"].getInt()
  if key == KEY_ESC:
    let console = getSubsystem[Console]()
    if console.isVisible():
      console.setVisible(false)
    else:
      closeUrho3D()
  elif key == KEY_F1:
    getSubsystem[Console]().toggle()
  elif key == KEY_F2:
    getSubsystem[DebugHud]().toggleAll()
