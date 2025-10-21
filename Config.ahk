; Configuration!
; Edit anything here. If it has "quotation marks", {curly braces} or anything of the like, don't remove them.

global Name := "J. Crown [3475]"
global DepartmentName := "Sarasota County Sheriff's Office"
global TimeZone := "CST" ; https://en.wikipedia.org/wiki/List_of_time_zone_abbreviations
global UseUTC := false ; Set to "true" to use UTC.

; These are the files used. You can customize them with relative file paths.
global ActiveRecordingFile := ".\resources\green_dot.png"
global NotRecordingFile := ".\resources\red_dot.png"
global LegendfoxFile := ".\resources\fop.png"
global BodycamSound := ".\resources\BodyCam Sound Effect LowVol.wav"

; X/Y coordinates of where the bodycam is positioned.
global CenterX := 1270 ; Higher X is rightwards.
global CenterY := 100 ; Higher Y is downwards.

; Sets the hotkeys. Make sure they're accurate. See the below link for how to add modifier keys.
; https://www.autohotkey.com/docs/v1/Hotkeys.htm#Symbols (e.g.: !F7 for Alt+F7)
global BodycamClippingKey := "F1"
global MedalClippingKey := "F8"
global MedalRecordingKey := "!F7"
