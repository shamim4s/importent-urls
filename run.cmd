$scriptUrl = 'https://raw.githubusercontent.com/shamim4s/importent-urls/master/script.cmd'
$scriptPath = Join-Path $env:TEMP 'my-script.cmd'

try {
    Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath -UseBasicParsing

    if (-not (Test-Path $scriptPath)) {
        throw "Failed to download script.cmd"
    }

    Start-Process -FilePath "$env:SystemRoot\System32\cmd.exe" `
        -Verb RunAs `
        -ArgumentList "/c `"$scriptPath`"" `
        -Wait
}
finally {
    if (Test-Path $scriptPath) {
        Remove-Item $scriptPath -Force -ErrorAction SilentlyContinue
    }
}