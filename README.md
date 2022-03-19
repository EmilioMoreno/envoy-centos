# envoy-centos
Envoy custom binaries for centos7

Credits to https://joeyb.org/posts/running-envoy-on-centos-6-or-centos-7/

Usage
- Create $HOME/envoy directory. Move Dockerfile, glibc and patch_elf inside. Shell scripts in $HOME

./fetch_envoy.sh v1.21.1
./package_centos_envoy.sh

- Grab a beer
- Copy $HOME/envoy/centos-envoy.tar to your desired location and untar
- Remeber envoy needs to be started (cwd) from the current directory as ./lib is a relative path.


