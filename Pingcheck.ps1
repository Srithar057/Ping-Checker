$RED = [ConsoleColor]::Red
$GREEN = [ConsoleColor]::Green
$GRAY = [ConsoleColor]::Gray
$MAGENTA = [ConsoleColor]::Magenta
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi

$total_ips = (Get-Content $args[0] | Measure-Object -Line).Lines

$reached = @()
$unreached = @()

# Function to check the reachability of IPs
function Ping-Check {
    Write-Host ""
    # Linkedin - https://in.linkedin.com/in/sritharparthasarathi
    Write-Host "--------------------"
    Get-Content $args[0] | ForEach-Object {
        $ip = $_
        if (Test-Connection -Count 1 -ComputerName $ip -Quiet) {
            $reached += $ip
        }
        else {
            $unreached += $ip
        }
    }
    # Linkedin - https://in.linkedin.com/in/sritharparthasarathi
    Write-Host "Reached IPs:"
    $reached_ips | ForEach-Object {
        Write-Host "$($_)" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "Unreached IPs:"
    $unreached | ForEach-Object {
        Write-Host "$($_)" -ForegroundColor Red
    }

    Write-Host "--------------------"
    Write-Host "Results Count:"
    Write-Host "Success : $($reached.Count)/$total_ips" -ForegroundColor Green
    Write-Host "Failed  : $($unreached.Count)/$total_ips" -ForegroundColor Red
    Write-Host "--------------------"
    Write-Host ""
    Write-Host "Github: https://github.com/Srithar057" -ForegroundColor Magenta
    Write-Host ""
}
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
Ping-Check $args[0]
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
