" lightline configs
let g:lightline = {
	\   'colorscheme': 'base16',
	\   'active': {
	\       'left': [ [ 'mode', 'paste' ],
	\               [ 'gitbranch'],
	\               [ 'readonly', 'filename' ]],
	\       'right': [ [ 'percent' ], [ 'lineinfo' ],
	\               [ 'gitblame', 'cocstatus', 'linter_errors', 'linter_warnings' ]]
	\   },
	\ 'inactive': {
    \   'left': [ [ 'relativepath' ] ]
    \},
	\   'component_expand': {
	\   },
	\   'component_type': {
	\       'readonly': 'error',
	\       'linter_warnings': 'warning',
	\       'linter_errors': 'error'
	\   },
	\   'component_function': {
	\       'fileencoding': 'helpers#lightline#fileEncoding',
	\       'filename': 'helpers#lightline#fileName',
	\       'fileformat': 'helpers#lightline#fileFormat',
	\       'filetype': 'helpers#lightline#fileType',
	\		'gitbranch': 'FugitiveHead',
	\       'cocstatus': 'coc#status',
	\       'gitblame': 'helpers#lightline#gitBlame'
	\   },
	\   'tabline': {
	\       'left': [ [ 'tabs' ] ],
	\       'right': [ [ 'close' ] ]
	\   },
	\   'tab': {
	\       'active': [ 'filename', 'modified' ],
	\       'inactive': [ 'filename', 'modified' ],
	\   },
	\   'separator': { 'left': '', 'right': '' },
	\   'subseparator': { 'left': '', 'right': '' }
\ }
