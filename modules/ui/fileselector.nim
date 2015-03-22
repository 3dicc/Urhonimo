

import
  uielement, vector2, stringHash, urstr, urobject, vector, rect, ptrs, button,
  dropdownlist, font, lineedit, listview, resourcecache, text, window,
  xmlelement

discard "forward decl of Button"
discard "forward decl of DropDownList"
discard "forward decl of Font"
discard "forward decl of LineEdit"
discard "forward decl of ListView"
discard "forward decl of ResourceCache"
discard "forward decl of Text"
discard "forward decl of UIElement"
discard "forward decl of Window"
discard "forward decl of XMLFile"
type
  FileSelectorEntry* {.importcpp: "Urho3D::FileSelectorEntry",
                       header: "FileSelector.h".} = object
    name* {.importc: "name_".}: UrString
    directory* {.importc: "directory_".}: bool



type
  FileSelector* {.importcpp: "Urho3D::FileSelector", header: "FileSelector.h".} = object of UrObject
    window* {.importc: "window_".}: SharedPtr[Window]
    titleLayout* {.importc: "titleLayout".}: ptr UIElement
    titleText* {.importc: "titleText_".}: ptr Text
    fileList* {.importc: "fileList_".}: ptr ListView
    pathEdit* {.importc: "pathEdit_".}: ptr LineEdit
    fileNameEdit* {.importc: "fileNameEdit_".}: ptr LineEdit
    filterList* {.importc: "filterList_".}: ptr DropDownList
    okButton* {.importc: "okButton_".}: ptr Button
    okButtonText* {.importc: "okButtonText_".}: ptr Text
    cancelButton* {.importc: "cancelButton_".}: ptr Button
    cancelButtonText* {.importc: "cancelButtonText_".}: ptr Text
    closeButton* {.importc: "closeButton_".}: ptr Button
    fileNameLayout* {.importc: "fileNameLayout_".}: ptr UIElement
    separatorLayout* {.importc: "separatorLayout_".}: ptr UIElement
    buttonLayout* {.importc: "buttonLayout_".}: ptr UIElement
    path* {.importc: "path_".}: UrString
    filters* {.importc: "filters_".}: Vector[UrString]
    fileEntries* {.importc: "fileEntries_".}: Vector[FileSelectorEntry]
    lastUsedFilter* {.importc: "lastUsedFilter_".}: UrString
    directoryMode* {.importc: "directoryMode_".}: bool
    ignoreEvents* {.importc: "ignoreEvents_".}: bool


proc getType*(this: FileSelector): StringHash {.noSideEffect,
    importcpp: "GetType", header: "FileSelector.h".}
proc getBaseType*(this: FileSelector): StringHash {.noSideEffect,
    importcpp: "GetBaseType", header: "FileSelector.h".}
proc getTypeName*(this: FileSelector): UrString {.noSideEffect,
    importcpp: "GetTypeName", header: "FileSelector.h".}
proc getTypeStatic*(): StringHash {.
    importcpp: "Urho3D::FileSelector::GetTypeStatic(@)",
    header: "FileSelector.h".}
proc getTypeNameStatic*():   UrString {.
    importcpp: "Urho3D::FileSelector::GetTypeNameStatic(@)",
    header: "FileSelector.h".}
proc constructFileSelector*(context: ptr Context): FileSelector {.constructor,
    importcpp: "Urho3D::FileSelector(@)", header: "FileSelector.h".}
proc destroyFileSelector*(this: var FileSelector) {.
    importcpp: "#.~FileSelector()", header: "FileSelector.h".}
proc registerObject*(context: ptr Context) {.
    importcpp: "Urho3D::FileSelector::RegisterObject(@)",
    header: "FileSelector.h".}
proc setDefaultStyle*(this: var FileSelector; style: ptr XMLFile) {.
    importcpp: "SetDefaultStyle", header: "FileSelector.h".}
proc setTitle*(this: var FileSelector; text: UrString) {.importcpp: "SetTitle",
    header: "FileSelector.h".}
proc setButtonTexts*(this: var FileSelector; okText: UrString;
                     cancelText: UrString) {.importcpp: "SetButtonTexts",
    header: "FileSelector.h".}
proc setPath*(this: var FileSelector; path: UrString) {.importcpp: "SetPath",
    header: "FileSelector.h".}
proc setFileName*(this: var FileSelector; fileName: UrString) {.
    importcpp: "SetFileName", header: "FileSelector.h".}
proc setFilters*(this: var FileSelector; filters: Vector[UrString];
                 defaultIndex: cuint) {.importcpp: "SetFilters",
                                        header: "FileSelector.h".}
proc setDirectoryMode*(this: var FileSelector; enable: bool) {.
    importcpp: "SetDirectoryMode", header: "FileSelector.h".}
proc updateElements*(this: var FileSelector) {.importcpp: "UpdateElements",
    header: "FileSelector.h".}
proc getDefaultStyle*(this: FileSelector): ptr XMLFile {.noSideEffect,
    importcpp: "GetDefaultStyle", header: "FileSelector.h".}
proc getWindow*(this: FileSelector): ptr Window {.noSideEffect,
    importcpp: "GetWindow", header: "FileSelector.h".}
proc getTitleText*(this: FileSelector): ptr Text {.noSideEffect,
    importcpp: "GetTitleText", header: "FileSelector.h".}
proc getFileList*(this: FileSelector): ptr ListView {.noSideEffect,
    importcpp: "GetFileList", header: "FileSelector.h".}
proc getPathEdit*(this: FileSelector): ptr LineEdit {.noSideEffect,
    importcpp: "GetPathEdit", header: "FileSelector.h".}
proc getFileNameEdit*(this: FileSelector): ptr LineEdit {.noSideEffect,
    importcpp: "GetFileNameEdit", header: "FileSelector.h".}
proc getFilterList*(this: FileSelector): ptr DropDownList {.noSideEffect,
    importcpp: "GetFilterList", header: "FileSelector.h".}
proc getOKButton*(this: FileSelector): ptr Button {.noSideEffect,
    importcpp: "GetOKButton", header: "FileSelector.h".}
proc getCancelButton*(this: FileSelector): ptr Button {.noSideEffect,
    importcpp: "GetCancelButton", header: "FileSelector.h".}
proc getCloseButton*(this: FileSelector): ptr Button {.noSideEffect,
    importcpp: "GetCloseButton", header: "FileSelector.h".}
proc getTitle*(this: FileSelector): UrString {.noSideEffect,
    importcpp: "GetTitle", header: "FileSelector.h".}
proc getPath*(this: FileSelector): UrString {.noSideEffect,
    importcpp: "GetPath", header: "FileSelector.h".}
proc getFileName*(this: FileSelector): UrString {.noSideEffect,
    importcpp: "GetFileName", header: "FileSelector.h".}
proc getFilter*(this: FileSelector): UrString {.noSideEffect,
    importcpp: "GetFilter", header: "FileSelector.h".}
proc getFilterIndex*(this: FileSelector): cuint {.noSideEffect,
    importcpp: "GetFilterIndex", header: "FileSelector.h".}
proc getDirectoryMode*(this: FileSelector): bool {.noSideEffect,
    importcpp: "GetDirectoryMode", header: "FileSelector.h".}
