function Rename-Files {
  param (
      [Parameter(Mandatory=$true)]
      [string]$Path
  )

  $files = Get-ChildItem -Path $Path -File

  foreach ($file in $files) {
      if ($file.Name -match "l_english") {
          $newName = $file.Name -replace "l_english", "l_russian"
          Rename-Item -Path $file.FullName -NewName $newName
      }
  }

  $directories = Get-ChildItem -Path $Path -Directory
  foreach($directory in $directories) {
      Rename-Files -Path $directory.FullName
  }
}

Rename-Files -Path "localisation"