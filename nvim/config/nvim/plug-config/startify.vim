" Function to show recent Git commits
function! ListCommits()
    let git = 'git -C ' . getcwd()
    if !isdirectory('.git')
        return []
    endif
    let commits = systemlist(git . ' log --oneline | head -n5')
    let git_cmd = 'G' . git[1:]
    return map(commits, '{ "line": matchstr(v:val, "\\s\\zs.*"), "cmd": "' . git_cmd . ' show " . matchstr(v:val, "^\\x\\+") }')
endfunction

" Don't change to directory when selecting a file
let g:startify_files_number = 11
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_session_persistence= 1

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]

if isdirectory('.git')
    call insert(g:startify_lists, {
    \ 'type': {-> ListCommits()},
    \ 'header': ['Recent Commits']
    \ }, 1)
endif


let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
\ ]

let g:startify_bookmarks = [
	\ { 'c': '~/.config/nvim/init.vim' },
	\ { 'g': '~/.gitconfig' },
	\ { 'z': '~/.zshrc' },
	\ { 't': '~/.tmux.conf' }
\ ]

autocmd User Startified setlocal cursorline
nmap <leader>st :Startify<cr>
