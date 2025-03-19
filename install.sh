set -e

process() {
    echo "Building $1"
    nix build ".#$1"
    echo "Installing $1"
    calibre-customize -r "$2"
    calibre-customize -a result
}

process acsm-calibre-plugin "ACSM Input"
process dedrm-plugin "DeDRM"
