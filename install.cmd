@PowerShell -ExecutionPolicy Bypass -Command Invoke-Expression $('$args=@(^&{$args} %*);'+[String]::Join(';',(Get-Content '%~f0') -notmatch '^^@PowerShell.*EOF$')) & goto :EOF

echo "        /######                                     /##    /##/##             "
echo "       /##__  ##                                   | ##   | #|__/             "
echo "      | ##  \__/ /######  /######  /####### /######| ##   | ##/##/######/#### "
echo "      |  ###### /##__  ##|____  ##/##_____//##__  #|  ## / ##| #| ##_  ##_  ##"
echo "       \____  #| ##  \ ## /######| ##     | ########\  ## ##/| #| ## \ ## \ ##"
echo "       /##  \ #| ##  | ##/##__  #| ##     | ##_____/ \  ###/ | #| ## | ## | ##"
echo "      |  ######| #######|  ######|  ######|  #######  \  #/  | #| ## | ## | ##"
echo "       \______/| ##____/ \_______/\_______/\_______/   \_/   |__|__/ |__/ |__/"
echo "               | ##                                                           "
echo "               | ##                                                           "
echo "               |__/                                                           "
echo "                      version : 1.1.0-dev       by : spacevim.org             "

Push-Location ~

$app_name    = "SpaceVim"
$repo_url    = "https://github.com/SpaceVim/SpaceVim.git"
$repo_name   = "SpaceVim"
$repo_path   = "$HOME\.SpaceVim"

Function Pause ($Message = "Press any key to continue . . . ") {
    if ((Test-Path variable:psISE) -and $psISE) {
        $Shell = New-Object -ComObject "WScript.Shell"
        $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
    } else {
        Write-Host -NoNewline $Message
        [void][System.Console]::ReadKey($true)
        Write-Host
    }
}

if (!(Test-Path "$HOME\vimfiles")) {
    cmd /c mklink $HOME\vimfiles $repo_path
} else {
    echo "[OK] vimfiles already exists"
	sleep 1
}
echo ""

if (!(Test-Path "$HOME\AppData\Local\nvim")) {
  cmd /c mklink "$HOME\AppData\Local\nvim" $repo_path
} else {
    echo "[OK] $HOME\AppData\Local\nvim already exists"
	sleep 1
}

echo ""
echo "Almost done!"
echo "=============================================================================="
echo "==        Open GVim and it will install the plugins automatically           =="
echo "=============================================================================="
echo ""
echo "That's it. Thanks for installing $app_name. Enjoy!"
echo ""

Pause

# vim:set ft=ps1:
