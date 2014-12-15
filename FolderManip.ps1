<#
Michael Mitchell
folderManip.ps1
11/6/2014
#>

function createFolder
{
    param([string]$folderName)
    new-item -itemtype Directory -path "$drive:\School\Fall 2014\Survey\Homework\Batch 7\$folderName"
    return
}

function checkFolder([string]$folderName)
{
    $var=Test-Path "$drive:\School\Fall 2014\Survey\Homework\Batch 7\$folderName"
    return $var
}

function createFile([string]$fileName)
{
    if (checkFolder $fileName)
    {
        Write-Host "Error: $fileName already exists"
    }
    else
    {   
        new-item -type File -path "$drive:\School\Fall 2014\Survey\Homework\Batch 7\$fileName"
        Write-Host "`r`n$fileName was created successfully"
    }
    return
}

function deleteFolder([string]$fileName)
{
    Remove-Item "$drive:\School\Fall 2014\Survey\Homework\Batch 7\$fileName" -recurse
    return
}


cls
$folder = "PSCreate"
$quit = "false"
$drive = (get-location).Drive.Name
Do {
    Do {
        cls
        Write-Host "
        ----------Folder Manipulation-------------
        1 = Create $folder
        2 = Create 3 files in the $folder folder
        3 = Browse $folder folder
        4 = Share the $folder folder
        5 = Delete the $folder folder
        6 = Quit
        ------------------------------------------"
        $choice1 = read-host -prompt "Select number & press enter"
    } until ($choice1 -eq "1" -or $choice1 -eq "2" -or $choice1 -eq "3" -or $choice1 -eq "4" -or $choice1 -eq "5" -or $choice1 -eq "6")

    Switch ($choice1) {
        "1" {
            cls
            if (!(checkFolder $folder))
                {
                    createFolder $folder
                    Write-Host "$folder has been created successfully"
                    Write-Host "`r`nPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            else
                {
                    Write-Host "Error: $folder already exists"
                    Write-Host "`r`nnPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            }
        "2" { checkFolder "$folder\PSFile2" -eq False checkFolder "$folder\PSFile3" -eq False
            cls
            if (checkFolder $folder)
            {
                createFile "$folder\PSFile1"
                createFile "$folder\PSFile2"
                createFile "$folder\PSFile3"
                Write-Host "`r`nPress any key to continue..."
                $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")     
            }
        else
            {
                Write-Host "Error: $folder does not exist"
                Write-Host "`r`nPress any key to continue..."
                $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            }
            }
        "3" {
            cls
            if ((checkFolder $folder))
                {
                    Invoke-Item "$drive:\School\Fall 2014\Survey\Homework\Batch 7\$folder"
                }
            else
                {
                    Write-Host "Error: $folder does not exist"
                    Write-Host "`r`nPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            }
        "4" {
            cls
            if ((checkFolder $folder))
                {
                    $share = [wmiclass]"Win32_Share"
                    $share.Create("$drive:\School\Fall 2014\Survey\Homework\Batch 7\$folder", "Data", 0, 255, "Data Share")
                    Write-Host "$folder has been shared successfully"
                    Write-Host "`r`nPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            else
                {
                    Write-Host "Error: $folder does not exist"
                    Write-Host "`r`nPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            }
        "5" {
            cls
            if ((checkFolder $folder))
                {
                    deleteFolder $folder
                    Write-Host "$folder has been deleted successfully"
                    Write-Host "`r`nPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            else
                {
                    Write-Host "Error: $folder does not exist"
                    Write-Host "`r`nPress any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            }
        "6" {$quit = "true"}
    }
}until ($quit -eq "true")
cls


