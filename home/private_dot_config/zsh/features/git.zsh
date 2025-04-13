# Git formatter function
my_git_formatter() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

# Git status function
git_status() {
    local status=$(git status --porcelain 2>/dev/null)
    if [ -n "$status" ]; then
        echo "*"
    fi
}

# Git prompt function
git_prompt() {
    local branch=$(my_git_formatter)
    local status=$(git_status)
    if [ -n "$branch" ]; then
        echo "$branch$status"
    fi
} 