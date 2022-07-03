let s:nerd_font = 'Nerd Font Mono'
let fonts = #{
            \ dank: 'Dank Mono:h16',
            \ gohu: 'GohuFont '..s:nerd_font..':h14',
            \ cascadia_code: 'CaskaydiaCove '..s:nerd_font..':h12',
            \ flex: 'BlexMono '..s:nerd_font..':h12',
            \ iosevka: 'Iosevka '..s:nerd_font..':h13',
            \ agave: 'agave '..s:nerd_font..':h14',
            \ anonymous: 'Anonymice '..s:nerd_font..':h15',
            \ big_blue_terminal: 'BigBlue_TerminalPlus '..s:nerd_font..' Book:h14',
            \ code_new_roman: 'CodeNewRoman '..s:nerd_font..':h14',
            \ cousine: 'Cousine '..s:nerd_font..':h13',
            \ deja_vu: 'DejaVuSansMono '..s:nerd_font..':h14',
            \ droid: 'DroidSansMono '..s:nerd_font..':h14',
            \ fantasque: 'FantasqueSansMono '..s:nerd_font..':h14',
            \ fira_code: 'FiraCode '..s:nerd_font..':h14',
            \ terminess: 'TerminessTTF '..s:nerd_font..':h14',
            \ gomono: 'GoMono '..s:nerd_font..':h13',
            \ hasklig: 'Hasklug '..s:nerd_font..':h14',
            \ inconsolata: 'Inconsolata '..s:nerd_font..':h14',
            \ jetbrains: 'JetBrainsMono '..s:nerd_font..':h14',
            \ lekton: 'Lekton '..s:nerd_font..':h14',
            \ monofur: 'Monofur '..s:nerd_font..':h14',
            \ ubuntu: 'UbuntuMono '..s:nerd_font..':h14',
            \ victor: 'VictorMono '..s:nerd_font..':h14',
            \ proggy: 'ProggyCleanTTSZ '..s:nerd_font..':h14',
            \ monoid: 'Monoid '..s:nerd_font..':h14',
            \ roboto: 'RobotoMono '..s:nerd_font..':h14',
            \ source_code_pro: 'SauceCodePro '..s:nerd_font..':h14',
            \ shure_tech: 'ShureTechMono '..s:nerd_font..':h14',
            \ space_mono: 'SpaceMono '..s:nerd_font..':h14',
            \ }

let &guifont = fonts.gomono
let g:should_disable_transparency = v:true
let g:neovide_transparency = 0.95
let g:neovide_macos_alt_is_meta = 1
let g:neovide_input_macos_alt_is_meta=v:true

cd ~/repos
