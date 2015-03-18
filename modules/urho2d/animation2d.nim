

import
  `ptr`, refCounted, vector2

discard "forward decl of AnimationSet2D"
discard "forward decl of Sprite2D"
type
  ObjectType2D* {.importcpp: "Urho3D::ObjectType2D".} = enum
    OT_BONE = 0, OT_SPRITE



type
  Reference2D* {.importcpp: "Urho3D::Reference2D", header: "Animation2D.h".} = object
    `type`* {.importc: "type_".}: ObjectType2D
    timeline* {.importc: "timeline_".}: cint
    zIndex* {.importc: "zIndex_".}: cint


proc constructReference2D*(): Reference2D {.importcpp: "Urho3D::Reference2D(@)",
    header: "Animation2D.h", constructor.}

type
  MainlineKey2D* {.importcpp: "Urho3D::MainlineKey2D", header: "Animation2D.h".} = object
    time* {.importc: "time_".}: cfloat
    references* {.importc: "references_".}: Vector[Reference2D]


proc constructMainlineKey2D*(): MainlineKey2D {.constructor,
    importcpp: "Urho3D::MainlineKey2D(@)", header: "Animation2D.h".}
proc getReference*(this: MainlineKey2D; timeline: cint): ptr Reference2D {.
    noSideEffect, importcpp: "GetReference", header: "Animation2D.h".}

type
  Transform2D* {.importcpp: "Urho3D::Transform2D", header: "Animation2D.h".} = object
    position* {.importc: "position_".}: Vector2
    angle* {.importc: "angle_".}: cfloat
    scale* {.importc: "scale_".}: Vector2


proc constructTransform2D*(): Transform2D {.importcpp: "Urho3D::Transform2D(@)",
    header: "Animation2D.h", constructor.}
proc constructTransform2D*(position: Vector2; angle: cfloat; scale: Vector2): Transform2D {.
    importcpp: "Urho3D::Transform2D(@)", header: "Animation2D.h", constructor.}
proc constructTransform2D*(other: Transform2D): Transform2D {.
    constructor, importcpp: "Urho3D::Transform2D(@)", header: "Animation2D.h".}
proc `*`*(this: Transform2D; other: Transform2D): Transform2D {.noSideEffect,
    importcpp: "# * #", header: "Animation2D.h".}
proc lerp*(this: Transform2D; other: Transform2D; t: cfloat; spin: cint): Transform2D {.
    noSideEffect, importcpp: "Lerp", header: "Animation2D.h".}

type
  TimelineKey2D* {.importcpp: "Urho3D::TimelineKey2D", header: "Animation2D.h".} = object
    time* {.importc: "time_".}: cfloat
    spin* {.importc: "spin_".}: cint
    transform* {.importc: "transform_".}: Transform2D
    sprite* {.importc: "sprite_".}: SharedPtr[Sprite2D]
    hotSpot* {.importc: "hotSpot_".}: Vector2
    alpha* {.importc: "alpha_".}: cfloat


proc constructTimelineKey2D*(): TimelineKey2D {.constructor,
    importcpp: "Urho3D::TimelineKey2D(@)", header: "Animation2D.h".}

type
  Timeline2D* {.importcpp: "Urho3D::Timeline2D", header: "Animation2D.h".} = object
    name* {.importc: "name_".}: UrString
    parent* {.importc: "parent_".}: cint
    `type`* {.importc: "type_".}: ObjectType2D
    timelineKeys* {.importc: "timelineKeys_".}: Vector[TimelineKey2D]


proc constructTimeline2D*(): Timeline2D {.importcpp: "Urho3D::Timeline2D(@)",
    header: "Animation2D.h", constructor.}

type
  Animation2D* {.importcpp: "Urho3D::Animation2D", header: "Animation2D.h".} = object of RefCounted
    animationSet* {.importc: "animationSet_".}: WeakPtr[AnimationSet2D]
    name* {.importc: "name_".}: UrString
    length* {.importc: "length_".}: cfloat
    looped* {.importc: "looped_".}: bool
    mainlineKeys* {.importc: "mainlineKeys_".}: Vector[MainlineKey2D]
    timelines* {.importc: "timelines_".}: Vector[Timeline2D]


proc constructAnimation2D*(animationSet: ptr AnimationSet2D): Animation2D {.
    importcpp: "Urho3D::Animation2D(@)", header: "Animation2D.h", constructor.}
proc destroyAnimation2D*(this: var Animation2D) {.importcpp: "#.~Animation2D()",
    header: "Animation2D.h".}
proc setName*(this: var Animation2D; name: UrString) {.importcpp: "SetName",
    header: "Animation2D.h".}
proc setLength*(this: var Animation2D; length: cfloat) {.importcpp: "SetLength",
    header: "Animation2D.h".}
proc setLooped*(this: var Animation2D; looped: bool) {.importcpp: "SetLooped",
    header: "Animation2D.h".}
proc addMainlineKey*(this: var Animation2D; mainlineKey: MainlineKey2D) {.
    importcpp: "AddMainlineKey", header: "Animation2D.h".}
proc addTimeline*(this: var Animation2D; timeline: Timeline2D) {.
    importcpp: "AddTimeline", header: "Animation2D.h".}
proc setTimelineParent*(this: var Animation2D; timeline: cint;
                        timelineParent: cint) {.importcpp: "SetTimelineParent",
    header: "Animation2D.h".}
proc getAnimationSet*(this: Animation2D): ptr AnimationSet2D {.noSideEffect,
    importcpp: "GetAnimationSet", header: "Animation2D.h".}
proc getName*(this: Animation2D): UrString {.noSideEffect, importcpp: "GetName",
    header: "Animation2D.h".}
proc getLength*(this: Animation2D): cfloat {.noSideEffect,
    importcpp: "GetLength", header: "Animation2D.h".}
proc isLooped*(this: Animation2D): bool {.noSideEffect, importcpp: "IsLooped",
    header: "Animation2D.h".}
proc getMainlineKeys*(this: Animation2D): Vector[MainlineKey2D] {.noSideEffect,
    importcpp: "GetMainlineKeys", header: "Animation2D.h".}
proc getNumTimelines*(this: Animation2D): cuint {.noSideEffect,
    importcpp: "GetNumTimelines", header: "Animation2D.h".}
proc getTimeline*(this: Animation2D; index: cuint): Timeline2D {.noSideEffect,
    importcpp: "GetTimeline", header: "Animation2D.h".}
