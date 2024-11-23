# Usage: Run PowerShell as Administrator and execute this:
# Set-ExecutionPolicy RemoteSigned

# Define the path to your .env file
$envFilePath = "./.env"

# Define the command to execute
$command = "op run --env-file='$envFilePath' -- code --new-window ."

# Execute the command
Invoke-Expression $command
