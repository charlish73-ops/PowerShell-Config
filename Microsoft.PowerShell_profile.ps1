# =========================================================
# PERFIL DE POWERSHELL - MANUEL (Versión Final Corregida)
# =========================================================

# --- 1. BANNER DE BIENVENIDA ---
Clear-Host
$banner = @'
      __  __          _   _ _    _ ______ _      
     |  \/  |    /\   | \ | | |  | |  ____| |      
     | \  / |   /  \  |  \| | |  | | |__  | |      
     | |\/| |  / /\ \ | . ` | |  | |  __| | |      
     | |  | | / ____ \| |\  | |__| | |____| |____ 
     |_|  |_/_/    \_\_| \_|\____/|______|______|
'@

Write-Host ""
$banner.Split("`n") | ForEach-Object { Write-Host (" " * 15 + $_) -ForegroundColor Cyan }
Write-Host ""
Write-Host (" " * 22 + "MÁS VALE SER PACIENTE QUE VALIENTE") -ForegroundColor Gray
Write-Host (" " * 28 + "DIOS TE AMA") -ForegroundColor White
Write-Host ""

# --- 2. PERSONALIZACIÓN DEL PROMPT ---
function prompt {
    $path = $(Get-Location)
    Write-Host "[MANUEL]" -NoNewline -ForegroundColor Green
    Write-Host " @ " -NoNewline -ForegroundColor Gray
    Write-Host "$path" -NoNewline -ForegroundColor Cyan
    Write-Host "`n> " -NoNewline -ForegroundColor White
    $Host.UI.RawUI.WindowTitle = "Terminal de MANUEL | $path"
    return " "
}

# --- 3. FUNCIÓN TV ---
function tv {
    Clear-Host
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "    CENTRAL DE VIDEO EN VIVO - RD" -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "1) Teleantillas (C2)   7) Digital 15"
    Write-Host "2) RTVD (C4)           8) Telefuturo (C23)"
    Write-Host "3) Telemicro (C5)      9) CDN (C37)"
    Write-Host "4) Color Visión (C9)   10) AME (C47)"
    Write-Host "5) Telesistema (C11)   11) Zol 106.5 TV"
    Write-Host "6) Telecentro (C13)    12) Z 101 TV"
    Write-Host "q) Salir"
    Write-Host ""
    $opcion = Read-Host "Sintonizar Canal"
    switch ($opcion) {
        "1" { start msedge --app="https://teleantillas.com.do/en-vivo/" }
        "2" { start msedge --app="https://rtvd.gob.do/" }
        "3" { start msedge --app="https://telemicro.com.do/telemicro-en-vivo/" }
        "4" { start msedge --app="https://colorvision.com.do/en-vivo/" }
        "5" { start msedge --app="https://telesistema11.com.do/en-vivo/" }
        "6" { start msedge --app="https://telemicro.com.do/telecentro-en-vivo/" }
        "7" { start msedge --app="https://telemicro.com.do/digital-15-en-vivo/" }
        "8" { start msedge --app="http://www.telefuturo.com.do/" }
        "9" { start msedge --app="https://cdn.com.do/envivo/" }
        "10" { start msedge --app="https://dominicanchannels.com/ame-47/" }
        "11" { start msedge --app="https://zolfm.com/streaming" }
        "12" { start msedge --app="https://z101digital.com/ztv/" }
        "q" { return }
        Default { Write-Host "Opción no válida." -ForegroundColor Red }
    }
}

# --- 4. FUNCIÓN INICIO ---
function inicio {
    Write-Host "Iniciando estacion de trabajo en MANUEL..." -ForegroundColor Yellow
    start msedge
    start firefox
    start "C:\Program Files\Google\Chrome\Application\chrome.exe"
    $canaryPath = "C:\Users\$env:USERNAME\AppData\Local\Google\Chrome SxS\Application\chrome.exe"
    if (Test-Path $canaryPath) { start $canaryPath "--app=https://web.whatsapp.com/" }
    $telegramPath = "$env:APPDATA\Telegram Desktop\Telegram.exe"
    if (Test-Path $telegramPath) { start $telegramPath }
    start wt
    Write-Host "¡Todo listo, porgr!" -ForegroundColor Green
}

# --- 5. HERRAMIENTAS DE SISTEMA ---
function update {
    Write-Host "--- Buscando actualizaciones en MANUEL ---" -ForegroundColor Cyan
    winget source update
    winget upgrade --all --accept-package-agreements --accept-source-agreements
    Write-Host "--- Proceso finalizado, porgr ---" -ForegroundColor Green
}

# Función Reboot única y mejorada
function reboot {
    Write-Host "Reiniciando la laptop de MANUEL en 5 segundos..." -ForegroundColor Red
    Write-Host "Guarda todo tu trabajo rápido." -ForegroundColor Yellow
    shutdown -r -f -t 5
}

function shutdown_pc {
    Write-Host "Apagando MANUEL en 5 segundos..." -ForegroundColor Red
    & C:\Windows\System32\shutdown.exe -s -f -t 5
}
Set-Alias -Name apagar -Value shutdown_pc

# --- 6. MULTIMEDIA (LISTAS Y RADIO) ---
function playlist {
    param([string]$url)
    if (-not $url) { $url = Read-Host "Pega el link de la lista" }
    $url = $url.Trim().Trim("'").Trim('"')
    Clear-Host
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host "       REPRODUCTOR RADIO MANUEL (V4)          " -ForegroundColor Cyan
    Write-Host "==============================================" -ForegroundColor Cyan
    mpv "$url" --no-video --shuffle --volume=100
}

function m {
    Clear-Host
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "               BIBLIOTECA MUSICAL DE MANUEL               " -ForegroundColor Cyan
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host " 1. SALSA                   10. PLAYERO                   " 
    Write-Host " 2. REGUETON VIEJO          11. MERENGUE PARA BAILAR      " 
    Write-Host " 3. REGUETON SUAVE          12. OZUNA NUEVO               " 
    Write-Host " 4. CONCIERTO DADDY YANKY   13. MAMBO                     " 
    Write-Host " 5. URBANO 2020             14. CIMA SABOR NAVIDENO 1     " -ForegroundColor Green
    Write-Host " 6. SALSA 20                15. CIMA SABOR NAVIDENO 2     " -ForegroundColor Green
    Write-Host " 7. LA NOTA                 16. HECTOR LAVOE              " -ForegroundColor Yellow
    Write-Host " 8. DEMBOW                  17. FRANKIE RUIZ              " -ForegroundColor Yellow
    Write-Host " 9. BACHATA                 18. EDDIE SANTIAGO            " -ForegroundColor Yellow
    Write-Host " q. SALIR                                                 " -ForegroundColor Red
    Write-Host "==========================================================" -ForegroundColor Cyan
    
    $choice = Read-Host "Elige un numero"
    switch ($choice) {
        "1"  { $url = "https://music.youtube.com/watch?v=xWDsNex_VKA&list=RDCLAK5uy_lRQbFalJOe45Qa-ERq9tTVUIv6WZFW_WA" }
        "2"  { $url = "https://music.youtube.com/watch?v=1WSUrECDvec&list=PL0V7q1HYjwBFZjT9GSJzQxxrPFMPoKLor" }
        "3"  { $url = "https://music.youtube.com/watch?v=FXovf5dsRTw&list=PLegCzvHttBUJSfhIFKX-afB7BAFfar8Or" }
        "4"  { $url = "https://music.youtube.com/playlist?list=PLAShHsny6t4JUkLK50JGXe5iOkCU-8Rt1" }
        "5"  { $url = "https://music.youtube.com/playlist?list=PLAShHsny6t4IC6FtjNbzN8_UoCMnWc57L" }
        "6"  { $url = "https://music.youtube.com/watch?v=CoWfU6C9tnY&list=PLAShHsny6t4KRGUV9gFA1vlXR8W57_HiK" }
        "7"  { $url = "https://music.youtube.com/watch?v=IWrZpP24H8I&list=PLfbJBmoDv1zZ7Uvc1W84n0zL4AUMYjeUY" }
        "8"  { $url = "https://music.youtube.com/watch?v=79XCNh-Rcs8&list=PLAShHsny6t4JuWZmEUQdXWLjFk1DrkDQv" }
        "9"  { $url = "https://music.youtube.com/watch?v=z6YnfxsY5M0&list=PLAShHsny6t4JX1-OqoQRsIgqWD3Js9j0G" }
        "10" { $url = "https://music.youtube.com/watch?v=DhYKYCMv644&list=PLAShHsny6t4KpnWwmioFLzYczDJBZOBou" }
        "11" { $url = "https://music.youtube.com/watch?v=0yazzzUxLWY&list=PLAShHsny6t4IuT_bsTXHpDN8lWuBxCnGR" }
        "12" { $url = "https://music.youtube.com/watch?v=Nz_q7x-5lAk&list=PLAShHsny6t4JHmJ4eWJEdQtbChNcv0uV7" }
        "13" { $url = "https://music.youtube.com/watch?v=1SZPeVxJld4&list=PLAShHsny6t4Lj78lzSETjxfXI1TMW7v61" }
        "14" { $url = "https://music.youtube.com/watch?v=Q-OGCde5XU4&list=PLj_eUaiCu1ZlF2hjKLzc0RYw9UwJiZ9vU" }
        "15" { $url = "https://music.youtube.com/watch?v=Fz3pPMyzkXU&list=PLAShHsny6t4KuPETMMYWhWbwbPO5ekW1q" }
        "16" { $url = "https://music.youtube.com/watch?v=iAH7SiBDjBw&list=RDEMFLnWNDazY60BcgLqPABKjg" }
        "17" { $url = "https://music.youtube.com/watch?v=nAkN2Hz7ZXs&list=OLAK5uy_mERZ6qQIUEIOuV4xKdZfxOOg3AlQAiDDM" }
        "18" { $url = "https://music.youtube.com/watch?v=JiiCJ6pWdKo&list=OLAK5uy_lAX_vA_Ji253-Q3CdUs3diauDX1OLJVr4" }
        "q"  { return }
        Default { return }
    }
    playlist $url
}

function radio {
    $Emisoras = [ordered]@{
        "1"  = @{ Nombre = "Fuego 90 La Salsera"; Url = "https://radiordomi.com/8390/stream/1/" }
        "2"  = @{ Nombre = "LATIDO";             Url = "https://rstream.hostdime.com/proxy/latidos?mp=/8880" }
        "3"  = @{ Nombre = "LA KALLE";           Url = "https://radio.telemicro.com.do/lakallesantiago" }
        "4"  = @{ Nombre = "K Q 94.5";           Url = "https://radio.yaservers.com:9990/stream/1/" }
        "5"  = @{ Nombre = "MIX 104.5";          Url = "https://radiordomi.com:8608/stream/1/" }
        "6"  = @{ Nombre = "CIMA 100.5";         Url = "https://sonicpanel.streaming10.net/8146/stream/1/" }
        "7"  = @{ Nombre = "SUPER K";            Url = "https://sonic.radiostreaminglatino.com/8298/stream/1/" }
        "8"  = @{ Nombre = "TOP LATINA 101.7";   Url = "https://stream.zeno.fm/rprhbqiwozovv" }
        "9"  = @{ Nombre = "CALIENTE 104.1";     Url = "https://stream.zeno.fm/2wr9tlnoomqtv" }
        "10" = @{ Nombre = "TROPICAL SALSA";     Url = "https://stream.zeno.fm/2wr9tlnoomqtv" }
        "11" = @{ Nombre = "ZOL 106.5 FM";       Url = "https://stream.zeno.fm/w6x7q7dtpy5tv" }
        "12" = @{ Nombre = "ALOFOKE 99.3 FM";    Url = "https://radiordomi.com/8566/stream" }
        "13" = @{ Nombre = "MORTAL";             Url = "https://radio.telemicro.com.do/mortal104" }
        "14" = @{ Nombre = "RAICES";             Url = "https://radiordomi.com/8680/stream/1/" }
        "15" = @{ Nombre = "Z 101";              Url = "https://27383.live.streamtheworld.com/Z101FM_SC" }
        "16" = @{ Nombre = "RUMBA";              Url = "https://stream.zeno.fm/eticl2rpposvv" }
        "17" = @{ Nombre = "DISCO 106";          Url = "https://radiordomi.com:8118/stream/1/" }
    }
    $EmisoraActual = "Radio Apagada"; $Reproduciendo = $false
    while ($true) {
        Clear-Host
        Write-Host "      __________________________" -ForegroundColor Gray
        Write-Host "     |  ______________________  |" -ForegroundColor Gray
        Write-Host "     | | CARLOS RADIO RD      | |" -ForegroundColor Cyan
        Write-Host "     | |______________________| |" -ForegroundColor Gray
        Write-Host "     |    ___          ______   |" -ForegroundColor Gray
        Write-Host "     |   /   \  ( o )  |    |   |" -ForegroundColor Gray
        Write-Host "     |   \___/         |____|   |" -ForegroundColor Gray
        Write-Host "     |__________________________|" -ForegroundColor Gray
        Write-Host "`n ESCUCHANDO: " -NoNewline; Write-Host $EmisoraActual -ForegroundColor Green -BackgroundColor Black
        Write-Host "`n--- Emisoras Disponibles ---"
        foreach ($key in $Emisoras.Keys) { Write-Host "$key) $($Emisoras[$key].Nombre)" }
        $Opcion = Read-Host "`nEscribe el numero o 'q' para salir"
        if ($Opcion -eq 'q') { Stop-Process -Name "mpv" -ErrorAction SilentlyContinue; break }
        if ($Emisoras.Contains($Opcion)) {
            Stop-Process -Name "mpv" -ErrorAction SilentlyContinue
            $Seleccion = $Emisoras[$Opcion]; $EmisoraActual = $Seleccion.Nombre
            Start-Process "mpv" -ArgumentList $Seleccion.Url, "--no-video" -WindowStyle Hidden
        }
    }
}

# --- 7. RESUMEN DE COMANDOS ---
Write-Host " COMANDOS DISPONIBLES:" -ForegroundColor Yellow
Write-Host " > inicio  : Abre navegadores y apps de trabajo." -ForegroundColor Gray
Write-Host " > update  : Actualiza todas las apps (Winget)." -ForegroundColor Gray
Write-Host " > tv      : Abre canales dominicanos en vivo." -ForegroundColor Gray
Write-Host " > m       : Biblioteca musical (YouTube Music)." -ForegroundColor Gray
Write-Host " > radio   : Radio dominicana en vivo (MPV)." -ForegroundColor Gray
Write-Host " > reboot  : Reinicia la laptop de MANUEL." -ForegroundColor Gray
Write-Host " > apagar  : Apaga la PC en 5 segundos." -ForegroundColor Gray
Write-Host ""

# --- 8. AUTOCOMPLETADO INTELIGENTE (PSReadLine) CORREGIDO ---
# Este bloque detecta si tienes la versión necesaria para evitar errores rojos
try {
    Import-Module PSReadLine -ErrorAction SilentlyContinue
    Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue
    Set-PSReadLineOption -PredictionViewStyle InlineView -ErrorAction SilentlyContinue
    Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[38;5;242m" } -ErrorAction SilentlyContinue
} catch {
    # Si falla, simplemente no activa la predicción pero NO muestra error
}

# --- 10. FUNCIÓN DE AUTO-SUBIDA A GITHUB ---
function subir {
    # 1. Definimos la carpeta de trabajo
    $repoPath = "$HOME\Documents\MiTerminal"
    
    Write-Host "--- Iniciando actualización en GitHub para MANUEL ---" -ForegroundColor Cyan
    
    # 2. Copiamos el perfil actual a la carpeta del repo por si hubo cambios
    Write-Host "> Copiando perfil actualizado..." -ForegroundColor Gray
    copy $PROFILE "$repoPath\Microsoft.PowerShell_profile.ps1" -Force
    
    # 3. Entramos a la carpeta
    cd $repoPath
    
    # 4. Ejecutamos la secuencia de Git
    Write-Host "> Preparando archivos..." -ForegroundColor Gray
    git add .
    
    Write-Host "> Creando commit..." -ForegroundColor Gray
    $fecha = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "Actualización automática: $fecha"
    
    Write-Host "> Subiendo a la nube (Push)..." -ForegroundColor Yellow
    git push origin main
    
    Write-Host "--- ¡Todo listo, charlish73-ops! Tu GitHub está al día ---" -ForegroundColor Green
    
    # 5. Volvemos al inicio
    cd ~
}