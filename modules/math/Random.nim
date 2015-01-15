

import 
  urho3D


proc setRandomSeed*(seed: cuint) {.importcpp: "Urho3D::SetRandomSeed(@)", 
                                   header: "Random.h".}

proc getRandomSeed*(): cuint {.importcpp: "Urho3D::GetRandomSeed(@)", 
                               header: "Random.h".}

proc rand*(): cint {.importcpp: "Urho3D::Rand(@)", header: "Random.h".}

proc randStandardNormal*(): cfloat {.importcpp: "Urho3D::RandStandardNormal(@)", 
                                     header: "Random.h".}