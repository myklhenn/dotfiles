function formatted_env() {
    local line_format='{print "\033[33;1m" $1 "\033[30;1m" "=" "\033[0m" $2 }'
    env | sort | awk -F= $line_format
}