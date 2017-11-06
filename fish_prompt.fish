function fish_prompt
    set tmp_status $status
    set_color yellow --bold
    echo -n '>> '
    set_color normal
    if test $tmp_status -eq 0
        set_color brgreen
    else
        set_color brred
    end   
    echo -n $tmp_status
    set_color normal
    echo -n ':'
    if test $USER = root
        set_color $fish_color_cwd_root
        echo -n $PWD
        set_color blue --bold
        echo -n ' # '
    else
        set_color $fish_color_cwd
        echo -n (prompt_pwd)
        set_color grey --bold
        echo -n ' $ '
    end
    set_color normal
end

function fish_right_prompt
    if test $USER = root
        set_color blue --bold
    else
        set_color grey --bold
    end
    echo '<'
    set_color yellow --bold
    echo '< '
    set_color normal
    set_color grey
    date '+%H:%M '
    if test $USER != root
        set_color yellow --bold
        echo '<]'
    end
    set_color normal
end
