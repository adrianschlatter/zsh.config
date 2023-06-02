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
		"annotate:add annotation to intervals"
                "cancel:cancel time tracking"
		"config:get and set timewarrior configuration"
                "continue:resume tracking of existing interval"
                "day:display day chart"
		"delete:delete intervals"
		"diagnostics:show diagnostic information"
                "export:export tracked time in JSON"
		"extensions:list available extensions"
		"gaps:display time tracking gaps"
		"get:display DOM values"
                "help:display help"
		"join:join intervals"
		"lengthen:lengthen intervals"
		"modify:change start or end time of an interval"
                "month:display month chart"
		"move:change interval start time"
                "shorten:shorten intervals"
		"show:display configuration"
                "split:split intervals"
                "start:start time tracking"
                "stop:stop time tracking"
                "summary:display a time-tracking summary"
                "tag:add tags to intervals"
		"tags:display a list of tags"
                "track:add intervals to the database"
		"undo:undo timewarrior commands"
		"untag:remove tags from intervals"
                "week:display week chart"
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

