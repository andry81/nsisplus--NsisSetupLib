!ifndef _NSIS_SETUP_LIB_PP_COMMAND_NSI
!define _NSIS_SETUP_LIB_PP_COMMAND_NSI

!include "${_NSIS_SETUP_LIB_ROOT}\src\preprocessor.nsi"

!define SETUP_PP_KILL_PROC_EMPTY "!insertmacro SETUP_PP_KILL_PROC_EMPTY"
!macro SETUP_PP_KILL_PROC_EMPTY proc_index
!macroend

!define SETUP_PP_KILL_PROC "!insertmacro SETUP_PP_KILL_PROC"
!macro SETUP_PP_KILL_PROC proc_index
StrCpy $CURRENT_PROC_PATH "$INSTDIR\${PRODUCT_PROC${proc_index}_NAME}"
; convert forward slashes in $CURRENT_PROC_PATH to backward
!ifndef __UNINSTALL__
${StrRep} '$CURRENT_PROC_PATH' "$CURRENT_PROC_PATH" '/' '\'
!else
${UnStrRep} '$CURRENT_PROC_PATH' "$CURRENT_PROC_PATH" '/' '\'
!endif
${KillProc} "$CURRENT_PROC_PATH"
!macroend

!define SETUP_PP_KILL_PROC_LIST_BEGIN "!insertmacro SETUP_PP_KILL_PROC_LIST_BEGIN"
!macro SETUP_PP_KILL_PROC_LIST_BEGIN
!define SETUP_PP_COMMAND_PROLOG
!define SETUP_PP_COMMAND_EPILOG
${!define_if} SETUP_PP_KILL_PROC_LIST_BEGIN_OK PRODUCT_PROCS_NUM > 0
!ifdef SETUP_PP_KILL_PROC_LIST_BEGIN_OK
!define SETUP_PP_COMMAND_PRED "${SETUP_PP_KILL_PROC}"
!else
!define SETUP_PP_COMMAND_PRED "${SETUP_PP_KILL_PROC_EMPTY}"
!endif
!macroend

!define SETUP_PP_KILL_PROC_LIST_END "!insertmacro SETUP_PP_KILL_PROC_LIST_END"
!macro SETUP_PP_KILL_PROC_LIST_END
!undef SETUP_PP_COMMAND_PROLOG
!undef SETUP_PP_COMMAND_EPILOG
!undef SETUP_PP_COMMAND_PRED
${!undef_ifdef} SETUP_PP_KILL_PROC_LIST_BEGIN_OK
!macroend

!define SETUP_PP_DELETE_SCRIPT_EMPTY "!insertmacro SETUP_PP_DELETE_SCRIPT_EMPTY"
!macro SETUP_PP_DELETE_SCRIPT_EMPTY proc_index
!macroend

!define SETUP_PP_DELETE_SCRIPT "!insertmacro SETUP_PP_DELETE_SCRIPT"
!macro SETUP_PP_DELETE_SCRIPT proc_index
StrCpy $CURRENT_SCRIPT_PATH "$INSTDIR\${PRODUCT_SCRIPT${proc_index}_NAME}"
; convert forward slashes in $CURRENT_SCRIPT_PATH to backward
!ifndef __UNINSTALL__
${StrRep} '$CURRENT_SCRIPT_PATH' "$CURRENT_SCRIPT_PATH" '/' '\'
!else
${UnStrRep} '$CURRENT_SCRIPT_PATH' "$CURRENT_SCRIPT_PATH" '/' '\'
!endif
Delete "$CURRENT_SCRIPT_PATH"
!macroend

!define SETUP_PP_DELETE_SCRIPT_LIST_BEGIN "!insertmacro SETUP_PP_DELETE_SCRIPT_LIST_BEGIN"
!macro SETUP_PP_DELETE_SCRIPT_LIST_BEGIN
!define SETUP_PP_COMMAND_PROLOG
!define SETUP_PP_COMMAND_EPILOG
${!define_if} SETUP_PP_DELETE_SCRIPT_LIST_BEGIN_OK PRODUCT_SCRIPTS_NUM > 0
!ifdef SETUP_PP_DELETE_SCRIPT_LIST_BEGIN_OK
!define SETUP_PP_COMMAND_PRED "${SETUP_PP_DELETE_SCRIPT}"
!else
!define SETUP_PP_COMMAND_PRED "${SETUP_PP_DELETE_SCRIPT_EMPTY}"
!endif
!macroend

!define SETUP_PP_DELETE_SCRIPT_LIST_END "!insertmacro SETUP_PP_DELETE_SCRIPT_LIST_END"
!macro SETUP_PP_DELETE_SCRIPT_LIST_END
!undef SETUP_PP_COMMAND_PROLOG
!undef SETUP_PP_COMMAND_EPILOG
!undef SETUP_PP_COMMAND_PRED
${!undef_ifdef} SETUP_PP_DELETE_SCRIPT_LIST_BEGIN_OK
!macroend

!endif
