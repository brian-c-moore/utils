import subprocess
import json
import sys
import logging

# Set up basic logging
logging.basicConfig(level=logging.INFO)

# Function to run 1Password CLI command
def run_op_command(command):
    try:
        result = subprocess.run(command, capture_output=True, text=True, shell=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        logging.error(f"Error running command: {e}")
        sys.exit(1)

# Function to fetch API token
def get_api_token(item_id):
    api_token_output = run_op_command(f'op item get {item_id}')

    # Search for the line containing the API token
    for line in api_token_output.splitlines():
        if line.strip().startswith('credential:'):
            # Extract the token from the line
            _, api_token = line.split(':', 1)
            return api_token.strip()

    logging.error("API token not found in the output.")
    return None

# Main function to allow script to be run standalone
def main():
    if len(sys.argv) != 2:
        logging.error("Usage: python utility_script.py [item_name]")
        sys.exit(1)

    item_name = sys.argv[1]
    api_token = get_api_token(item_name)
    print(api_token)

if __name__ == "__main__":
    main()
