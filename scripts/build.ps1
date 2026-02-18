Param([string]$Root = (Resolve-Path -Path (Join-Path $PSScriptRoot "..")))
Set-StrictMode -Version Latest
Push-Location $Root
$manifest = Get-Content -Path ".\copilot-plugin.yml" -Raw
$version = '0.0.0'
$line = ($manifest -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^version:' } | Select-Object -First 1)
if ($line) {
    $parts = $line -split ":", 2
    if ($parts.Count -ge 2) {
        $version = $parts[1].Trim()
        if ($version.StartsWith('"') -and $version.EndsWith('"') -and $version.Length -ge 2) { $version = $version.Substring(1, $version.Length - 2) }
        elseif ($version.StartsWith("'") -and $version.EndsWith("'") -and $version.Length -ge 2) { $version = $version.Substring(1, $version.Length - 2) }
    }
}
$artifact = "plugin-$version.zip"
if (Test-Path $artifact) { Remove-Item $artifact -Force }
Compress-Archive -Path copilot-plugin.yml, src, README.md, LICENSE -DestinationPath $artifact -Force
Write-Output $artifact
Pop-Location
