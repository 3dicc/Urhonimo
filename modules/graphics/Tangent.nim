

import 
  urho3D


proc generateTangents*(vertexData: pointer; vertexSize: cuint; 
                       indexData: pointer; indexSize: cuint; indexStart: cuint; 
                       indexCount: cuint; normalOffset: cuint; 
                       texCoordOffset: cuint; tangentOffset: cuint) {.
    importcpp: "Urho3D::GenerateTangents(@)", header: "Tangent.h".}