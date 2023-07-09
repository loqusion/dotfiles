function which_term --description 'Prints the name of the terminal emulator'
    basename "/"(ps -o cmd -f -p (cat /proc/(echo %self)/stat | cut -d \  -f 4) | tail -1 | sed 's/ .*$//')
end
