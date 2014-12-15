<#
Michael Mitchell
PCInventory.ps1
11/6/2014
#>
cls
$compName = get-content env:computername
$quit = "false"
Do {
    Do {
            cls
            Write-Host "
            -------------------PC Inventory------------------------
            1 = Details of the PC output to the shell
            2 = Details of the PC output to a grid view
            3 = Details of the PC output to a file
            4 = Details of the PC OS to the shell
            5 = Details of the PC local hard drives to the shell
            6 = Quit
            -------------------------------------------------------"
            $choice1 = read-host -prompt "Select number & press enter"
        } until ($choice1 -eq "1" -or $choice1 -eq "2" -or $choice1 -eq "3" -or $choice1 -eq "4" -or $choice1 -eq "5" -or $choice1 -eq "6")
        Switch ($choice1) {
            "1" {
                    cls
                    Get-Wmiobject -Class Win32_ComputerSystem -comp $compName
                    Write-Host "Press any key to continue..."
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            "2" {
                    cls
                    Get-Wmiobject -Class Win32_ComputerSystem -comp $compName | out-gridview -Title "System Details"
                }
            "3" {
                    cls
                    Get-Wmiobject -Class Win32_ComputerSystem -comp $compName | out-file "P:\School\Fall 2014\Survey\Homework\Batch 7\PCInventory.txt"
                    Write-Host "PCInventory.txt has been created/modified"
                    Write-Host "`r`nPress any key to continue..."
                    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            "4" {
                    cls
                    Get-WmiObject -Class Win32_OperatingSystem -comp $compName | Select-Object *
                    Write-Host "Press any key to continue..."
                    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            "5" {
                    cls
                    Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" -ComputerName $compName
                    Write-Host "Press any key to continue..."
                    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
            "6" {
                    $quit = "true"
                }
        }
}until ($quit -eq "true")
cls
