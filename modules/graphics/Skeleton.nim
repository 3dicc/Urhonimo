

import 
  boundingBox, node

var BONECOLLISION_NONE* {.importc: "BONECOLLISION_NONE", header: "Skeleton.h".}: cuint = 0x00000000

var BONECOLLISION_SPHERE* {.importc: "BONECOLLISION_SPHERE", 
                            header: "Skeleton.h".}: cuint = 0x00000001

var BONECOLLISION_BOX* {.importc: "BONECOLLISION_BOX", header: "Skeleton.h".}: cuint = 0x00000002

discard "forward decl of Deserializer"
discard "forward decl of ResourceCache"
discard "forward decl of Serializer"
type 
  Bone* {.importc: "Urho3D::Bone", header: "Skeleton.h".} = object 
    name* {.importc: "name_".}: UrString
    nameHash* {.importc: "nameHash_".}: StringHash
    parentIndex* {.importc: "parentIndex_".}: cuint
    initialPosition* {.importc: "initialPosition_".}: Vector3
    initialRotation* {.importc: "initialRotation_".}: Quaternion
    initialScale* {.importc: "initialScale_".}: Vector3
    offsetMatrix* {.importc: "offsetMatrix_".}: Matrix3x4
    animated* {.importc: "animated_".}: bool
    collisionMask* {.importc: "collisionMask_".}: cuchar
    radius* {.importc: "radius_".}: cfloat
    boundingBox* {.importc: "boundingBox_".}: BoundingBox
    node* {.importc: "node_".}: WeakPtr[Node]


proc constructBone*(): Bone {.importcpp: "Urho3D::Bone(@)", header: "Skeleton.h".}

type 
  Skeleton* {.importc: "Urho3D::Skeleton", header: "Skeleton.h".} = object 
    bones* {.importc: "bones_".}: Vector[Bone]
    rootBoneIndex* {.importc: "rootBoneIndex_".}: cuint


proc constructSkeleton*(): Skeleton {.importcpp: "Urho3D::Skeleton(@)", 
                                      header: "Skeleton.h".}
proc destroySkeleton*(this: var Skeleton) {.importcpp: "#.~Skeleton()", 
    header: "Skeleton.h".}
proc load*(this: var Skeleton; source: var Deserializer): bool {.
    importcpp: "Load", header: "Skeleton.h".}
proc save*(this: Skeleton; dest: var Serializer): bool {.noSideEffect, 
    importcpp: "Save", header: "Skeleton.h".}
proc define*(this: var Skeleton; src: Skeleton) {.importcpp: "Define", 
    header: "Skeleton.h".}
proc setRootBoneIndex*(this: var Skeleton; index: cuint) {.
    importcpp: "SetRootBoneIndex", header: "Skeleton.h".}
proc clearBones*(this: var Skeleton) {.importcpp: "ClearBones", 
                                       header: "Skeleton.h".}
proc reset*(this: var Skeleton) {.importcpp: "Reset", header: "Skeleton.h".}
proc getBones*(this: Skeleton): Vector[Bone] {.noSideEffect, 
    importcpp: "GetBones", header: "Skeleton.h".}
proc getModifiableBones*(this: var Skeleton): var Vector[Bone] {.
    importcpp: "GetModifiableBones", header: "Skeleton.h".}
proc getNumBones*(this: Skeleton): cuint {.noSideEffect, 
    importcpp: "GetNumBones", header: "Skeleton.h".}
proc getRootBone*(this: var Skeleton): ptr Bone {.importcpp: "GetRootBone", 
    header: "Skeleton.h".}
proc getBone*(this: var Skeleton; index: cuint): ptr Bone {.
    importcpp: "GetBone", header: "Skeleton.h".}
proc getBone*(this: var Skeleton; boneName: UrString): ptr Bone {.
    importcpp: "GetBone", header: "Skeleton.h".}
proc getBone*(this: var Skeleton; boneName: cstring): ptr Bone {.
    importcpp: "GetBone", header: "Skeleton.h".}
proc getBone*(this: var Skeleton; boneNameHash: StringHash): ptr Bone {.
    importcpp: "GetBone", header: "Skeleton.h".}
proc resetSilent*(this: var Skeleton) {.importcpp: "ResetSilent", 
                                        header: "Skeleton.h".}