# Remote Lookup Utility

The `remote_lookup.sh` utility performs DNS lookups from a remote server connecting over SSH. It can resolve either a single IP address or hostname or read in multiple from a list. When an IP or hostname is provide as a command line argument, the lookup will use that. When no argument is supplied, it will read from a predefined list stored in a text file.

When performing nslookups for multiple hosts, the script creates all of the commands and executes them in a single SSH session. This is to avoid the overhead of making a connection each time in a loop.

The script prompts for credentials and has not been designed with SSH keys in mind.

## Prerequisites

- Ensure `sshpass` is installed for non-interactive SSH password authentication.
- The utility expects a hard-coded remote server hostname within the script. Ensure you set the `remote_host` variable inside the script.
- Alternatey remote_host can be read in similarly to the username with slight modifications.

## Usage

```
./remote_lookup.sh [-i | -h] [optional IP or hostname]
```

### Options:
- `-i`: Lookup an IP address to resolve to its hostname. 
- `-h`: Lookup a hostname to resolve to its IP.

If no IP or hostname is provided as an argument:
- For `-i`, IPs will be read from `ip.lst`.
- For `-h`, hostnames will be read from `hostname.lst`.

## Examples

1. To find the hostname of a specific IP:
```
./remote_lookup.sh -i 8.8.8.8
```

2. To find the IP of a specific hostname:
```
./remote_lookup.sh -h example.com
```

3. To process all IPs in `ip.lst`:
```
./remote_lookup.sh -i
```

4. To process all hostnames in `hostname.lst`:
```
./remote_lookup.sh -h
```

## Notes

- For security, the password used for SSH is cleared from the shell after execution.
- Ensure `ip.lst` or `hostname.lst` are populated and located in the same directory as the script, as required.
