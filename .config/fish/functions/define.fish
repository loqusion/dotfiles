function define --wraps='curl dict://dict.org/d:$1 | less' --description 'alias define curl dict://dict.org/d:$1 | less'
  curl dict://dict.org/d:$1 | less $argv
        
end
