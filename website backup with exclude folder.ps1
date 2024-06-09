#Change the site name frome below location or set any source path
$sourcePath = "C:\inetpub\wwwroot\sc93local"
#destination path is set as current folder
$destinationPath = get-location
#set the folders and file names in the array below. 
$exclude = @('App_Data','temp')
#Folder will be created with seconds as well. 
$folderName = (Get-Date).tostring("yyyy-MM-dd-hh-mm-ss")
Add-Type -assembly "system.io.compression.filesystem"
New-Item -itemType Directory -Path $destinationPath -Name $folderName
$newDestinationPath = "$($destinationPath)\$($folderName)"
write-host $newDestinationPath
$source = Get-ChildItem -Path $sourcePath -Filter "*" -Exclude $exclude
Foreach ($s in $source)
{
        if ($s.gettype() -eq [System.IO.DirectoryInfo])
        {
            $destination = Join-path -path $newDestinationPath -ChildPath "$($s.name).zip"
            If(Test-path $destination) 
            {
                Remove-item $destination
            }
            [io.compression.zipfile]::CreateFromDirectory($s.fullname, $destination)
        }
        else
        {
            $source = Join-path -path $sourcePath -ChildPath "$($s.name)" 
            $destination = Join-path -path $newDestinationPath -ChildPath "$($s.name)"
            Copy-Item -Path $source  -Destination $newDestinationPath
        }   
}
