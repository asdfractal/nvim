#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MenuMaskKey vkFF

#=::Return ; unbind win + =
#^Q::Return

; if edge is open but not active, focus
#If WinExist("ahk_exe msedge.exe") && not WinActive("ahk_exe msedge.exe")
    !2::
    WinActivate
    Return
#If 

; if more than 1 edge open, cycle
#If WinActive("ahk_exe msedge.exe")
    !2::	; Next Window
    WinGet, A, ID, ahk_exe msedge.exe
    WinGet, Instances, Count, ahk_exe msedge.exe 
    If Instances > 1
    WinSet, Bottom,, A
    WinActivate, ahk_exe msedge.exe
    return
#If

; if wt open, focus
#If WinExist("ahk_exe WindowsTerminal.exe") && not WinActive("ahk_exe WindowsTerminal.exe")
	!1::
	WinActivate
	Return
#If

; if wt not open, run
#If not WinExist("ahk_exe WindowsTerminal.exe")
	!1::
	Run, wt
    Return
#If

; if vscode open, focus
#If WinExist("ahk_exe code.exe") && not WinActive("ahk_exe code.exe")
    !3::
    WinActivate
    Return
#If

!0:: ; allows keeping script in dotfiles and reload on edit because can't symlink
send rm -f /mnt/c/scripts/AutoHotkeyU64.ahk
sleep, 200
send {enter}
sleep, 200
send cp $DOTFILES/AutoHotkeyU64.ahk /mnt/c/scripts/AutoHotkeyU64.ahk
sleep, 200
send {enter}
Return

!`:: ; reload script
Reload
Return
