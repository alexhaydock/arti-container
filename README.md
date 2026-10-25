# arti-container

## Quick local test
Build locally:
```sh
podman build -t arti . && podman run --rm -d -p "127.0.0.1:9150:9150" arti
```

## "Production" Quadlet
```sh
mkdir -p ~/.config/containers/systemd
nano ~/.config/containers/systemd/arti.container
```

```ini
[Unit]
Description=Arti Tor Proxy

[Container]
Image=ghcr.io/alexhaydock/arti-container:main
PublishPort=127.0.0.1:9150:9150
AutoUpdate=registry
AutoRemove=true

[Install]
WantedBy=default.target
```

```sh
systemctl --user daemon-reload
systemctl --user enable --now arti.service
systemctl --user enable --now podman-auto-update.timer
```

## Launch Tor Browser (Flatpak version) using Arti:
```sh
TOR_PROVIDER=none TOR_SOCKS_PORT=9150 gtk-launch org.torproject.torbrowser-launcher
```

## Permanently override Tor Browser (Flatpak version) to use Arti:
Copy existing `.desktop` file to override it:
```sh
cp -fv /var/lib/flatpak/exports/share/applications/org.torproject.torbrowser-launcher.desktop ~/.local/share/applications/org.torproject.torbrowser-launcher.desktop
```

Add the `--env` vars from above to the `Exec=` line in that newly cloned `.desktop` file:
```ini
Exec=/usr/bin/flatpak run --env=TOR_PROVIDER=none --env=TOR_SOCKS_PORT=9150 --branch=stable --arch=x86_64 --command=torbrowser-launcher --file-forwarding org.torproject.torbrowser-launcher @@u %u @@
```
