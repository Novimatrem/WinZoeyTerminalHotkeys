#Requires AutoHotkey v2.0

keyComboCtrlAltT := "^!t"
keyComboWinT     := "#t"

Hotkey keyComboCtrlAltT, executeGitBashLaunch
Hotkey keyComboWinT,     executeGitBashLaunch

executeGitBashLaunch(*) {
    userDirectory      := "C:\Users\" A_Username
    bashConfigFilePath := userDirectory "\.bashrc"
    startupScriptPath  := userDirectory "\winzoeybashrc.sh"

    bashrcContents := ""
        . "# ~/.bashrc`n"
        . "alias gs='git status'`n"
        . "alias ga='git add .'`n"
        . "alias gc='git commit -m'`n"
        . "alias gp='git push'`n"
        . 'export PS1="\u@\h:\w\$ "' . "`n"
        . 'if [ -f "$HOME/winzoeybashrc.sh" ]; then bash "$HOME/winzoeybashrc.sh"; fi' . "`n"

    startupScriptContents := "echo meow`n"

    if !FileExist(bashConfigFilePath)
        FileAppend bashrcContents, bashConfigFilePath

    if !FileExist(startupScriptPath)
        FileAppend startupScriptContents, startupScriptPath

    Run 'wt.exe --title "Git Bash" cmd /k """"C:\Program Files\Git\bin\bash.exe"""" -i'
}