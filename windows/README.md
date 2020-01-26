# Shortcut
## How to create a shortcut to Chrome Incognito
1. Create a shortcut to `C:\Program Files (x86)\Google\Chrome\Application\chrome.exe`
2. Name it `Chrome Incognito`
3. Change the icon to the Chrome Canary icon
4. Set `Target` to `"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --incognito`
5. Set `Run` to `Minimized`

# Registry
## How to configure HKEY_CURRENT_USER
```batch
rem Set the codepage of Command Prompt to UTF-8. Note that the second `%` is escaped by `^`
reg add HKCU\Console\%SystemRoot^%_system32_cmd.exe /v CodePage /t REG_DWORD /d 65001 /f

rem Disable IME on Command Prompt
reg add HKCU\Console /v LoadConIme /t REG_DWORD /d 0 /f

rem Show Windows menu without delay
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /d 0 /f

rem Disable the suffix of shortcuts
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v link /t REG_BINARY /d 00000000 /f
```

## How to configure HKEY_LOCAL_MACHINE
```batch
rem Make Caps Lock a Control key
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d 0000000000000000020000001D003A0000000000 /f

rem Set US keyboard (unnecessary if your physical keyboard is US layout)
reg add HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters /v "LayerDriver JPN" /d kbd101.dll /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters /v OverrideKeyboardIdentifier /d PCAT_101KEY /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters /v OverrideKeyboardSubtype /t REG_DWORD /d 0 /f
reg delete HKLM\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters /v "LayerDriver KOR" /f

rem Disable UAC (User Account Control), which was formerly known as LUA (Limited User Account)
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
```

Ensure that the type of `HKCU\Environment\PATH` is `REG_EXPAND_SZ` to support nested environment variables such as `%JAVA_HOME%/bin`.

https://docs.microsoft.com/en-us/windows/desktop/SysInfo/registry-value-types
