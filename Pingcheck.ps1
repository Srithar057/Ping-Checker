$RED = [ConsoleColor]::Red
$GREEN = [ConsoleColor]::Green
$GRAY = [ConsoleColor]::Gray
$MAGENTA = [ConsoleColor]::Magenta
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
function EchoWithColor($color, $text) {
    $originalColor = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $color
    Write-Host $text
    $host.UI.RawUI.ForegroundColor = $originalColor
}

$ipFile = $args[0]

$ipList = Get-Content $ipFile
$oc = $ipList.Count

# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
$success = 0
$failed = 0
Write-Host "--------------------"
foreach ($ip in $ipList) {
    if (Test-Connection -ComputerName $ip -Count 1 -ErrorAction SilentlyContinue) {
        EchoWithColor $GREEN "$ip"
        $success++
    } else {
        EchoWithColor $RED "$ip"
        $failed++
    }
}

# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
Write-Host "--------------------"
Write-Host "Results Count:"
EchoWithColor $GREEN "Success : $success/$oc"
EchoWithColor $RED "Failed  : $failed/$oc"
Write-Host "---------------------"
Write-Host ""
EchoWithColor $MAGENTA "Github: https://github.com/Srithar057"
Write-Host ""
