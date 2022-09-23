# foo
export def checkout [
    --git-dir: string = "./.git"  # the git directory of the project (defaults to './.git').
    --work-tree: string = "."     # the base work tree of the project (defaults to '.').
] {
    let local_branches = (
        git --git-dir $git_dir --work-tree $work_tree branch -l |
        lines |
        sort --reverse |
        str replace -s "*" $"(ansi red)*" |
        str replace "^" $"(ansi green)" |
        str replace "$" $"(ansi reset)"
    )
    let remote_branches = (
        git --git-dir $git_dir --work-tree $work_tree branch -r |
        lines |
        sort --reverse
    )

    let branch = (
        $local_branches | append $remote_branches |
        to text |
        fzf --ansi |
        str replace -s "*" "" |
        str trim
    )

    if ($branch | empty?) {
        echo "User choose to exit..."
    } else {
        git --git-dir $git_dir --work-tree $work_tree checkout $branch
    }
}
