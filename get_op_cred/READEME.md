# get_op_cred.py: Simplify 1Password Credential Usage in Python

## Purpose
The `get_op_cred.py` script is designed to streamline the integration and use of 1Password credentials in Python scripts. It is a simple script that could be adapted for different use-cases.

## Prerequisites

Before using this script, ensure that you have the following set up on your system:

1. **1Password Desktop Application**: Install the 1Password desktop application compatible with your operating system.
2. **1Password CLI**: Install the 1Password CLI. You can find the installation guide and documentation.
3. **Link 1Password CLI with the Desktop App**: For seamless usage, link the 1Password CLI with your desktop application. This linking process allows the CLI to leverage the desktop app's authenticated session.

## Setup

There are a few ways to use the script within another Python project.

1. **Adding Script to PYTHONPATH**

    Windows (Powershell):
    Add the script to your PYTHONPATH using the following command in PowerShell. This allows the script to be imported easily into any Python project.
    ``PS C:\Users\nekon> $Env:PYTHONPATH += ";C:\Users\user\projects\util"``
    
    Linux (Bash):
    For Linux users, update the .bashrc or .bash_profile file to include the script in PYTHONPATH.
    ``export PYTHONPATH="$PYTHONPATH:/path/to/script-directory/"``

3. **Add Script Path**: At the beginning of your Python script or in your environment settings, add the path to the `get_op_cred.py` script:
    `````
    import sys
    sys.path.append('/path/to/script-directory')

4. **Script Location**: Place the `get_op_cred.py` script in a directory that you usually include in your Python projects.

## Usage

**Import and Use**: Import the `get_api_token` function and use it:

    from get_op_cred import get_api_token

    item_id = "your-item-id"
    api_token = get_api_token(item_id)

### Direct Execution

The script can be run directly in the command line:

    python get_op_cred.py [item_id]

Replace `[item_id]` with the ID of the item in 1Password containing the API token

## Security Note

This script interacts with sensitive data. Ensure it is stored securely and that access permissions are appropriately managed, especially in a team or shared environment.





