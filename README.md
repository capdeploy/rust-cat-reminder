# Cat litter reminder - UPDATED by Brett

This is a pet project (pun intended) for helping cat owners remember to clean the litter box.

## Build notes (MacBook Pro M1)

- use [UTM](https://mac.getutm.app/) and run [Ubuntu ARM](https://ubuntu.com/download/server/arm)
- install the following libraries on the UTM machine: `sudo apt install build-essential llvm libclang-dev`
- use an IDE with remote development [RustRover](https://www.jetbrains.com/rust/), [VSCode](https://code.visualstudio.com/) for development from the Mac

## Raspberry PI prerequisites

- don't use Raspbian, instead use e.g. `Ubuntu 22.10` (more recent GCC)

## Brett Edits
- Build on the RPI as it is easier then getting cross compiling working
- Install Rust
    - curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    - cargo build
    - cargo run
- Create rc.local and /etc/systemd/system/rc-local.service
#!/bin/bash

cd /home/ubuntu/projects/rust-cat-reminder
/root/.cargo/bin/cargo run

[Unit]
Description=Local Startup Script

[Service]
Type=simple
ExecStart=/etc/rc.local

[Install]
WantedBy=multi-user.target
    

