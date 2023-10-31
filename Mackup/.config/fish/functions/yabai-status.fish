function yabai-status
    switch $argv[1]
        case "logs"
            echo "Handling logs..."
		# view the last lines of the error log
		tail -f /us/local/var/log/yabai/yabai.err. log
        case "errors"
            echo "Handling errors..."
		# view the last lines of the debug log
		tail -f /usr/local/var/log/yabai/yabai.out. log
        case "*"
            echo "Invalid argument. Please use 'logs' or 'errors'."
    end
end
