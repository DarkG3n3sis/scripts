if (-not $env:ChocolateyInstall) {
    $message = @(
        "The ChocolateyInstall environment variable was not found."
        "Chocolatey is not detected as installed. Installing..."
    ) -join "`n"

    Write-Warning $message

    <# Installa Chocolately se non e presente nel pc #>
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

$message2 = @(
        "The ChocolateyInstall it was installed."
    ) -join "`n"

    $message1 = @(
        "The ChocolateyInstall it was not installed correctly pls reinstall."
    ) -join "`n"

if ($env:ChocolateyInstall) {
        Write-Warning $message2
    }
    else
    {
    Write-Warning $message1
    }

<# Installa i pacchetti #>
.\conf.ps1