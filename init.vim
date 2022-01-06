" export XDG_CONFIG_HOME="$HOME/.config"" global nvim behavior setting
set clipboard=unnamed
set nowrap
" set nu
set autowriteall
set mouse=a
"set listchars=tab:>~,nbsp:_,trail:.
"set list

" specify a directory for plugins
"  - For Neovim: stdpath('data') . '/plugged'
"  - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Use release branch (recommend)
        Plug 'preservim/nerdtree'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mileszs/ack.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-dispatch'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-project.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'mhinz/vim-startify'
	Plug 'mihaifm/bufstop'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'hrsh7th/nvim-compe'
" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()


"Disable preview for find files
nnoremap <C-p> :lua require('telescope.builtin').find_files({previewer = false})<cr>

"Change change prompt prefix for find_files builtin function:
nnoremap <leader>fg :lua require('telescope.builtin').live_grep({ prompt_prefix=🔍 })<cr>
nnoremap <leader>fg :Telescope live_grep prompt_prefix=?<cr>
nnoremap <f2> :lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<cr>

:nnoremap <C-n> :NERDTreeToggle<CR>
:nnoremap <C-g> :NERDTreeFind<CR>


" coc-vim
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-reference)
nmap <F8> <Plug>(coc-diagnostic-prev)
nnoremap <silent><leader>gr :<C-u>call CocAction('jumpReferences')<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
highlight CocWarningFloat ctermfg=gray  guifg=gray guibg=black
highlight CocErrorFloat ctermfg=gray  guifg=gray guibg=#292726

" buffer map
map; :Bufstop<CR>             " get a visual on the buffers
" map ; :BufstopPreview<CR>      " switch files by moving inside the window
map <leader>a :BufstopModeFast<CR>     " a command for quick switching
map <C-tab>   :BufstopBack<CR>
map <S-tab>   :BufstopForward<CR>
let g:BufstopAutoSpeedToggle = 1       " now I can press ,3,3,3 to cycle the last 3 buffers


" goto project root
let g:rp = "C:/Users/xniu5/LiveProduct.Library.ViewCommon"


" --------------------------------------------my functions -------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap <silent> n  n:call  HLNext(0.4)<cr>
nnoremap <silent> N  N:call  HLNext(0.4)<cr>
nnoremap <silent> *  *:call  HLNext(0.4)<cr>

function! HLNext(blinktime)
	set invcursorline
	redraw
	exec 'sleep '. float2nr(a:blinktime* 1000) . 'm'
	set invcursorline
	redraw
endfunction

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


"------------------lua ----------------------------------------
" telescope project 

lua << EOF
require('telescope').load_extension('project')
require('telescope').setup {
	  extensions = {
	    project = {
	      base_dirs = {
		'C:/Users/xniu5/projects',
	      
	      hidden_files = false -- default: false
	  }
	}
 }
}
EOF


" automatic closing brackets
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
