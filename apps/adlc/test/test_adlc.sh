#!/bin/bash
#
# test script for adlc command line utility
#

screen_height=`tput lines`

title="adlc examples"
prompt="Choice:"
verbose=
adlc_path=.

commands=( \
"adlc --help" \
"adlc -q -s" \
"adlc -q -p CKM -l" \
"adlc -q -p CKM -d" \
"adlc -q -p CKM -a list .*body.*" \
"adlc -q -p CKM -a validate .*body_temp.*" \
"adlc -q -p CKM -a serialise .*body_temp.*" \
"adlc -q -p CKM -a validate .*problem-diagnosis.*" \
"adlc -q -p CKM -a serialise .*problem-diagnosis.*" \
"adlc -q -p CKM --flat -a serialise .*problem-diagnosis.*" \
)
options=(\
"get usage: ${commands[0]}" \
"show config: ${commands[1]}" \
"list all archetypes in a profile: ${commands[2]}" \
"display all archetypes in a profile: ${commands[3]}" \
"list all archetypes in profile matching pattern: ${commands[4]}" \
"validate body_temperature archetype: ${commands[5]}" \
"serialise body_temperature archetype: ${commands[6]}" \
"validate problem-diagnosis archetype: ${commands[7]}" \
"serialise differential problem-diagnosis archetype: ${commands[8]}" \
"serialise flat problem-diagnosis archetype: ${commands[9]}" \
)

while [ $# -gt 0 ]
do
    case "$1" in
        -v) verbose=Y;;
        -d) adlc_path="$2/"; shift;;
        --) shift; break;;
        -*) echo >&2 \
            "usage: $0 [-d adlc_home_dir]"
            exit 1;;
        *)  break;;
    esac
    shift
done


echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 
    case "$REPLY" in
        [1-9] | 10 ) 
            cmd_idx=$((${REPLY}-1))
            result="`$adlc_path/${commands[$cmd_idx]}`"
            if [ `echo "$result" | wc -l` -gt $screen_height ]; then
                echo "$result" | less
            else
                echo "$result"
            fi
            ;;

        $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;

        *) echo "Invalid option.";continue;;

    esac
done

