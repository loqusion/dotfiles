# https://codeberg.org/dnkl/foot/wiki#fish-1
function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end
