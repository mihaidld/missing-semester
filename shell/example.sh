#! /bin/sh

echo "Starting program at $(date)" # Date will be substituted

echo "Running program $0 with $# arguments with pid $$"
# $0 expands to name of the script
# $# expands to nb. of arguments given to script
# $$ expands to process id of the command
# $@ expands to all the arguments given to script
for file in "$@"; do
    # Old way
    # grep foobar "$file" > /dev/null 2> /dev/null
    # # When pattern is not found grep has exit status 1
    # # We redirect STDOUT and STDERR to a null register since we do not care about them

    # # [[]] or test -ne not equal operator
    # if [[ "$?" -ne 0 ]]; then
    #     echo "File $file does not have any foobar, adding one"
    #     echo "# foobar" >> "$file"
    # fi

    # New way (suggested by shellcheck)
    # When pattern is not found grep has exit status 1
    # We redirect STDOUT and STDERR to a null register since we do not care about them
    #  Check exit code directly with e.g. 'if ! mycmd;'
    if ! grep foobar "$file" > /dev/null 2> /dev/null; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    fi
done

