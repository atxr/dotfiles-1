# foo
export def checkout [
    --git-dir: string = "./.git"  # the git directory of the project (defaults to './.git').
    --work-tree: string = "."     # the base work tree of the project (defaults to '.').
] {
    let local_branches = (
        git --git-dir $git_dir --work-tree $work_tree branch -l |
        lines |
        sort --reverse |
        str replace "^  " $"(ansi green)" |
        str replace -s "* " $"(ansi red)" |
        str replace "$" $"(ansi reset)"
    )
    let remote_branches = (
        git --git-dir $git_dir --work-tree $work_tree branch -r |
        lines |
        sort --reverse |
        find "HEAD -> " --invert |
        str replace "  \([a-z]*\)\/" $"(ansi yellow)${1}(ansi reset) -> (ansi yellow_dimmed)" |
        str replace "$" $"(ansi reset)"
    )

    let branch = (
        $local_branches | append $remote_branches |
        to text |
        fzf --ansi |
        str trim
    )

    if ($branch | empty?) {
        echo "User choose to exit..."
    } else {
        git --git-dir $git_dir --work-tree $work_tree checkout $branch
    }
}
