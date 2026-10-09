#!/bin/bash
# painful to remember the rpm/dpkg's related parameters
# could use this general one to map based on which exists
set -euo pipefail

# Auto detect package backend: rpm or dpkg
detect_pkg_backend() {
    if command -v rpm &>/dev/null; then
        echo "rpm"
    elif command -v dpkg &>/dev/null; then
        echo "dpkg"
    else
        echo "unknown"
    fi
}
PKG_BACKEND=$(detect_pkg_backend)

# Print usage help
usage() {
cat <<EOF
pkgutil.sh - unified package query tool for rpm/dpkg
Usage:
  $0 -i <pkgname>      Show installed package info (rpm -qi / dpkg -s)
  $0 -l <pkgname>      List files owned by package (rpm -ql / dpkg -L)
  $0 -f <filepath>     Find which package owns the file (rpm -qf / dpkg -S)
  $0 list              List all installed packages (rpm -qa / dpkg-query)
EOF
}

# Parse short options
while getopts ":i:l:f:" opt; do
    case "${opt}" in
        i)
            PKG="${OPTARG}"
            case "${PKG_BACKEND}" in
                rpm) rpm -qi "${PKG}" ;;
                dpkg) dpkg -s "${PKG}" ;;
                *) echo "ERROR: unsupported package backend" >&2; exit 1 ;;
            esac
            exit $?
            ;;
        l)
            PKG="${OPTARG}"
            case "${PKG_BACKEND}" in
                rpm) rpm -ql "${PKG}" ;;
                dpkg) dpkg -L "${PKG}" ;;
                *) echo "ERROR: unsupported package backend" >&2; exit 1 ;;
            esac
            exit $?
            ;;
        f)
            FILEPATH="${OPTARG}"
            case "${PKG_BACKEND}" in
                rpm) rpm -qf "${FILEPATH}" ;;
                dpkg) dpkg -S "${FILEPATH}" ;;
                *) echo "ERROR: unsupported package backend" >&2; exit 1 ;;
            esac
            exit $?
            ;;
        \?) echo "ERROR: invalid option -${OPTARG}" >&2; usage; exit 1 ;;
        :) echo "ERROR: option -${OPTARG} requires an argument" >&2; usage; exit 1 ;;
    esac
done

# Handle "list" subcommand (no dash option)
if [[ $# -ge 1 && "$1" == "list" ]]; then
    case "${PKG_BACKEND}" in
        rpm) rpm -qa ;;
        dpkg) dpkg-query -W -f='${Package}\t${Version}\n' ;;
        *) echo "ERROR: unsupported package backend" >&2; exit 1 ;;
    esac
    exit $?
fi

# No valid arguments, show usage
usage
exit 1