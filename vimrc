
"================== 基础配置 start ==================
"设置编码
set encoding=utf-8
set fileencodings=utf-8,chinese

"设置leader前缀为,
let mapleader = ","

"设置为相对行号
set nu
"set rnu

"主题
syntax on
set background=dark
colorscheme molokai
"let g:solarized_termcolors=256
"colorscheme solarized

set guifont=Menlo:h18

"解决backspace无法删除问题
set backspace=indent,eol,start

"快速打开.vimrc文件{{
noremap ,v :e ~/.vimrc<CR>

" 设置默认进行大小写不敏感查找
set ignorecase
" 若果有一个大写字母,则切换到大小写敏感查找
set smartcase

" 缩进
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 
set autoindent 
set cindent

"每行字符80
set textwidth=80
"tmux中Vim光标状态
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"定义跳出括号函数，用于跳出括号  
func SkipPair()  
	if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']'
	|| getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'"
	|| getline('.')[col('.') - 1] == '}'  
		return "\<ESC>la"  
	else  
		return "\t"  
	endif  
endfunc  
" 将tab键绑定为跳出括号  
"inoremap <TAB> <c-r>=SkipPair()<CR>'"'"

"================== 基础配置 start ==================



"==================快捷键配置 start ==================
"在普通模式下切换窗口映射{{
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"输入模式下，进入normal模式 
imap jj <esc>:w<CR>
imap jk <esc>
imap <leader>s <esc>:w!<cr>
noremap <leader>s <esc>:w!<cr>
"imap <leader>l <esc>la
"imap <leader>A <esc>lA
"nmap <C-s> <esc>:w<CR>
"imap <C-s> <esc>:w<CR>

nnoremap <leader>r :CtrlPTag<cr>
nnoremap <leader>t :TlistToggle<cr>


"imap <C-s> <esc>:w<CR>
"==================快捷键配置 end==================



"==================插件配置 start==================
"引入插件配置
if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
endif


"{{
"autocmd vimenter * NERDTree		"vim打开时自动打开NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1         "显示书签
let NERDTreeWinSize=30		    "nerdtree width
let NERDTreeAutoDeleteBuffer=1 
set mouse=a		            "可以使用鼠标"
let g:NERDTreeMouseMode=3
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$','\.meta$']
"let NERDTreeShowHidden=1		"显示隐藏文件
"}}

"CtrlP 配置
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|meta)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"airline--------------------
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_splits = 0
"let g:airline_theme='molokai'
"

"-----------ctags list--------------
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=25        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口

"----------nerd commenter
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1
"

"----------easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" " s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" " Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


"----------ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"==================插件配置 end==================
"
