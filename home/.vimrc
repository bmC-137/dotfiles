" A .vimrc


set nocompatible
set encoding=utf-8
set fileencoding=utf8
set fileformat=unix
set hidden

set backup
set backupdir=~/.vim/backup//
set writebackup
set backupcopy=yes
"filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

set splitbelow
set splitright

" set timeout timeoutlen=1200 ttimeoutlen=300
set ttimeout timeoutlen=1000 ttimeoutlen=300
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"
Plug 'tpope/vim-sensible'

Plug 'junegunn/vim-easy-align'

"
Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'https://github.com/gcmt/taboo.vim'

set sessionoptions+=tabpages,globals
" set guioptions-=e
" TabooRename <tabname> Renames the current tab with the name provided.
" TabooOpen <tabname> Opens a new tab and and gives it the name provided.
" TabooReset Removes the custom label associated with the current tab.



Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened).
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline_powerline_fonts = 1
let g:airline_theme='atomic'
let g:airline_section_x = '%F'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


Plug 'vim-airline/vim-airline-themes'
Plug 'noah/vim256-color'

Plug 'https://github.com/Yggdroot/indentLine'

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_term = 239
" let g:indentLine_setColors = 0
" let g:indentLine_enabled = 0



Plug 'preservim/nerdtree'
"Plug 'unkiwii/vim-nerdtree-sync'
Plug 'https://github.com/tpope/vim-commentary'
"Plug 'mbbill/undotree'

Plug 'jmcantrell/vim-virtualenv'

Plug 'tpope/vim-fugitive'

Plug 'edkolev/tmuxline.vim'

Plug 'cohama/lexima.vim'
" lexima rules for '%','<','<Space>'
autocmd filetype html call lexima#add_rule({
    \ 'char': '%',
    \ 'at': '{\%#}',
    \ 'input_after': '<Space><Space>%',
    \ 'mode': 'i',
    \ 'leave': 1,
    \ 'filetype': 'html',
    \ })
autocmd filetype html call lexima#add_rule({
    \ 'char': '<',
    \ 'input_after': '>',
    \ 'filetype': ['html', 'jinja', 'htmljinja', 'django', 'htmldjango', 'liquid', 'twig', 'html.twig', 'mako', 'xml'],
    \ })
autocmd filetype html call lexima#add_rule({
    \ 'char': '<Space>',
    \ 'at': '{{\%#',
    \ 'input_after': '<Space>',
    \ 'filetype': ['html', 'jinja', 'htmljinja', 'django', 'htmldjango', 'liquid', 'twig', 'html.twig', 'mako', 'xml'],
    \ })

" Plug 'pearofducks/ansible-vim'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
" Available flags (bold are defaults):

"a: highlight all instances of key=
"o: highlight only instances of key= found on newlines
"d: dim the instances of key= found
"b: brighten the instances of key= found
"n: turn this highlight off completely
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'

"
let g:ansible_normal_keywords_highlight = 'Constant'
" Accepts any syntax group name from :help E669 - e.g. Comment, Constant, and Identifier
" Note: Defaults to 'Statement' when not set.
"
"
let g:ansible_unindent_after_newline = 1
"When this variable is set, indentation will completely reset (unindent to column 0) after two newlines in insert-mode. The normal behavior of YAML is to always keep the previous indentation, even across multiple newlines with no content.
"
"
let g:ansible_extra_keywords_highlight = 1
" Note: This option is enabled when set, and disabled when not set.
" 
" Highlight the following additional keywords in playbooks:
" register always_run changed_when failed_when no_log args vars delegate_to ignore_errors
" 
" By default we only highlight:
" include until retries delay when only_if become become_user block rescue always notify
"
let g:ansible_normal_keywords_highlight = 'Constant'

" Accepts any syntax group name from :help E669 - e.g. Comment, Constant, and Identifier

" Note: Defaults to 'Statement' when not set.

" This option change the highlight of the following common keywords in playbooks: include until retries delay when only_if become become_user block rescue always notify"

let g:ansible_with_keywords_highlight = 'Constant'

" Accepts any syntax group-name from :help E669 - e.g. Comment, Constant, and Identifier

" Note: Defaults to 'Statement' when not set.

" This option changes the highlight of all with_.+ keywords in playbooks.

" let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }

" Accepts a dictionary in the form of 'regex-for-file': 'filetype'.

"     regex-for-file will receive the full filepath, so directory matching can be done.
"     filetype is the root filetype to be applied, jinja2 will be automatically appended

" All files ending in *.j2 that aren't matched will simply get the jinja2 filetype

let g:ansible_goto_role_paths = './roles,../_common/roles,../roles'

function! FindAnsibleRoleUnderCursor()
  if exists("g:ansible_goto_role_paths")
    let l:role_paths = g:ansible_goto_role_paths
  else
    let l:role_paths = "./roles"
  endif
  let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
  let l:found_role_path = findfile(l:tasks_main, l:role_paths)
  if l:found_role_path == ""
    echo l:tasks_main . " not found"
  else
    execute "edit " . fnameescape(l:found_role_path)
  endif
endfunction

" au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
" au BufRead,BufNewFile */ansible/*.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
au BufEnter,BufNewFile */ansible/*.y[a]\\\{0,1\}ml nnoremap <silent> <leader>gr :call FindAnsibleRoleUnderCursor()<CR>


Plug 'stephpy/vim-yaml'

" Plug 'andrewstuart/vim-kubernetes' "https://github.com/andrewstuart/vim-kubernetes

" Plug 'ap/vim-buftabline' "https://github.com/ap/vim-buftabline

" Plug 'kana/vim-textobj-user'  "https://github.com/kana/vim-textobj-user
" Plug 'bps/vim-textobj-python' "https://github.com/bps/vim-textobj-python
" Plug 'terryma/vim-expand-region' "https://github.com/terryma/vim-expand-region
" Plug 'https://github.com/kana/vim-textobj-line'
" Plug 'https://github.com/kana/vim-textobj-entire'


Plug 'farmergreg/vim-lastplace'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0



Plug 'ycm-core/YouCompleteMe'

"Plug 'tmhedberg/SimpylFold'
"Plug 'Konfekt/FastFold'

Plug 'nvie/vim-flake8'

Plug 'thaerkh/vim-workspace'

Plug 'sirver/ultisnips'

Plug 'honza/vim-snippets'


"https://github.com/camspiers/lens.vim
Plug 'camspiers/lens.vim'
let g:lens#disabled = 0
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']

let g:lens#animate = 1

let g:lens#height_resize_max = 30
let g:lens#height_resize_min = 5
let g:lens#width_resize_max = 80
let g:lens#width_resize_min = 20

" Resizes the window to respect minimal lens configuration
" function! lens#run() abort

" Toggles the plugin on and off
" function! lens#toggle() abort

" When current is smaller than target, returns target if target is within bounds otherwise returns a value closest to target within bounds.
" function! lens#get_size(current, target, resize_min, resize_max) abort

" Gets the rows of the current window
" function! lens#get_rows() abort

" Gets the cols of the current window
" function! lens#get_cols() abort




"https://github.com/camspiers/animate.vim
"
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled = 1
Plug 'ferrine/md-img-paste.vim'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
"
Plug 'camspiers/animate.vim'

nnoremap <silent> <C-Down>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <C-Up>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <C-Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <C-Right> :call animate#window_delta_width(-10)<CR>


"By default Animate.vim distributes space of non-animating windows while resizing this can be destructive to intended window sizes when those sizes aren't fixed. To disable:
"let g:animate#distribute_space = 0

"Animation duration in milliseconds can be controlled via a global flag:
"let g:animate#duration = 300.0
"
"
"Animation easing can be controlled via a global flag:
"let g:animate#easing_func = 'animate#ease_linear'

"
"
"https://github.com/sunaku/vim-shortcut
Plug 'sunaku/vim-shortcut'

" https://github.com/liuchengxu/vim-which-key
Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>






call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1
syntax on


nnoremap <Leader>tn :tabnew<CR>

" inoremap <C-C> <Esc>`^
setglobal wildmenu
setglobal wildmode=full
set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*.pdf,*.docx,*.xlsx,*.png
setglobal wildignore+=tags,.*.un~,*.pyc


au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

"" Go
au BufNewFile,BufRead *.go set noexpandtab
au BufNewFile,BufRead *.go set colorcolumn=80
au BufNewFile,BufRead *.go set shiftwidth=8
au BufNewFile,BufRead *.go set softtabstop=8
au BufNewFile,BufRead *.go set tabstop=8

"" Python
au BufNewFile,BufRead *.py set colorcolumn=100
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set tabstop=4
"au BufNewFile,BufRead *.py setlocal foldmethod=indent
au BufNewFile,BufRead *.py vmap <CR> :s/\(^\s*\)/\1# /<CR>:let @/ = ""<CR>
au BufNewFile,BufRead *.py vmap <S-CR> :s/\(^\s*\)# /\1/<CR>:let @/ = ""<CR>

"" Markdown
au BufNewFile,BufRead *.md set colorcolumn=80
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.md set spell
au BufNewFile,BufRead *.md set textwidth=120
" wrap the paragraph the cursor is in
au BufNewFile,BufRead nmap gb {jpg}
" wrap the highlighted text
au BufNewFile,BufRead vmap <CR> gq

"""""""""""""""""""""""""""""""""""Remember position""""""""""""""""""""""

"Remember last position in Vim
"
"files to ignore by setting g:lastplace_ignore
let g:lastplace_ignore = "gitrebase,svn,hgcommit"

"buffer types to ignore by setting g:lastplace_ignore_buftype
"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"


""""""""""""""""""""""""""""Folds""""""""""""""""""""""""""""
"Closed folds are automatically opened when jumping to the last edit position.
"let g:lastplace_open_folds = 0

"nnoremap <space> za



"""""""""""""""Auto-Save enabled"""""""""""""""
"
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa


""""""""""""""Color"""""""""""""""""""""""""""""
 "Colorschemes
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 236
colo seoul256
"colorscheme seoul256
"set background=dark
colo gruvbox

""""""""""""""""""""""""""""""""NERDTree""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinPos = "right"

"Ignore .pyc and do not show it in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeQuitOnOpen = 1
"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"How can I close vim if the only window left open is a NERDTree?
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""NerdTree tabs"""
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_console_startup=1

""NERDTree plug-mappings available
"<plug>NERDTreeTabsOpen
"<plug>NERDTreeTabsClose
"<plug>NERDTreeTabsToggle
"<plug>NERDTreeTabsFind
"<plug>NERDTreeMirrorOpen
"<plug>NERDTreeMirrorToggle
"<plug>NERDTreeSteppedOpen
"<plug>NERDTreeSteppedClose



""""""""""""""""""""""""""YAML""""""""""""""""""""""""""
" YAML conf
let g:ansible_yamlKeyName = 'yamlKey'
" This option exists to provide additional compatibility with stephpy/vim-yaml.


"""""""""""""""""""""""""mappings""""""""""""""""""""""""""""
:let mapleader = ","

" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','

:nnoremap <leader>evv :split $MYVIMRC<cr>
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>ve :source $MYVIMRC<cr>

" copy paste with the exterior buffers
" vmap <C-c> "+y
" vmap <C-x> "+c
" vmap <C-v> "+gP
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa
" nnoremap <C-v> i<ESC>"+pa<ESC>"
"
" set mouse=a		" Enable mouse usage (all modes)

"nnoremap <leader>r :REPLToggle

"
"nmap oo m`o<Esc>``
nnoremap oo o<Esc>k
nnoremap OO O<Esc>j

imap jk <Esc>
imap jj <Esc>



"remove add comments on new line with 'o' in vim
"au FileType * set fo-=c fo-=r fo-=o'
"nnoremap <Leader>o o<Esc>^Da

" :nnoremap <leader>k :q<CR>
" map <C-k> :q<CR>
nnoremap <C-c> :q<CR>
nnoremap <C-c-c> :q!<CR>
nnoremap <leader>kk :w<space>!sudo<space>tee<space>%<space><CR>

"normal mode add space and esc
nnoremap <space> i<space><Esc>


""""""""""""""""""""""""""""""""""""""""""""""Text Objects""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/bps/vim-textobj-python
"https://github.com/Julian/vim-textobj-brace
"https://github.com/kana/vim-textobj-user/wiki
"https://github.com/kana/vim-textobj-user
"


"let g:textobj_python_no_default_key_mappings = 1

"https://github.com/terryma/vim-expand-region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

"Default settings. (NOTE: Remove comments in dictionary before sourcing)
"let g:expand_region_text_objects = {
      "\ 'iw'  :0,
      "\ 'iW'  :0,
      "\ 'i"'  :0,
      "\ 'i''' :0,
      "\ 'i]'  :1, "Support nesting of square brackets
      "\ 'ib'  :1, "Support nesting of parentheses
      "\ 'iB'  :1, "Support nesting of braces
      "\ 'il'  :0, "'inside line'. Available through https://github.com/kana/vim-textobj-line
      "\ 'ip'  :0,
      "\ 'ie'  :0, "'entire file'. Available through https://github.com/kana/vim-textobj-entire
      "\ }

"Extend the global default (NOTE: Remove comments in dictionary before sourcing)
"call expand_region#custom_text_objects({
      "\ "\/\\n\\n\<CR>": 1, "Motions are supported as well. Heres a search motion that finds a blank line
      "\ 'a]' :1, " Support nesting of 'around' brackets
      "\ 'ab' :1, " Support nesting of 'around' parentheses
      "\ 'aB' :1, " Support nesting of 'around' braces
      "\ 'ii' :0, " 'inside indent'. Available through https://github.com/kana/vim-textobj-indent
      "\ 'ai' :0, " 'around indent'. Available through https://github.com/kana/vim-textobj-indent
      "\ })



"call textobj#user#map('python', {
			"\   'class': {
      "\     'select-a': '<buffer>ac',
      "\     'select-i': '<buffer>ic',
      "\     'move-n': '<buffer>]pc',
      "\     'move-p': '<buffer>[pc',
      "\   },
      "\   'function': {
      "\     'select-a': '<buffer>af',
      "\     'select-i': '<buffer>if',
      "\     'move-n': '<buffer>]pf',
      "\     'move-p': '<buffer>[pf',
      "\   }
      "\ })]'
      "}]'
      "}
"})

xmap aF <Plug>(textobj-python-function-a)
omap aF <Plug>(textobj-python-function-a)
xmap iF <Plug>(textobj-python-function-i)
omap iF <Plug>(textobj-python-function-i)

"call expand_region#custom_text_objects('python', {
      "\ 'af' :1,
      "\ 'if' :1,
      "\ 'ac' :1,
      "\ 'ic' :1,
      "\ 
"})
"
"
"
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""YouCompleteMe""""""""""""""""""""""""""""""""""""""""""

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 1

let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1,
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \ 'txt':1,
      \ 'sh':1,
      \ 'yml':1,
      \ 'conf':1
      \}


let g:ycm_show_diagnostics_ui = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'

let g:ycm_complete_in_comments = 0

let g:ycm_complete_in_strings = 1

let g:ycm_log_level = 'info'

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

let g:ycm_use_ultisnips_completer = 1


let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_goto_buffer_command = 'botright'

" To customize the way a new window is split, prefix the GoTo* command with one of the following modifiers: :aboveleft, :belowright, :botright, :leftabove, :rightbelow, :topleft, and :vertical. For instance, to split vertically to the right of the current window, run the command:
" rightbelow vertical YcmCompleter GoTo

" When this option is set to 'CursorHold', the popup is displayed on the CursorHold autocommand. See :help CursorHold for the details, but this means that it is displayed after updatetime milliseconds. When set to an empty string, the popup is not automatically displayed.

" In addition to this setting, there is the <plug>(YCMHover) mapping, which can be used to manually trigger or hide the popup (it works like a toggle). For example:
nmap <leader>x <plug>(YCMHover)

nnoremap <leader>vgt :vsplit \| YcmCompleter GoTo
nnoremap <leader>sgt :split \| YcmCompleter GoTo
nnoremap <leader>gt :YcmCompleter GoTo


""""""""""""""""""""""""""""""""""snippets""""""""""""""""""""""""""""""""""


let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""remove arrow keys""""""""""""""""""""""""""""""
" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" " Remove newbie crutches in Insert Mode
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>

" " Remove newbie crutches in Normal Mode
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>

" " Remove newbie crutches in Visual Mode
" vnoremap <Down> <Nop>
" vnoremap <Left> <Nop>
" vnoremap <Right> <Nop>
" vnoremap <Up> <Nop>



"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"

"""""""""""""""""""""""""""""""""""""""""""workspaces"""""""""""""""""""""""""""""""""""""""""""
" If Vim is run with a file argument and it's already in the session's workspace, Vim will load the session and go to the tab window that contains it. Otherwise, it will be loaded as a new tab in the session. If you would rather create a new buffer in the existing tab instead of creating a new tab:
let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0
" let g:workspace_session_name = 'Session.vim'
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 1
let g:workspace_undodir='.undodir'
"If you would like autosave to be always on, even outside of a session, add the following to your vimrc:
let g:workspace_autosave_always = 1

"If you would like to disable autosave for some reason (i.e. too much IO on disk), it can be disabled as shown here:
let g:workspace_autosave = 1

"By default, all trailing spaces are trimmed before a buffer is autosaved. If you don't prefer this behaviour, add this line:
"let g:workspace_autosave_untrailspaces = 0


"Git commit filetypes won't autosave (or trim trailing spaces) by default. You can customize the ignore list with this line:
"let g:workspace_autosave_ignore = ['gitcommit']



""""""""""""""""""""""""""""""""FZF fzf"""""""""""""""""""""""""""""""
"" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }


"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }

"" Enable per-command history
"" - History files will be stored in the specified directory
"" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
""   'previous-history' instead of 'down' and 'up'.
"let g:fzf_history_dir = '~/.vim/fzf-history'


"" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

"" Search and switch buffers
"nmap <leader>b :Buffers<cr>
"" Find files by name under the current directory
"nmap <leader>f :Files<cr>
"" Find files by name under the home directory
"nmap <leader>h :Files /home/bonyo/git/ <cr>
"" Search content in the current file
"nmap <leader>l :BLines<cr>
"" Search content in the current file and in files under the current directory
"nmap <leader>g :Ag<cr>

"nmap <leader>R :Files `=GetGitRoot()`<cr>
"function! GetGitRoot()
"  " Get the dir of the current file
"  let currentDir = expand("%:p:h")
"  " We stop when we find the .git/ dir or hit root
"  while !isdirectory(currentDir . "/.git/") && currentDir !=# "/"
"    " Make the parent the current dir
"    let currentDir = fnamemodify(currentDir, ':h')
"  endwhile
"  return currentDir
"endfunction

"" Required:
"" - width [float range [0 ~ 1]]
"" - height [float range [0 ~ 1]]
""
"" Optional:
"" - xoffset [float default 0.5 range [0 ~ 1]]
"" - yoffset [float default 0.5 range [0 ~ 1]]
"" - highlight [string default 'Comment']: Highlight group for border
"" - border [string default 'rounded']: Border style
""   - 'rounded' / 'sharp' / 'horizontal' / 'vertical' / 'top' / 'bottom' / 'left' / 'right'
"" Default fzf layout
"" - down / up / left / right
"" let g:fzf_layout = {  'down': '40%', 'left': '30%' }
"let g:fzf_layout = {  'right': '20%', 'down':'20%' }


"" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


"" call fzf#run({'left': '30%'}) or let g:fzf_layout = {'left': '30%'}


""""""""""""""""""""""""""""""comments by filetype""""""""""""""""""""""""""""""

"autocmd FileType apache setlocal commentstring=#\ %s
"autocmd FileType nginx setlocal commentstring=#\ %s



""""""""""""""""""""buftabline"""""""""""""""""""""""""""""

nnoremap <C-B> :bnext<CR>
" nnoremap <C-F> :bnext<CR>
"
" nnoremap <C-B> :bprev<CR>
" nnoremap <C-B> :bprev<CR>



""""""""""""""""""""""""""""""""""""jump out""""""""""""""""""""""""""""""""""""
" inoremap <C-A>  jk<S-A>

"" Jump outside '"({
" if !exists('g:AutoPairsShortcutJump')
"   let g:AutoPairsShortcutJump = '<C-l>'
" endiaf
"
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsExpandTrigger="<C-F>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



""""""""""""""""""""""""""""""""""""lexima""""""""""""""""""""""""""""""""""""


inoremap <C-l> <C-r>=lexima#insmode#leave(1, "")<CR>
let lexima_ctrlh_as_backspace = 1
" or inoremap <C-l> <C-r>=lexima#insmode#leave_till_eol("")<CR>
" or inoremap <C-l> <C-r>=lexima#insmode#leave_all("")<CR>
"
" leave(n, "") moves cursor n character to the right.
" leave_till_eol("") leave all characters inserted by lexima but will stop before end of line.
" leave_all("") leaves over new lines.
"
"
"""""""""""""""Shortcuts Legendary MAP"""""""""""""""""""""""""""""""""""""""

" ctrl+h - delete bracket
" <Leader>tn - new TAB(buffer) unnamed
"
" :bd          - deletes the current buffer, error if there are unwritten changes
" :bd!         - deletes the current buffer, no error if unwritten changes
" :bufdo bd    - deletes all buffers, stops at first error (unwritten changes)
" :bufdo! bd   - deletes all buffers except those with unwritten changes
" :bufdo! bd!  - deletes all buffers, no error on any unwritten changes

" :bw          - completely deletes the current buffer, error if there are unwritten changes
" :bw!         - completely deletes the current buffer, no error if unwritten changes
" :bufdo bw    - completely deletes all buffers, stops at first error (unwritten changes)
" :bufdo! bw   - completely deletes all buffers except those with unwritten changes
" :bufdo! bw!  - completely deletes all buffers, no error on any unwritten changes

" :set confirm - confirm changes (Yes, No, Cancel) instead of error
"
" :ls          - list open buffers
" :b N         - open buffer number N (as shown in ls)
" :tabe +Nbuf  - open buffer number N in new tab
" :bnext       - go to the next buffer (:bn also)
" :bprevious   - go to the previous buffer (:bp also)
"
"
""""""""""""""""""""""""""""""Integrations 
"animate with fzf
let g:fzf_layout = {
 \ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.5)'
\ }

" ctrl-o-p   -     paste
"
"
"""""""""""""""""""""""""""""""""""""Window splits


nnoremap ,v :split<enter>
nnoremap ,h :vsplit<enter>

" nnoremap ,v <C-w>v
" nnoremap ,h <C-w>s

" <C-w>s
" <C-w>v
""Max out the height of the current split
"ctrl + w _

""Max out the width of the current split
"ctrl + w |

""Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =
"
""Swap top/bottom or left/right split
"Ctrl+W R

""Break out current window into a new tabview
"Ctrl+W T

""Close every window in the current tabview but the current one
"Ctrl+W o
""
"




"moving around splits
"
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>



"select text in visual mode and add quotes around it
"
" when in the middle of the word - 
" ciw""<ESC>P
"
" with record q
" qqc""<Esc>Pq
"
"Now, whithin the same session, you will be able to quote any visual block by just typing @q, which playbacks our previosly recorded actions
" After using @q once you will be able issue @@ (repeat previous action) to quote subsequent visual selections
"


let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
call lexima#insmode#map_hook('before', '<CR>', '')
" https://github.com/cohama/lexima.vim/issues/65
"
"
"
"open existing buffer in split
"
":vsplit #number buffer
":enew - opens new unnamed buffer
"
"
"ge                      Backward to the end of word [count] |inclusive|.
"


" diw (meaning: delete inner word)

" daw (meaning: delete a word


" CTRL-O : Retrace your movements in file in backwards.
" CTRL-I : Retrace your movements in file in forwards.
