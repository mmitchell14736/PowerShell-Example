<#
Michael Mitchell
Menu.ps1
11/13/2014
#>


cls
$quit = "false"
Do {
    Do {
        cls
        Write-Host "
        ----------Main Menu--------
        1 = Manipulate a folder
        2 = PC Inventory
        3 = Quit
        ---------------------------"
        $choice1 = read-host -prompt "Select number & press enter"
    } until ($choice1 -eq "1" -or $choice1 -eq "2" -or $choice1 -eq "3")

    Switch ($choice1) {
        "1" {
            cls
            invoke-expression -command ".\FolderManip.ps1"
            }
        "2" {
            cls
            invoke-expression -command ".\PCInventory.ps1"
            }
        "3" {
            cls
            Write-Host "Are you sure you want to quit? y/n"
            $choice2 = read-host -prompt "Select letter & press enter"
            if ($choice2 -contains "y" -or $choice2 -contains "Y")
                {
                    $quit = "true"
                }
            }
            
        }
}until ($quit -eq "true")


