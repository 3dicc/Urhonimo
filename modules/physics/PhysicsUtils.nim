

import 
  quaternion, vector3

proc toBtVector3*(vector: Vector3): BtVector3 {.inline.}
proc toBtQuaternion*(quaternion: Quaternion): BtQuaternion {.inline.}
proc toVector3*(vector: BtVector3): Vector3 {.inline.}
proc toQuaternion*(quaternion: BtQuaternion): Quaternion {.inline.}
proc hasWorldScaleChanged*(oldWorldScale: Vector3; newWorldScale: Vector3): bool {.
    inline.}