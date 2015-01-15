

import 
  drawable, list, mutex, octreeQuery

discard "forward decl of Octree"
var NUM_OCTANTS* {.importc: "NUM_OCTANTS", header: "Octree.h".}: cint = 8

var ROOT_INDEX* {.importc: "ROOT_INDEX", header: "Octree.h".}: cuint = m_Max_Unsigned


type 
  Octant* {.importc: "Urho3D::Octant", header: "Octree.h".} = object 
    worldBoundingBox* {.importc: "worldBoundingBox_".}: BoundingBox
    cullingBox* {.importc: "cullingBox_".}: BoundingBox
    drawables* {.importc: "drawables_".}: PODVector[ptr Drawable]
    children* {.importc: "children_".}: array[num_Octants, ptr Octant]
    center* {.importc: "center_".}: Vector3
    halfSize* {.importc: "halfSize_".}: Vector3
    level* {.importc: "level_".}: cuint
    numDrawables* {.importc: "numDrawables_".}: cuint
    parent* {.importc: "parent_".}: ptr Octant
    root* {.importc: "root_".}: ptr Octree
    index* {.importc: "index_".}: cuint


proc constructOctant*(box: BoundingBox; level: cuint; parent: ptr Octant; 
                      root: ptr Octree; index: cuint = root_Index): Octant {.
    importcpp: "Urho3D::Octant(@)", header: "Octree.h".}
proc destroyOctant*(this: var Octant) {.importcpp: "#.~Octant()", 
                                        header: "Octree.h".}
proc getOrCreateChild*(this: var Octant; index: cuint): ptr Octant {.
    importcpp: "GetOrCreateChild", header: "Octree.h".}
proc deleteChild*(this: var Octant; index: cuint) {.importcpp: "DeleteChild", 
    header: "Octree.h".}
proc insertDrawable*(this: var Octant; drawable: ptr Drawable) {.
    importcpp: "InsertDrawable", header: "Octree.h".}
proc checkDrawableFit*(this: Octant; box: BoundingBox): bool {.noSideEffect, 
    importcpp: "CheckDrawableFit", header: "Octree.h".}
proc addDrawable*(this: var Octant; drawable: ptr Drawable) {.
    importcpp: "AddDrawable", header: "Octree.h".}
proc removeDrawable*(this: var Octant; drawable: ptr Drawable; 
                     resetOctant: bool = true) {.importcpp: "RemoveDrawable", 
    header: "Octree.h".}
proc getWorldBoundingBox*(this: Octant): BoundingBox {.noSideEffect, 
    importcpp: "GetWorldBoundingBox", header: "Octree.h".}
proc getCullingBox*(this: Octant): BoundingBox {.noSideEffect, 
    importcpp: "GetCullingBox", header: "Octree.h".}
proc getLevel*(this: Octant): cuint {.noSideEffect, importcpp: "GetLevel", 
                                      header: "Octree.h".}
proc getParent*(this: Octant): ptr Octant {.noSideEffect, 
    importcpp: "GetParent", header: "Octree.h".}
proc getRoot*(this: Octant): ptr Octree {.noSideEffect, importcpp: "GetRoot", 
    header: "Octree.h".}
proc getNumDrawables*(this: Octant): cuint {.noSideEffect, 
    importcpp: "GetNumDrawables", header: "Octree.h".}
proc isEmpty*(this: var Octant): bool {.importcpp: "IsEmpty", header: "Octree.h".}
proc resetRoot*(this: var Octant) {.importcpp: "ResetRoot", header: "Octree.h".}
proc drawDebugGeometry*(this: var Octant; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Octree.h".}

type 
  Octree* {.importc: "Urho3D::Octree", header: "Octree.h".} = object of Component
    drawableUpdates* {.importc: "drawableUpdates_".}: PODVector[ptr Drawable]
    drawableReinsertions* {.importc: "drawableReinsertions_".}: PODVector[
        ptr Drawable]
    octreeMutex* {.importc: "octreeMutex_".}: Mutex
    rayQuery* {.importc: "rayQuery_".}: ptr RayOctreeQuery
    rayQueryDrawables* {.importc: "rayQueryDrawables_".}: PODVector[ptr Drawable]
    rayQueryResults* {.importc: "rayQueryResults_".}: Vector[
        PODVector[RayQueryResult]]
    numLevels* {.importc: "numLevels_".}: cuint


proc getType*(this: Octree): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetType", header: "Octree.h".}
proc getBaseType*(this: Octree): Urho3D.StringHash {.noSideEffect, 
    importcpp: "GetBaseType", header: "Octree.h".}
proc getTypeName*(this: Octree): Urho3D.UrString {.noSideEffect, 
    importcpp: "GetTypeName", header: "Octree.h".}
proc getTypeStatic*(): Urho3D.StringHash {.
    importcpp: "Urho3D::Octree::GetTypeStatic(@)", header: "Octree.h".}
proc getTypeNameStatic*(): Urho3D.UrString {.
    importcpp: "Urho3D::Octree::GetTypeNameStatic(@)", header: "Octree.h".}
proc constructOctree*(context: ptr Context): Octree {.
    importcpp: "Urho3D::Octree(@)", header: "Octree.h".}
proc destroyOctree*(this: var Octree) {.importcpp: "#.~Octree()", 
                                        header: "Octree.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::Octree::RegisterObject(@)", header: "Octree.h".}
proc onSetAttribute*(this: var Octree; attr: AttributeInfo; src: Variant) {.
    importcpp: "OnSetAttribute", header: "Octree.h".}
proc drawDebugGeometry*(this: var Octree; debug: ptr DebugRenderer; 
                        depthTest: bool) {.importcpp: "DrawDebugGeometry", 
    header: "Octree.h".}
proc setSize*(this: var Octree; box: BoundingBox; numLevels: cuint) {.
    importcpp: "SetSize", header: "Octree.h".}
proc update*(this: var Octree; frame: FrameInfo) {.importcpp: "Update", 
    header: "Octree.h".}
proc addManualDrawable*(this: var Octree; drawable: ptr Drawable) {.
    importcpp: "AddManualDrawable", header: "Octree.h".}
proc removeManualDrawable*(this: var Octree; drawable: ptr Drawable) {.
    importcpp: "RemoveManualDrawable", header: "Octree.h".}
proc getDrawables*(this: Octree; query: var OctreeQuery) {.noSideEffect, 
    importcpp: "GetDrawables", header: "Octree.h".}
proc raycast*(this: Octree; query: var RayOctreeQuery) {.noSideEffect, 
    importcpp: "Raycast", header: "Octree.h".}
proc raycastSingle*(this: Octree; query: var RayOctreeQuery) {.noSideEffect, 
    importcpp: "RaycastSingle", header: "Octree.h".}
proc getNumLevels*(this: Octree): cuint {.noSideEffect, 
    importcpp: "GetNumLevels", header: "Octree.h".}
proc queueUpdate*(this: var Octree; drawable: ptr Drawable) {.
    importcpp: "QueueUpdate", header: "Octree.h".}
proc cancelUpdate*(this: var Octree; drawable: ptr Drawable) {.
    importcpp: "CancelUpdate", header: "Octree.h".}
proc drawDebugGeometry*(this: var Octree; depthTest: bool) {.
    importcpp: "DrawDebugGeometry", header: "Octree.h".}