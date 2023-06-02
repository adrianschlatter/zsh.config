# timewarrior completion script

# Specify the location of the timew executable
_timewarrior_cmd=`which timew`

# Define the completion function
_timewarrior_completion() {
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _arguments \
        '1: :->command' \
        '*: :->args'

    case $state in
        (command)
            local commands
            commands=(
                "cancel:cancel the most recent interval"
                "continue:continue the most recent interval"
                "day:show a summary of work done today"
                "export:export the data to a file"
                "help:display help for a specific command"
                "import:import data from a file"
                "log:show a log of work done"
                "now:show the current tracking status"
                "shorten:shorten the specified interval"
                "split:split the specified interval"
                "start:start a new interval"
                "status:show the tracking status"
                "stop:stop the most recent interval"
                "summary:show a summary of work done"
                "tag:add or remove tags from intervals"
                "track:start or stop tracking time"
                "week:show a summary of work done this week"
                "month:show a summary of work done this month"
                "year:show a summary of work done this year"
            )
            _describe "command" commands
            ;;
        (args)
            case $words[2] in
                (cancel)
                    _files
                    ;;
                (continue)
                    _files -g "*.track"
                    ;;
                (export)
                    _files -g "*.json"
                    ;;
                (import)
                    _files -g "*.json"
                    ;;
                (help)
                    _files -g "*(:t)"
                    ;;
                (log)
                    _files
                    ;;
                (shorten)
                    _files -g "*.track"
                    ;;
                (split)
                    _files -g "*.track"
                    ;;
                (start)
                    _files
                    ;;
                (stop)
                    _files -g "*.track"
                    ;;
                (tag)
                    _files -g "*.track"
                    ;;
                (track)
                    _files
                    ;;
            esac
            ;;
    esac
}

# Register the completion function
compdef _timewarrior_completion $_timewarrior_cmd

