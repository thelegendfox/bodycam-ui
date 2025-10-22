; If you change the time GUI's ID to anything other than "1" the entire thing breaks.
; Don't ask why.

; Wishlist:
;   - On start, selection box for current agency, or custom.
;   - Alerts when time has passed (e.g. 1m, 3m, 5m, 10m, 15m)

#include Config.ahk

; This option shouldn't be edited.
global TopLineText := "REC   LEGENDFOX Bodycam R5" ; Spaces necessary for, well, spacing.

; Assign dynamic hotkey.
Hotkey, %BodycamClippingKey%, BodycamClip

; Create name GUI (i.e. "Rockethead293").
; Same stuff as the time.
Text2Y := CenterY - 30
Gui, Text2:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Text2:Color, TransColor
Gui, Text2:Font, s12, Klartext Mono Bold
Gui, Text2:Add, Text, +Right w300 v2ndLineText cWhite, %TopLineText%
WinSet, TransColor, TransColor 1000
Gui, Text2:Show, x%CenterX% y%Text2Y% NoActivate

; Create name GUI (i.e. "Rockethead293").
; Same stuff as the time.
Text3Y := CenterY - 10
Gui, Text3:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Text3:Color, TransColor
Gui, Text3:Font, s12, Klartext Mono Bold
Gui, Text3:Add, Text, +Right w300 v3ndLineText cWhite, %Name%
WinSet, TransColor, TransColor 1000
Gui, Text3:Show, x%CenterX% y%Text3Y% NoActivate

; Create name GUI (i.e. "Rockethead293").
; Same stuff as the time.
Text4Y := CenterY + 10
Gui, Text4:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Text4:Color, TransColor
Gui, Text4:Font, s12, Klartext Mono Bold
Gui, Text4:Add, Text, +Right w300 v4ndLineText cWhite, %DepartmentName%
WinSet, TransColor, TransColor 1000
Gui, Text4:Show, x%CenterX% y%Text4Y% NoActivate

; Dynamic Time GUI
TimeY := CenterY + 30
Gui, 1:+LastFound +AlwaysOnTop -Caption +ToolWindow
; Sets the GUI background to transparent.
Gui, 1:Color, TransColor
; Font size and the font (You must have Klartext Mono installed)
Gui, 1:Font, s12, Klartext Mono Bold
; Add text (in this case, _19CharactersTotal_ to size the box properly)
Gui, 1:Add, Text, +Right w300 vMyText cWhite, _19CharactersTotal_ ;
; Get the computer time.
SetTimer, GetCompTime, 80
Gosub, GetCompTime  ; Make the first update immediate rather than waiting for the timer.
WinSet, TransColor, TransColor 1000 ; Set the window to be transparent and the text to be solid.
; Enable the GUI.
Gui, 1:Show, x%CenterX% y%TimeY% NoActivate  ; NoActivate avoids deactivating the currently active window.

; Create Actively Recording picture (green, blinking).
Gui ActRec:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, ActRec:Color, TransColor
Gui, ActRec:Add, Picture, x0 y0 h15 w15, %ActiveRecordingFile%
WinSet, TransColor, TransColor 200
Gui, ActRec:Hide ; Hide it immediately because you're almost never gonna already be recording when
; you use this.

global RecordingX := CenterX + 137
global RecordingY := CenterY - 19

; Create Not Recording picture (red).
Gui NotRec:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, NotRec:Color, TransColor
Gui, NotRec:Add, Picture, x0 y0 h15 w15, %NotRecordingFile%
WinSet, TransColor, TransColor 150
Gui, NotRec:Show, x%RecordingX% y%RecordingY% NoActivate

; Create LEGENDFOX watermark.
LegendfoxX := CenterX + 310
LegendfoxY := CenterY - 38
Gui Fox:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Fox:Color, TransColor
Gui, Fox:Add, Picture, x0 y0 h120 w120, %LegendfoxFile%
WinSet, TransColor, TransColor 150
Gui, Fox:Show, x%LegendfoxX% y%LegendfoxY% NoActivate

return

; GetCompTime: Gets computer time and formats it sanely.
GetCompTime:
    If (UseUTC == false)
    {
        FormatTime, MyTime,, HH : mm : ss
        FormatTime, MyDate,, MMM dd yyyy
        StringUpper, DateFormatted, MyDate
        GuiControl,, MyText, %DateFormatted%   %MyTime% %TimeZone%
    }
    else
    {
        FormatTime, MyTime, %A_NowUTC%, HH : mm : ss
        FormatTime, MyDate, %A_NowUTC%, MMM dd yyyy
        StringUpper, DateFormatted, MyDate
        GuiControl,, MyText, %DateFormatted%   %MyTime% UTC
    }

return

; And finally, the toggle.
global IsRecording := 0 ; 0 means Not recording

BodycamClip:

    If (global IsRecording == 1 )
    {
        ; MsgBox, "Disabling recording"
        SetTimer, BlinkActiveTimer, Off
        Gui, NotRec:Show, x%RecordingX% y%RecordingY% NoActivate
        Gui, ActRec:Hide

        global IsRecording := 0

        SendEvent, {%MedalRecordingKey%}
    }
    else
    {
        ; MsgBox, "Enabling recording"
        Gui, NotRec:Hide

        global IsRecording := 1

        SendEvent, {%MedalClippingKey%}
        Sleep, 700 ; Delay otherwise it doesn't clip properly
        SendEvent, {%MedalRecordingKey%}

        Sleep, 700
        SoundPlay, %BodycamSound%

        Sleep, 200

        Gui, ActRec:Show, x%RecordingX% y%RecordingY% NoActivate

        Sleep, 1000

        SetTimer, BlinkActiveTimer, 500

    }

return

^F1::
    Gui, Closing:+LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
    Gui, Closing:Color, TransColor
    Gui, Closing:Font, s32, Arial  ; Set a large font size (32-point).
    Gui, Closing:Add, Text, vClosingWatermarkText cLime, CLOSING BODYCAM UI...
    WinSet, TransColor, TransColor 1000
    Gui, Closing:Show, x%CenterX% y%CenterY% NoActivate  ; NoActivate avoids deactivating the currently active window.

    Sleep, 1000
ExitApp

F12::
    ; return
    ; If you want to enable the F12-to-reload feature, remove the ";" in front of the "return" just above this.

    Gui, Closing:+LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
    Gui, Closing:Color, TransColor
    Gui, Closing:Font, s32, Arial  ; Set a large font size (32-point).
    Gui, Closing:Add, Text, vClosingWatermarkText cLime, RELOADING BODYCAM UI...
    WinSet, TransColor, TransColor 1000
    Gui, Closing:Show, x%CenterX% y%CenterY% NoActivate  ; NoActivate avoids deactivating the currently active window.

    Sleep, 250
    Reload
    Gui, Closing:Destroy

return

BlinkActiveTimer:
    BlinkActive()
return

BlinkActive() {
    global IsRecording
    static toggle := false
    if (IsRecording == 0) {
        Gui, ActRec:Hide
        return
    }
    toggle := !toggle
    if (toggle)
        Gui, ActRec:Show, x%RecordingX% y%RecordingY% NoActivate
    else
        Gui, ActRec:Hide
}

; F1::MsgBox, %BodycamClippingKey%

