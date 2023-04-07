#!/usr/bin/env bash
# Shell script template

DEBUG="true"
VERSION="1.0.0"

cd "$(dirname "$0")"
source common.sh

function usage() {
    info "Script description"
    info "   v$VERSION"
    info "   Usage: $ ./script.sh [OPTIONS]"
    info "   Options:"
    info "     -h, --help           string   Display the help."
    info "     -o, --option         string   Option 1"
    exit 1
}

OPTION=
VALID_OPTIONS=("opt1" "opt2" "opt3" "opt4")

function parse_arguments() {
    debug "Arguments ($#): $*"
    while :; do
        case $1 in
            -h|-\?|--help)
                usage
                exit
                ;;
            -o|--option)
                if [ "$2" ]; then
                    OPTION=$2
                    shift
                else
                    error "'-o, --option' requires a non-empty option argument."
                    exit 1
                fi
                ;;
            --)              # End of all options.
                shift
                break
                ;;
            -?*)
                warn 'Unknown option (ignored): %s' "$1"
                ;;
            *)               # Default case: No more options, so break out of the loop.
                break
        esac

        shift
    done
}

function is_included() {
    if [[ "${VALID_OPTIONS[*]}" =~ "$1" ]]; then
        info "$1 included."
        return 0
    else
        warn "$1 not included."
        return 1
    fi
}

function main() {
    parse_arguments $*

    info "Info message..."
    warn "Warn message..."
    error "Error message..."

    is_included "opt1"
    local retval=$?
    if [[ "$retval" -eq 0 ]]; then
        info "- included!"
    fi

    is_included "opt5"
    local retval=$?
    if [[ "$retval" -eq 1 ]]; then
        info "- not included!"
    fi

    usage
}

main $*

exit 0
