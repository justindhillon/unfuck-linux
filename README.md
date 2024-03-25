# unfuck-linux

Did you `sudo rm -rf` somthing important like `python`, `grub`, or half your system? Did you run a schetchy command you found online that bricked your system? Have some things on your system just never worked right? This is the perfect script to fix all your problems.

The command below scans your system for all your package managers, and then uses them to reinstall all the packages on your system. 

```bash
sh <(curl -L https://github.com/justindhillon/unfuck-linux/reinstall_packages.sh)
```

## Supported package managers

- apt
- dnf
- pip
- npm
- brew
- flatpak

## Contributing

We would love your contirbutions! Add a package manager to support, and I will merge your PR!

## License

`unfuck-link` uses the [`AGPL-3.0 license`](https://github.com/justindhillon/unfuck-linux/blob/main/LICENSE).
