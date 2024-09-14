# sshkeeper

Keep connection  and automatic restart ssh instance for proxy

# This is example

You need modify it.

# Setup

## Create SSH key

```bash
ssh-keygen -f <path_to_key> -t <key_type>
```

## Prepare your server

Add your public key to `authorized_key`, and add key command `command="cat"`.

## Copy script

Copy `ssh-keep-connect.rb` to somewhere.

## Edit script

Edit `TIMEOUT_RECEIVE_LIMIT`, `TIMEOUT_TOTAL_LIMIT`, `PING_INTERVAL` and `VERBOSE`.

## Edit your local ssh config

exmaple:

```
Host fooproxy
  HostName example.server
  User foo
  IdentityFile ~/.ssh/fooproxykey_ed25519
  RemoteForward 2200 localhost:22
```

## Copy Systemd unit

Copy `ssh-keep-connect@.service` to `~/.config/systemd/user/`.

## Edit Systemd unit

Edit `ExecStart` path and `RestartSec` (if you want.)

# Use

```bash
systemctl start --user ssh-keep-connect@<host>
```