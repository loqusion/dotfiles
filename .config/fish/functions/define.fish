function define --wraps='curl dict://dict.org/d:$1 | less' --wraps='curl dict://dict.org/d:$argv[1] | less' --description 'alias define curl dict://dict.org/d:$argv[1] | less'
    curl -s dict://dict.org/d:$argv[1] | sed -r '/^[0-9]+/d; s/^\.//' | less
end
