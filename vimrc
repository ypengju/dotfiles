
"================== 基础配置 start ==================
"设置编码
set encoding=utf-8
set fileencodings=utf-8,chinese

"设置leader前缀为,
let mapleader = ","

"设置为相对行号
"set nu
set rnu

"主题
syntax on
set background=dark
colorscheme molokai

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

"tmux中Vim光标状态
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"================== 基础配置 start ==================



"==================快捷键配置 start ==================
"在普通模式下切换窗口映射{{
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"输入模式下，进入normal模式 
imap jj <esc>
imap jk <esc>

nmap <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

nnoremap <leader>, :CtrlPTag<cr>
nnoremap <leader>t :TlistToggle<cr>

"imap <D-s> <Esc>:w!<CR>
"noremap <D-s> <Esc>:w!<CR>i
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
let NERDTreeWinSize=35		    "nerdtree width
let NERDTreeAutoDeleteBuffer=1 
set mouse=a		            "可以使用鼠标"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"let NERDTreeShowHidden=1		"显示隐藏文件
"}}

"CtrlP 配置
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"airline--------------------
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_splits = 0
"let g:airline_theme='molokai'
"

"youcompleteme
" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处


"-----------ctags list--------------
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=30        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口

"==================插件配置 end==================
