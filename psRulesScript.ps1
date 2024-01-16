# Import the PSRules module
Import-Module -Name PSRules

# Define the rules to be executed
$rules = @(
  @{
      Name = 'Rule1'
      ScriptBlock = {
        # Rule 1 logic here
	# e.g. check if a file exists
	  if (-not (Test-Path -Path 'C:\path\to\file.txt')) {
	    Write-Error 'File does not exist'
          }
      },
  @{
      Name = 'Rule2'
      ScriptBlock = {
      # Rule 2 logic here
      }
    }	
  }
)

# Run the PSRules
Invoke-PSRule -Rule $rules -Path 'C:\Path\To\Files'
