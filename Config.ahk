; Configuration!
; Edit anything here. If it has "quotation marks", {curly braces} or anything of the like, don't remove them.

Name := "J. Crown [3475] (Rockethead293)"
DepartmentName := "Sarasota County Sheriff's Office"

; This does NOT set which timezone should be used, which is automatically local time (unless UseUTC is enabled).
; This ONLY sets the text next to the time. TL;DR: Make sure to set it to your own timezone.
TimeZone := "CST" ; https://en.wikipedia.org/wiki/List_of_time_zone_abbreviation
UseUTC := false ; Set to "true" to use UTC.

; The "Recording Alert", a system that beeps every few minutes to say "hey, you're still recording!"
RecordingAlertEnabled := true
RecordingAlertInterval := 1 ; (In minutes) How often the bodycam "beeps" to alert you it's still recording. Please do not set to 0.

; These are the files used. You can customize them with relative file paths.
LogoFile := ".\resources\fop.png"
TriggerSound := ".\resources\R5_alert_axon.wav"
IntervalAlertSound := ".\resources\R5_alert_alt.wav"

; This sets how long the program should wait to start the recording after hitting the bodycam trigger.
; On lower-end machines, this may need to be longer as Medal needs more time to process the clip.
RecordingWaitTime := 1200 ; In milliseconds!!!

; X/Y coordinates of where the bodycam is positioned.
CenterX := 1270 ; Higher X is rightwards.
CenterY := 100 ; Higher Y is downwards.

; Sets the hotkeys. Make sure they're accurate. See the below link for how to add modifier keys.
; https://www.autohotkey.com/docs/v1/Hotkeys.htm#Symbols (e.g.: !F7 for Alt+F7)
BodycamTrigger := "F1"
ExitTrigger := "^F1" ; This is what closes the UI.
ReloadTrigger := "F12" ; And this reloads it.

; These two aren't intended to be pressed by the user while the bodycam is on. Instead, they're set
; in other apps, e.g. Medal, and are pressed by the program itself when the trigger is hit.
; MODIFIER KEYS ARE NOT SUPPORTED DUE TO AHK ISSUES!
; As modifier keys aren't supported, you CANNOT use the default Medal recording keybind (Alt+F7). WARNING!
ClippingKey := "F8"
RecordingKey := "F7"