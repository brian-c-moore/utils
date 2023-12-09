# 1Password CLI Utility Script

This Python utility script is designed to fetch API tokens stored in 1Password using the 1Password Command Line Interface (CLI). It's a simple yet effective tool for securely accessing credentials in your development environment.

## Prerequisites

Before using this script, ensure that you have the following set up on your system:

1. **1Password Desktop Application**: Install the 1Password desktop application compatible with your operating system.
2. **1Password CLI**: Install the 1Password CLI. You can find the installation guide and documentation [here](https://support.1password.com/command-line/).
3. **Link 1Password CLI with the Desktop App**: For seamless usage, link the 1Password CLI with your desktop application. This linking process allows the CLI to leverage the desktop app's authenticated session.

## Setup

1. **Clone the Repository**: Clone this repository to your local machine or download the `get_op_cred.py` script.
2. **Python Environment**: Ensure you have Python installed on your system. This script was developed with Python 3.x.
3. **Script Location**: Place the `get_op_cred.py` script in a directory that you usually include in your Python projects. For ease of use, you can add this directory to your PYTHONPATH.

## Usage

### Direct Execution

Run the script directly in the command line:

    python get_op_cred.py [item_id]

Replace `[item_id]` with the ID of the item in 1Password containing the API token.

### As a Module

To use the script within another Python project:

1. **Add Script Path**: At the beginning of your Python script or in your environment settings, add the path to the `get_op_cred.py` script:

    import sys
    sys.path.append('/path/to/script-directory')

2. **Import and Use**: Import the `get_api_token` function and use it:

    from get_op_cred import get_api_token

    item_id = "your-item-id"
    api_token = get_api_token(item_id)

## Security Note

This script interacts with sensitive data. Ensure it is stored securely and that access permissions are appropriately managed, especially in a team or shared environment.
