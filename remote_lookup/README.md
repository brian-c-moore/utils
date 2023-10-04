# Remote Lookup Utility

The `remote_lookup.sh` utility performs DNS lookups on a remote server. It can resolve either IP addresses to hostnames or hostnames to IP addresses. If no specific IP or hostname is provided as an argument, the utility reads from pre-defined lists.

## Prerequisites

- Ensure `sshpass` is installed for non-interactive SSH password authentication.
- The utility expects a hard-coded remote server hostname within the script. Ensure you set the `remote_host` variable inside the script.

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
