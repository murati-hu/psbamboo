<#
.SYNOPSIS
    Stops and removes a queued build.
.DESCRIPTION
    The cmdlet doesn't return any value about the stop attempt
.PARAMETER BuildKey
    Mandatory - Key for the latest build to be aborted
.EXAMPLE
    Stop-BambooBuild -BuildKey 'PRJ-PLANKEY'
#>
function Stop-BambooQueuedBuild {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidatePattern('\w+-\w+-\d+')]
        [string]$BuildKey
    )
    Invoke-BambooRestMethod -Resource "queue/$BuildKey" -Method Delete
}
