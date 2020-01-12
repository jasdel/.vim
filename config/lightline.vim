set noshowmode

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\   'right': [ [ 'lineinfo' ],
	\              [ 'fileformat', 'fileencoding', 'filetype' ] ],
	\ },
	\ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'lineinfo' ] ],
	\ },
	\ 'component_function': {
	\   'gitbranch': 'fugitive#head',
	\ },
    \ 'mode_map': {
	\   'n' : 'N',
	\   'i' : 'I',
	\   'R' : 'R',
	\   'v' : 'V',
	\   'V' : 'VL',
	\   "\<C-v>": 'VB',
	\   'c' : 'C',
	\   's' : 'S',
	\   'S' : 'SL',
	\   "\<C-s>": 'SB',
	\   't': 'T',
	\ },
	\ }

set laststatus=2
