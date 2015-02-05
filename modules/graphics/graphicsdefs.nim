

import 
  hashBase, stringHash, vector3

type 
  PrimitiveType* {.importcpp: "Urho3D::PrimitiveType".} = enum 
    TRIANGLE_LIST = 0, LINE_LIST, POINT_LIST, TRIANGLE_STRIP, LINE_STRIP, 
    TRIANGLE_FAN



type 
  GeometryType* {.importcpp: "Urho3D::GeometryType".} = enum 
    GEOM_STATIC = 0, GEOM_SKINNED = 1, GEOM_INSTANCED = 2, GEOM_BILLBOARD = 3, 
    GEOM_STATIC_NOINSTANCING = 4

const 
  MAX_GEOMETRYTYPES = GEOM_STATIC_NOINSTANCING


type 
  BlendMode* {.importcpp: "Urho3D::BlendMode".} = enum 
    BLEND_REPLACE = 0, BLEND_ADD, BLEND_MULTIPLY, BLEND_ALPHA, BLEND_ADDALPHA, 
    BLEND_PREMULALPHA, BLEND_INVDESTALPHA, BLEND_SUBTRACT, BLEND_SUBTRACTALPHA, 
    MAX_BLENDMODES



type 
  CompareMode* {.importcpp: "Urho3D::CompareMode".} = enum 
    CMP_ALWAYS = 0, CMP_EQUAL, CMP_NOTEQUAL, CMP_LESS, CMP_LESSEQUAL, 
    CMP_GREATER, CMP_GREATEREQUAL, MAX_COMPAREMODES



type 
  CullMode* {.importcpp: "Urho3D::CullMode".} = enum 
    CULL_NONE = 0, CULL_CCW, CULL_CW, MAX_CULLMODES



type 
  FillMode* {.importcpp: "Urho3D::FillMode".} = enum 
    FILL_SOLID = 0, FILL_WIREFRAME, FILL_POINT



type 
  StencilOp* {.importcpp: "Urho3D::StencilOp".} = enum 
    OP_KEEP = 0, OP_ZERO, OP_REF, OP_INCR, OP_DECR



type 
  LockState* {.importcpp: "Urho3D::LockState".} = enum 
    LOCK_NONE = 0, LOCK_HARDWARE, LOCK_SHADOW, LOCK_SCRATCH



type 
  VertexElement* {.importcpp: "Urho3D::VertexElement".} = enum 
    ELEMENT_POSITION = 0, ELEMENT_NORMAL, ELEMENT_COLOR, ELEMENT_TEXCOORD1, 
    ELEMENT_TEXCOORD2, ELEMENT_CUBETEXCOORD1, ELEMENT_CUBETEXCOORD2, 
    ELEMENT_TANGENT, ELEMENT_BLENDWEIGHTS, ELEMENT_BLENDINDICES, 
    ELEMENT_INSTANCEMATRIX1, ELEMENT_INSTANCEMATRIX2, ELEMENT_INSTANCEMATRIX3, 
    MAX_VERTEX_ELEMENTS



type 
  TextureFilterMode* {.importcpp: "Urho3D::TextureFilterMode".} = enum 
    FILTER_NEAREST = 0, FILTER_BILINEAR, FILTER_TRILINEAR, FILTER_ANISOTROPIC, 
    FILTER_DEFAULT, MAX_FILTERMODES



type 
  TextureAddressMode* {.importcpp: "Urho3D::TextureAddressMode".} = enum 
    ADDRESS_WRAP = 0, ADDRESS_MIRROR, ADDRESS_CLAMP, ADDRESS_BORDER, 
    MAX_ADDRESSMODES



type 
  TextureCoordinate* {.importcpp: "Urho3D::TextureCoordinate".} = enum 
    COORD_U = 0, COORD_V, COORD_W, MAX_COORDS



type 
  TextureUsage* {.importcpp: "Urho3D::TextureUsage".} = enum 
    TEXTURE_STATIC = 0, TEXTURE_DYNAMIC, TEXTURE_RENDERTARGET, 
    TEXTURE_DEPTHSTENCIL



type 
  CubeMapFace* {.importcpp: "Urho3D::CubeMapFace".} = enum 
    FACE_POSITIVE_X = 0, FACE_NEGATIVE_X, FACE_POSITIVE_Y, FACE_NEGATIVE_Y, 
    FACE_POSITIVE_Z, FACE_NEGATIVE_Z, MAX_CUBEMAP_FACES



type 
  CubeMapLayout* {.importcpp: "Urho3D::CubeMapLayout".} = enum 
    CML_HORIZONTAL = 0, CML_HORIZONTALNVIDIA, CML_HORIZONTALCROSS, 
    CML_VERTICALCROSS, CML_BLENDER



type 
  RenderSurfaceUpdateMode* {.importcpp: "Urho3D::RenderSurfaceUpdateMode".} = enum 
    SURFACE_MANUALUPDATE = 0, SURFACE_UPDATEVISIBLE, SURFACE_UPDATEALWAYS



type 
  ShaderType* {.importcpp: "Urho3D::ShaderType".} = enum 
    VS = 0, PS



type 
  ShaderParameterGroup* {.importcpp: "Urho3D::ShaderParameterGroup".} = enum 
    SP_FRAME = 0, SP_CAMERA, SP_VIEWPORT, SP_ZONE, SP_LIGHT, SP_VERTEXLIGHTS, 
    SP_MATERIAL, SP_OBJECTTRANSFORM, MAX_SHADER_PARAMETER_GROUPS



type 
  TextureUnit* {.importcpp: "Urho3D::TextureUnit".} = enum 
    TU_DIFFUSE = 0, TU_NORMAL = 1, TU_SPECULAR = 2, TU_EMISSIVE = 3, 
    TU_ENVIRONMENT = 4, MAX_MATERIAL_TEXTURE_UNITS = 5, TU_LIGHTSHAPE = 6, 
    TU_SHADOWMAP = 7, TU_FACESELECT = 8, TU_INDIRECTION = 9, 
    TU_DEPTHBUFFER = 10, TU_LIGHTBUFFER = 11, TU_VOLUMEMAP = 12, TU_ZONE = 13, 
    MAX_TEXTURE_UNITS = 14

const 
  TU_ALBEDOBUFFER = TU_DIFFUSE
  TU_NORMALBUFFER = TU_NORMAL
  TU_LIGHTRAMP = MAX_MATERIAL_TEXTURE_UNITS


type 
  FaceCameraMode* {.importcpp: "Urho3D::FaceCameraMode".} = enum 
    FC_NONE = 0, FC_ROTATE_XYZ, FC_ROTATE_Y, FC_LOOKAT_XYZ, FC_LOOKAT_Y



var VSP_AMBIENTSTARTCOLOR* {.importc: "VSP_AMBIENTSTARTCOLOR", 
                             header: "GraphicsDefs.h".}: StringHash

var VSP_AMBIENTENDCOLOR* {.importc: "VSP_AMBIENTENDCOLOR", 
                           header: "GraphicsDefs.h".}: StringHash

var VSP_BILLBOARDROT* {.importc: "VSP_BILLBOARDROT", header: "GraphicsDefs.h".}: StringHash

var VSP_CAMERAPOS* {.importc: "VSP_CAMERAPOS", header: "GraphicsDefs.h".}: StringHash

var VSP_CAMERAROT* {.importc: "VSP_CAMERAROT", header: "GraphicsDefs.h".}: StringHash

var VSP_NEARCLIP* {.importc: "VSP_NEARCLIP", header: "GraphicsDefs.h".}: StringHash

var VSP_FARCLIP* {.importc: "VSP_FARCLIP", header: "GraphicsDefs.h".}: StringHash

var VSP_DEPTHMODE* {.importc: "VSP_DEPTHMODE", header: "GraphicsDefs.h".}: StringHash

var VSP_DELTATIME* {.importc: "VSP_DELTATIME", header: "GraphicsDefs.h".}: StringHash

var VSP_ELAPSEDTIME* {.importc: "VSP_ELAPSEDTIME", header: "GraphicsDefs.h".}: StringHash

var VSP_FRUSTUMSIZE* {.importc: "VSP_FRUSTUMSIZE", header: "GraphicsDefs.h".}: StringHash

var VSP_GBUFFEROFFSETS* {.importc: "VSP_GBUFFEROFFSETS", 
                          header: "GraphicsDefs.h".}: StringHash

var VSP_LIGHTDIR* {.importc: "VSP_LIGHTDIR", header: "GraphicsDefs.h".}: StringHash

var VSP_LIGHTPOS* {.importc: "VSP_LIGHTPOS", header: "GraphicsDefs.h".}: StringHash

var VSP_MODEL* {.importc: "VSP_MODEL", header: "GraphicsDefs.h".}: StringHash

var VSP_VIEWPROJ* {.importc: "VSP_VIEWPROJ", header: "GraphicsDefs.h".}: StringHash

var VSP_UOFFSET* {.importc: "VSP_UOFFSET", header: "GraphicsDefs.h".}: StringHash

var VSP_VOFFSET* {.importc: "VSP_VOFFSET", header: "GraphicsDefs.h".}: StringHash

var VSP_ZONE* {.importc: "VSP_ZONE", header: "GraphicsDefs.h".}: StringHash

var VSP_LIGHTMATRICES* {.importc: "VSP_LIGHTMATRICES", header: "GraphicsDefs.h".}: StringHash

var VSP_SKINMATRICES* {.importc: "VSP_SKINMATRICES", header: "GraphicsDefs.h".}: StringHash

var VSP_VERTEXLIGHTS* {.importc: "VSP_VERTEXLIGHTS", header: "GraphicsDefs.h".}: StringHash

var PSP_AMBIENTCOLOR* {.importc: "PSP_AMBIENTCOLOR", header: "GraphicsDefs.h".}: StringHash

var PSP_CAMERAPOS* {.importc: "PSP_CAMERAPOS", header: "GraphicsDefs.h".}: StringHash

var PSP_DELTATIME* {.importc: "PSP_DELTATIME", header: "GraphicsDefs.h".}: StringHash

var PSP_ELAPSEDTIME* {.importc: "PSP_ELAPSEDTIME", header: "GraphicsDefs.h".}: StringHash

var PSP_FOGCOLOR* {.importc: "PSP_FOGCOLOR", header: "GraphicsDefs.h".}: StringHash

var PSP_FOGPARAMS* {.importc: "PSP_FOGPARAMS", header: "GraphicsDefs.h".}: StringHash

var PSP_GBUFFERINVSIZE* {.importc: "PSP_GBUFFERINVSIZE", 
                          header: "GraphicsDefs.h".}: StringHash

var PSP_LIGHTCOLOR* {.importc: "PSP_LIGHTCOLOR", header: "GraphicsDefs.h".}: StringHash

var PSP_LIGHTDIR* {.importc: "PSP_LIGHTDIR", header: "GraphicsDefs.h".}: StringHash

var PSP_LIGHTPOS* {.importc: "PSP_LIGHTPOS", header: "GraphicsDefs.h".}: StringHash

var PSP_MATDIFFCOLOR* {.importc: "PSP_MATDIFFCOLOR", header: "GraphicsDefs.h".}: StringHash

var PSP_MATEMISSIVECOLOR* {.importc: "PSP_MATEMISSIVECOLOR", 
                            header: "GraphicsDefs.h".}: StringHash

var PSP_MATENVMAPCOLOR* {.importc: "PSP_MATENVMAPCOLOR", 
                          header: "GraphicsDefs.h".}: StringHash

var PSP_MATSPECCOLOR* {.importc: "PSP_MATSPECCOLOR", header: "GraphicsDefs.h".}: StringHash

var PSP_NEARCLIP* {.importc: "PSP_NEARCLIP", header: "GraphicsDefs.h".}: StringHash

var PSP_FARCLIP* {.importc: "PSP_FARCLIP", header: "GraphicsDefs.h".}: StringHash

var PSP_SHADOWCUBEADJUST* {.importc: "PSP_SHADOWCUBEADJUST", 
                            header: "GraphicsDefs.h".}: StringHash

var PSP_SHADOWDEPTHFADE* {.importc: "PSP_SHADOWDEPTHFADE", 
                           header: "GraphicsDefs.h".}: StringHash

var PSP_SHADOWINTENSITY* {.importc: "PSP_SHADOWINTENSITY", 
                           header: "GraphicsDefs.h".}: StringHash

var PSP_SHADOWMAPINVSIZE* {.importc: "PSP_SHADOWMAPINVSIZE", 
                            header: "GraphicsDefs.h".}: StringHash

var PSP_SHADOWSPLITS* {.importc: "PSP_SHADOWSPLITS", header: "GraphicsDefs.h".}: StringHash

var PSP_LIGHTMATRICES* {.importc: "PSP_LIGHTMATRICES", header: "GraphicsDefs.h".}: StringHash


var PASS_BASE* {.importc: "PASS_BASE", header: "GraphicsDefs.h".}: StringHash

var PASS_LITBASE* {.importc: "PASS_LITBASE", header: "GraphicsDefs.h".}: StringHash

var PASS_LIGHT* {.importc: "PASS_LIGHT", header: "GraphicsDefs.h".}: StringHash

var PASS_ALPHA* {.importc: "PASS_ALPHA", header: "GraphicsDefs.h".}: StringHash

var PASS_LITALPHA* {.importc: "PASS_LITALPHA", header: "GraphicsDefs.h".}: StringHash

var PASS_SHADOW* {.importc: "PASS_SHADOW", header: "GraphicsDefs.h".}: StringHash

var PASS_DEFERRED* {.importc: "PASS_DEFERRED", header: "GraphicsDefs.h".}: StringHash

var PASS_PREPASS* {.importc: "PASS_PREPASS", header: "GraphicsDefs.h".}: StringHash

var PASS_MATERIAL* {.importc: "PASS_MATERIAL", header: "GraphicsDefs.h".}: StringHash

var PASS_POSTOPAQUE* {.importc: "PASS_POSTOPAQUE", header: "GraphicsDefs.h".}: StringHash

var PASS_REFRACT* {.importc: "PASS_REFRACT", header: "GraphicsDefs.h".}: StringHash

var PASS_POSTALPHA* {.importc: "PASS_POSTALPHA", header: "GraphicsDefs.h".}: StringHash


var DOT_SCALE* {.importc: "DOT_SCALE", header: "GraphicsDefs.h".}: Vector3

var QUALITY_LOW* {.importc: "QUALITY_LOW", header: "GraphicsDefs.h".}: cint #= 0

var QUALITY_MEDIUM* {.importc: "QUALITY_MEDIUM", header: "GraphicsDefs.h".}: cint #= 1

var QUALITY_HIGH* {.importc: "QUALITY_HIGH", header: "GraphicsDefs.h".}: cint #= 2

var QUALITY_MAX* {.importc: "QUALITY_MAX", header: "GraphicsDefs.h".}: cint #= 15

var SHADOWQUALITY_LOW_16BIT* {.importc: "SHADOWQUALITY_LOW_16BIT", 
                               header: "GraphicsDefs.h".}: cint #= 0

var SHADOWQUALITY_LOW_24BIT* {.importc: "SHADOWQUALITY_LOW_24BIT", 
                               header: "GraphicsDefs.h".}: cint #= 1

var SHADOWQUALITY_HIGH_16BIT* {.importc: "SHADOWQUALITY_HIGH_16BIT", 
                                header: "GraphicsDefs.h".}: cint #= 2

var SHADOWQUALITY_HIGH_24BIT* {.importc: "SHADOWQUALITY_HIGH_24BIT", 
                                header: "GraphicsDefs.h".}: cint #= 3

var CLEAR_COLOR* {.importc: "CLEAR_COLOR", header: "GraphicsDefs.h".}: cuint #= 0x00000001

var CLEAR_DEPTH* {.importc: "CLEAR_DEPTH", header: "GraphicsDefs.h".}: cuint #= 0x00000002

var CLEAR_STENCIL* {.importc: "CLEAR_STENCIL", header: "GraphicsDefs.h".}: cuint #= 0x00000004

var MASK_NONE* {.importc: "MASK_NONE", header: "GraphicsDefs.h".}: cuint #= 0x00000000

var MASK_POSITION* {.importc: "MASK_POSITION", header: "GraphicsDefs.h".}: cuint #= 0x00000001

var MASK_NORMAL* {.importc: "MASK_NORMAL", header: "GraphicsDefs.h".}: cuint #= 0x00000002

var MASK_COLOR* {.importc: "MASK_COLOR", header: "GraphicsDefs.h".}: cuint #= 0x00000004

var MASK_TEXCOORD1* {.importc: "MASK_TEXCOORD1", header: "GraphicsDefs.h".}: cuint #= 0x00000008

var MASK_TEXCOORD2* {.importc: "MASK_TEXCOORD2", header: "GraphicsDefs.h".}: cuint #= 0x00000010

var MASK_CUBETEXCOORD1* {.importc: "MASK_CUBETEXCOORD1", 
                          header: "GraphicsDefs.h".}: cuint #= 0x00000020

var MASK_CUBETEXCOORD2* {.importc: "MASK_CUBETEXCOORD2", 
                          header: "GraphicsDefs.h".}: cuint #= 0x00000040

var MASK_TANGENT* {.importc: "MASK_TANGENT", header: "GraphicsDefs.h".}: cuint #= 0x00000080

var MASK_BLENDWEIGHTS* {.importc: "MASK_BLENDWEIGHTS", header: "GraphicsDefs.h".}: cuint #= 0x00000100

var MASK_BLENDINDICES* {.importc: "MASK_BLENDINDICES", header: "GraphicsDefs.h".}: cuint #= 0x00000200

var MASK_INSTANCEMATRIX1* {.importc: "MASK_INSTANCEMATRIX1", 
                            header: "GraphicsDefs.h".}: cuint #= 0x00000400

var MASK_INSTANCEMATRIX2* {.importc: "MASK_INSTANCEMATRIX2", 
                            header: "GraphicsDefs.h".}: cuint #= 0x00000800

var MASK_INSTANCEMATRIX3* {.importc: "MASK_INSTANCEMATRIX3", 
                            header: "GraphicsDefs.h".}: cuint# = 0x00001000

var MASK_DEFAULT* {.importc: "MASK_DEFAULT", header: "GraphicsDefs.h".}: cuint

var NO_ELEMENT* {.importc: "NO_ELEMENT", header: "GraphicsDefs.h".}: cuint

var MAX_RENDERTARGETS* {.importc: "MAX_RENDERTARGETS", header: "GraphicsDefs.h".}: cint #= 4

var MAX_VERTEX_STREAMS* {.importc: "MAX_VERTEX_STREAMS", 
                          header: "GraphicsDefs.h".}: cint #= 4

var MAX_SKIN_MATRICES* {.importc: "MAX_SKIN_MATRICES", header: "GraphicsDefs.h".}: cint #= 64

var MAX_CONSTANT_REGISTERS* {.importc: "MAX_CONSTANT_REGISTERS", 
                              header: "GraphicsDefs.h".}: cint #= 256

var BITS_PER_COMPONENT* {.importc: "BITS_PER_COMPONENT", 
                          header: "GraphicsDefs.h".}: cint #= 8
