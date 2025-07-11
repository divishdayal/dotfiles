"helpers#startify .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" ensure vim-plug is installed and then load it
"call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{
	" Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template

	set number 	" Show current line number
    set relativenumber 	" Show relative line numbers

	set autoread " detect when a file is changed

    set history=1000 " change history to 1000
    set textwidth=120

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamed

	set mouse=n

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}

" Appearance {{{
    set number " show line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=↪
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink
    set updatetime=300
    set signcolumn=yes
    set shortmess+=c

    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

	" highlight current line, but only in active window
	augroup CursorLineOnlyInActiveWindow
		autocmd!
		autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
		autocmd WinLeave * setlocal nocursorline
	augroup END


	" open new split panes to right and bottom, which feels more natural
	set splitbelow
	set splitright

    " toggle invisible characters
    set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    " switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

    if &term =~ '256color'
        " disable background color erase
        set t_ut=
    endif

    " enable 24 bit color support if supported
    if (has("termguicolors"))
        if (!(has("nvim")))
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        set termguicolors
    endif

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

	syntax on
	set t_Co=256
	if &term =~ '256color'
		set t_ut=
	endif
	
    " Load colorschemes
    Plug 'chriskempson/base16-vim'
    Plug 'joshdick/onedark.vim'
	
    " LightLine {{{
		" Load colorschemes
        Plug 'itchyny/lightline.vim'
        Plug 'nicknisi/vim-base16-lightline'
		source $HOME/.config/nvim/plug-config/lightline.vim
    " }}}
" }}}

" General hu50
" mappings {{{
    " set a map leader for more key combos
	noremap <Space> <Nop>
    let mapleader = ' '

    " remap esc
    inoremap jk <esc>

	" remove search highlights
	nnoremap <leader>x :nohl<CR>
    
    " set paste toggle
    " set pastetoggle=<leader>v
	nnoremap <leader>v :set paste!<CR>

    " shortcut to save
    nmap <leader>, :w<cr>

    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
    " edit gitconfig
    map <leader>eg :e! ~/.gitconfig<cr>

    " moving up and down work as you would expect
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

	nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
	nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

	"quicker window movement
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	" toggle relative numbering
	nnoremap <C-n> :set rnu!<CR>

	" To apply the macro to all lines you need a little trick I learned from Drew Neil's
	" awesome book practical vim. Add the following script (visual-at.vim) to your vim
	" configuration. This allows you to visually select a section and then hit @ to run a
	" macro on all lines. Only lines which match will change. Without this script the
	" macro would stop at lines which dont match the macro.
	function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
	endfunction
	xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" }}}

" General Functionality {{{
	" display markdown
	Plug 'vim-pandoc/vim-pandoc' 
	Plug 'vim-pandoc/vim-pandoc-syntax' 

	" Autosave
	Plug '907th/vim-auto-save'
	let g:auto_save = 1  " enable AutoSave on Vim startup
	let g:auto_save_silent = 1  " do not display the auto-save notification

	Plug 'scrooloose/syntastic'
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_python_checkers = ['pyflakes', 'pylint']
	let g:syntastic_ruby_checkers          = ['rubocop']
	"let g:syntastic_always_populate_loc_list = 1
	"let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

	" illuminate variable/word under the cursor
		Plug 'rrethy/vim-illuminate'
		
	" Code commenter
		Plug 'scrooloose/nerdcommenter'
		nnoremap <leader>c <Plug>NERDCommenterToggle
		
	" coc 
        Plug 'neoclide/coc.nvim', {'branch': 'release'}	
		source $HOME/.config/nvim/plug-config/coc.vim

	" vim-fugitive {{{
        Plug 'tpope/vim-fugitive'
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>

        Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'sodapopcan/vim-twiggy'
        Plug 'rbong/vim-flog'
    " }}}
	
	" UltiSnips {{{
		Plug 'SirVer/ultisnips' " Snippets plugin
		let g:UltiSnipsExpandTrigger="<C-l>"
		let g:UltiSnipsJumpForwardTrigger="<C-j>"
		let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    " }}}
	
    " Startify: Fancy startup screen for vim
        Plug 'mhinz/vim-startify'
		source $HOME/.config/nvim/plug-config/startify.vim
	
	" NERDTree
	Plug 'preservim/nerdtree' | 
				\ Plug 'Xuyuanp/nerdtree-git-plugin' 
	source $HOME/.config/nvim/plug-config/nerdtree.vim

	" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	source $HOME/.config/nvim/plug-config/fzf.vim
	
	" buffergator
	Plug 'jeetsukumaran/vim-buffergator'
	let g:buffergator_suppress_keymaps = 1
	nnoremap <leader>b :BuffergatorToggle<CR>

	" gundo
	Plug 'sjl/gundo.vim'
	nnoremap <leader>u :GundoToggle<CR>
	if has('python3')
		let g:gundo_prefer_python3 = 1
	endif

	" ag / ack.vim
	Plug 'mileszs/ack.vim' "{{{
		command -nargs=+ Gag Gcd | Ack! <args>
		nnoremap K :Gag "\b<C-R><C-W>\b"<CR>:cw<CR>
		if executable('ag')
			let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
			let g:ackprg = 'ag --vimgrep'
		endif
		
		"don't want to jump to the first result automatically
		cnoreabbrev Ack Ack!
		nnoremap <Leader>a :Ack!<Space>
	"}}}

	Plug 'easymotion/vim-easymotion'
	map <leader> <Plug>(easymotion-prefix)
	let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz;'

	nmap s <Plug>(easymotion-s2)
	nmap t <Plug>(easymotion-t2)

	map <Leader>l <Plug>(easymotion-lineforward)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	map <Leader>h <Plug>(easymotion-linebackward)
	let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	let g:EasyMotion_smartcase = 1

	" Easymotion causes errors after motion
	 let g:easymotion#is_active = 0
	function! EasyMotionCoc() abort
	if EasyMotion#is_active()
		let g:easymotion#is_active = 1
		CocDisable
	else
		if g:easymotion#is_active == 1
		let g:easymotion#is_active = 0
		CocEnable
		endif
	endif
	endfunction
	autocmd TextChanged,CursorMoved * call EasyMotionCoc()

	" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
	" Without these mappings, `n` & `N` works fine. (These mappings just provide
	" different highlight method and have some other features )
	"map  n <Plug>(easymotion-next)
	"map  N <Plug>(easymotion-prev)

	" incsearch
	"Plug 'haya14busa/incsearch.vim'
	"map / <Plug>(incsearch-forward)
	"map ? <Plug>(incsearch-backward)
	"map g/ <Plug>(incsearch-stay)

	" incsearch-easymotion
	"Plug 'haya14busa/incsearch-easymotion.vim'
	"map z/ <Plug>(incsearch-easymotion-/)
	"map z? <Plug>(incsearch-easymotion-?)
	"map zg/ <Plug>(incsearch-easymotion-stay)

	"argwrap
	Plug 'FooSoft/vim-argwrap'
	nnoremap <leader>w :ArgWrap<CR>
	
	" CSV color coding
	Plug 'mechatroner/rainbow_csv'         

	" Rainbox Parenthesis
	Plug 'frazrepo/vim-rainbow'
	let g:rainbow_active = 1

	"tagbar
	Plug 'majutsushi/tagbar'
	map <leader>t :TagbarToggle<CR>

call plug#end()

" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        let g:onedark_termcolors=16
        let g:onedark_terminal_italics=1
        colorscheme onedark
    endif
    syntax on
    filetype plugin indent on
    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    " make comments and HTML attributes italic
    highlight Comment cterm=italic term=italic gui=italic
    highlight htmlArg cterm=italic term=italic gui=italic
    highlight xmlAttrib cterm=italic term=italic gui=italic
   " highlight Type cterm=italic term=italic gui=italic
    highlight Normal ctermbg=none
" }}}fzi

let g:python3_host_prog = ''

if executable("python3")
  " get local python from $PATH (virtualenv/anaconda or system python)
  let s:python3_local = substitute(system("which python3"), '\n\+$', '', '')

  function! Python3_determine_pip_options()
    if system("python3 -c 'import sys; print(sys.prefix != getattr(sys, \"base_prefix\", sys.prefix))' 2>/dev/null") =~ "True"
      " This is probably a user-namespace virtualenv python. `pip` won't accept --user option.
      " See pip._internal.utils.virtualenv._running_under_venv()
      let l:pip_options = '--upgrade --ignore-installed'
    else
      " Probably system(global) or anaconda python.
      let l:pip_options = '--user --upgrade --ignore-installed'
    endif
    " mac: Force greenlet to be compiled from source due to potential architecture mismatch (pynvim#473)
    if s:uname ==? 'Darwin'
      let l:pip_options = l:pip_options . ' --no-binary greenlet'
    endif
    return l:pip_options
  endfunction

  " Detect whether neovim package is installed; if not, automatically install it
  " Since checking pynvim is slow (~200ms), it should be executed after vim init is done.
  call timer_start(0, { -> s:autoinstall_pynvim() })
  function! s:autoinstall_pynvim()
    if empty(g:python3_host_prog) | return | endif
    let s:python3_neovim_path = substitute(system(g:python3_host_prog . " -c 'import pynvim; print(pynvim.__path__)' 2>/dev/null"), '\n\+$', '', '')
    if empty(s:python3_neovim_path)
      " auto-install 'neovim' python package for the current python3 (virtualenv, anaconda, or system-wide)
      let s:pip_options = Python3_determine_pip_options()
      execute ("!" . s:python3_local . " -m pip install " . s:pip_options . " pynvim")
      if v:shell_error != 0
        call s:show_warning_message('ErrorMsg', "Installation of pynvim failed. Python-based features may not work.")
      endif
    endif
  endfunction

  " Assuming that pynvim package is available (or will be installed later), use it as a host python3
  let g:python3_host_prog = s:python3_local
else
  echoerr "python3 is not found on your system. Most features are disabled."
  let s:python3_local = ''
endif

" Fallback to system python3 (if not exists)
if empty(glob(g:python3_host_prog)) | let g:python3_host_prog = '/usr/local/bin/python3' | endif
if empty(glob(g:python3_host_prog)) | let g:python3_host_prog = '/usr/bin/python3'       | endif
if empty(glob(g:python3_host_prog)) | let g:python3_host_prog = s:python3_local          | endif

" Get and validate python version
try
  if executable('python3')
    let g:python3_host_version = split(system("python3 --version 2>&1"))[1]   " e.g. Python 3.7.0 :: Anaconda, Inc.
  else | let g:python3_host_version = ''
  endif
catch
  let g:python3_host_version = ''
endtry

" Warn users if modern python3 is not found.
" (with timer, make it shown frontmost over other warning messages)
if empty(g:python3_host_version)
  call timer_start(0, { -> s:show_warning_message('ErrorMsg',
        \ "ERROR: You don't have python3 on your $PATH. Most features are disabled.")
        \ })
elseif g:python3_host_version < '3.6.1'
  call timer_start(0, { -> s:show_warning_message('WarningMsg',
        \ printf("Warning: Please use python 3.6.1+ to enable intellisense features. (Current: %s)", g:python3_host_version))
        \ })
endif

function! ListCommits()
    let git = 'git -C ' . getcwd()
    let commits = systemlist(git . ' log --oneline | head -n5')
    let git_cmd = 'G' . git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git_cmd .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction


