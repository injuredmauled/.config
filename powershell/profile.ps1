### Uddin Setup

# Git integration for Powershell
Import-Module -Name posh-git

# Terminal Icons
Import-Module -Name Terminal-Icons

# Powershell Autocompletion
Import-Module -Name PSReadline
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -MaximumHistorycount 1024
Set-PSReadLineOption -HistoryNoDuplicates

# Powershell Fuzzy Finder
Import-Module -Name PSFzf
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+f'
Set-PSFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'

# Scoop completion
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# Shorthand for Laravel command
Function Start-Artisan
{
    if (Test-Path -Path .\artisan -PathType Leaf) {
        php artisan @args
    } else {
        Write-FormattedOutput "The current directory is not a Laravel project" -ForegroundColor red
    }
}

# Shorthand for PHPUnit command
Function Start-PHPUnit
{
    if (Test-Path -Path .\vendor\bin\phpunit -PathType Leaf) {
        Clear-Host && .\vendor\bin\phpunit @args
    } else {
        Write-FormattedOutput "No phpunit found in this directory" -ForegroundColor red
    }
}

# Shorthand for PHPUnit filter command
Function Start-PHPUnitFilter
{
    if (Test-Path -Path .\vendor\bin\phpunit -PathType Leaf) {
        Clear-Host && .\vendor\bin\phpunit --filter @args
    } else {
        Write-FormattedOutput "No phpunit found in this directory" -ForegroundColor red
    }
}

# Aliases
Set-Alias -Name g       -Value git
Set-Alias -Name art     -Value Start-Artisan
Set-Alias -Name pu      -Value Start-PHPUnit
Set-Alias -Name pf      -Value Start-PHPUnitFilter
Set-Alias -Name crl     -Value Clear-PSReadlineHistory
Set-Alias -Name ll      -Value ls
Set-Alias -Name vim     -Value nvim

# Scoop Search alternative
scoop-search --hook | iex

# Custom Prompt
oh-my-posh init pwsh --config "$HOME\.config\oh-my-posh\themes\almujeer.omp.yaml" | iex
# starship init powershell | iex

