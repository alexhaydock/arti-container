# arti-container

## Build and test locally
```sh
podman build -t arti . && podman run --rm -d -p "127.0.0.1:9150:9150" arti
```

## Launch Tor Browser (Flatpak version) using Arti:
```sh
TOR_PROVIDER=none TOR_SOCKS_PORT=9150 gtk-launch org.torproject.torbrowser-launcher
```
