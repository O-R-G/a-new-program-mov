# applescript
# called from bash, osascript with argument

on run argv
    tell application "QuickTime Player" to set rate of document 1 to item 1 of argv
end run

