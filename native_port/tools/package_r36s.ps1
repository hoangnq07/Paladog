# Builds the R36S / ArkOS package into native_port/dist/r36s (run from native_port/).
#   powershell -File tools/package_r36s.ps1
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$env:PATH = "C:\msys64\mingw64\bin;C:\msys64\usr\bin;" + $env:PATH
Push-Location $root
try {
    mingw32-make ARM64=1 -j8
    if ($LASTEXITCODE -ne 0) { throw "aarch64 build failed" }

    $dist = Join-Path $root 'dist\r36s'
    if (Test-Path $dist) { Remove-Item -Recurse -Force $dist }
    $game = Join-Path $dist 'paladog'
    New-Item -ItemType Directory -Force $game | Out-Null

    $zig = (Get-ChildItem (Join-Path $root 'toolchain') -Directory -Filter 'zig-*' | Select-Object -First 1).FullName
    & "$zig\zig.exe" objcopy --strip-all (Join-Path $root 'build-arm64\paladog') (Join-Path $game 'paladog')
    if ($LASTEXITCODE -ne 0) { Copy-Item (Join-Path $root 'build-arm64\paladog') (Join-Path $game 'paladog') }

    Copy-Item -Recurse (Join-Path $root 'assets') (Join-Path $game 'assets')
    Copy-Item (Join-Path $root 'package\Paladog.sh') $dist
    Copy-Item (Join-Path $root 'package\README_R36S.txt') $game

    # Launcher must use LF line endings on Linux.
    $sh = Join-Path $dist 'Paladog.sh'
    [IO.File]::WriteAllText($sh, ((Get-Content $sh -Raw) -replace "`r`n", "`n"), (New-Object Text.UTF8Encoding $false))

    $zip = Join-Path $root 'dist\Paladog_VN_R36S.zip'
    python -c "import os, zipfile; dist, out = r'$dist', r'$zip'; os.remove(out) if os.path.exists(out) else None; zf = zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED, compresslevel=6); [zf.write(os.path.join(r, f), os.path.relpath(os.path.join(r, f), dist)) for r, _, fs in os.walk(dist) for f in fs]; zf.close(); print(f'{os.path.getsize(out)/(1024*1024):.1f} MB -> {out}')"
} finally {
    Pop-Location
}
