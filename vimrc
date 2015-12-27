set nocompatible              " be iMproved
filetype off                  " required!
" set up vundle : git clone http://github.com/gmarik/vundle.git  ~/.vim/vundle.git
set rtp+=~/.vim/vundle.git/

call vundle#rc()

Bundle 'gmarik/Vundle.git'
Bundle 'plasticboy/vim-markdown'
Bundle 'The-NERD-Commenter'
Bundle 'Markdown'
Bundle 'snipMate'
Bundle 'editorconfig-vim'
Bundle 'junegunn/vim-easy-align'

"Bundle 'kristijanhusak/vim-hybrid-material'
"colorscheme hybrid_material

Bundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set term=screen-256color
" Make Vim recognize XTerm escape sequences for Page and Arrow
" keys combined with modifiers such as Shift, Control, and Alt.
" See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"Bundle 'molokai'
"colorscheme molokai
"Bundle 'hybrid.vim'
"colorscheme hybrid
"Bundle 'chriskempson/base16-vim'
"set background=dark
"colorscheme base16-tomorrow

Bundle 'SingleCompile'
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr> 

Bundle 'PDV--phpDocumentor-for-Vim'
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
"nnoremap <C-P> :call PhpDocSingle()<CR> 
"vnoremap <C-P> :call PhpDocRange()<CR> 

Bundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"TList
Bundle 'taglist.vim'
"autocmd BufNewFile,BufRead *.py,*.c,*.h :TlistOpen
map <F2> :TlistToggle<CR>

Bundle 'mru.vim'
"配置最近编辑文件列表个数
"let MRU_Max_Menu_Entries = 100
"let MRU_Window_Height = 15
map <F3> :call <SID>MruToggle()<CR>
function s:MruToggle()
    let winnum = bufwinnr('__MRU_Files__')
    if(winnum == -1)
        exec 'MRU'
    else
        exec winnum . 'wincmd q'
    endif
endfunction

"NerdTree
Bundle 'The-NERD-tree'
map <F4> :call <SID>FileTreeToggle()<CR>
map <leader><F4> :NERDTreeFind<CR>
imap <F4> <ESC>:call <SID>FileTreeToggle<CR>
map <leader><F4> <ESC>:NERDTreeFind<CR>
function s:FileTreeToggle()
    if exists("t:NERDTreeBufName") || bufname("%") == ''
        exec 'NERDTreeToggle'
    else
        exec 'NERDTreeFind'
    endif
endfunction

Bundle 'L9'
Bundle 'FuzzyFinder'

" 设置FuzzyFinder
let mapleader="\\"
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>g :FufTag<CR>
map <leader>b :FufBuffer<CR></mapleader>
map <leader>d :FufDirWithCurrentBufferDir<CR>
map <leader>D :FufDir<CR></mapleader>


"nnoremap <silent> sj     :FufBuffer<CR>
"nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> sK     :FufFileWithFullCwd<CR>
"nnoremap <silent> s<C-k> :FufFile<CR>
"nnoremap <silent> sl     :FufCoverageFileChange<CR>
"nnoremap <silent> sL     :FufCoverageFileChange<CR>
"nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
"nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
"nnoremap <silent> sD     :FufDirWithFullCwd<CR>
"nnoremap <silent> s<C-d> :FufDir<CR>


filetype plugin indent on     " required!

"""""""""""vim本身配置""""""""""""
set nobk
sy on
set hls
set helplang=cn

"内码使用utf8，优先以utf8尝试解码
set encoding=utf8
set fencs=utf8,cp936
set termencoding=utf-8


"通用的一些样式
set laststatus=2
set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\ %=%{strftime('%Y-%m-%d\ %H:%M')}
"设置viminfo
set viminfo='50,<1000,s100,:100,n~/.viminfo
"缩进使用的空白数
set shiftwidth=4
"文件中的tab代表的空格数
set tabstop=4
"插入tab时使用合适数量的空格
"set noexpandtab
set expandtab
"开启新行时使用智能自动缩进
set autoindent
set smartindent
set foldmethod=marker
set number
"set cursorline
"自动切换到编辑文件路径
"set autochdir

"显示执行的命令
set showcmd

"下面这句是为了让较长的行显示
set display=lastline

" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline

"较长的行可以行中上下移动
map <down> gj
map <up> gk

"配置TOhtml生成的代码格式
let use_xhtml = 1
let html_use_css = 1
"是否需要强制显示行号
"let html_number_lines = 1

"快速搜索当前目录下的文件
"autocmd BufRead * set path=expand('%:h').'/**'

"修正文件类型
autocmd BufNewFile,BufRead *.tpl,*.htm,tplt set filetype=html
autocmd BufNewFile,BufRead *.xaml set filetype=xml
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.go set filetype=go

"编辑jade模板时tab、缩进改成两个空格比较好看
autocmd BufNewFile,BufReadPost *.jade set filetype=jade shiftwidth=2 tabstop=2 | IndentGuidesEnable

"编辑html、css、less文件时，减号认为是单词的一部分
autocmd BufNewFile,BufRead *.tpl,*.htm,tplt,*.html,*.css,*.less set iskeyword+=\-

"临时先用着css语法
autocmd BufNewFile,BufRead *.less set ft=css

"编辑文本文件时，tab不要变成空格
autocmd BufNewFile,BufRead *.txt,*.text,*.data set noexpandtab

"markdown语法文档
autocmd BufRead,BufNewFile *.mkd,*.markdown,*.mdwn,*.text set filetype=markdown

"设置自动完成词典
set omnifunc=syntaxcomplete#Complete
"autocmd Filetype javascript,html,html set dictionary+=$vimfiles/dict/javascript
"autocmd Filetype php set dictionary+=$vimfiles/dict/php
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
"autocmd FileType c set omnifunc=ccomplete#Complete

"每次编辑完.vimrc文件时立刻加载
"autocmd BufWritePost *vimrc :source $MYVIMRC

"<F12>快速编辑.vimrc
"map <F12> :e $MYVIMRC<CR>


"进入当前文件的目录
map <leader>cd :cd %:h<CR>:pwd<CR>

"窗口切换
map <F5> <C-W>h
map <F6> <C-W>j
map <F7> <C-W>k
map <F8> <C-W>l
map <C-tab> <C-W>w

"窗口大小调整
map <M-F5> <C-W>+
map <M-F6> <C-W>-
map <M-F7> <C-W>>
map <M-F8> <C-W><

"系统粘贴板
map <leader>p "*P
map <leader>x "*x
map <leader>y gg"*yG<C-O><C-O>

"模拟less查看
map <leader>l :so $VIMRUNTIME/macros/less.vim<CR>

"""""""""" GUI设置 """"""""""""
if has('gui_running')
    "每行80字符提示线 
    set cc=80

    "设置windows、其他的字体大小 
    if has('win')
        let s:default_vimrc_font_height = 11.5
    else
        let s:default_vimrc_font_height = 13
    endif
    let s:vimrc_font_height = s:default_vimrc_font_height
    function! s:ResizeFontSize(flag)
        if a:flag == 1
            let s:vimrc_font_height += 1
        elseif a:flag == 0
            let s:vimrc_font_height = s:default_vimrc_font_height
        elseif a:flag == -1
            let s:vimrc_font_height -= 1
        endif
        exec "set guifont=Consolas:h" . string(s:vimrc_font_height)
    endfunction
    call s:ResizeFontSize(0)

    "最大化
    if has('win')
        au GUIEnter * simalt ~x
    endif

    "修改字体大小
    map <C-F5> :call <SID>ResizeFontSize(-1)<CR>
    map <C-F6> :call <SID>ResizeFontSize(0)<CR>
    map <C-F7> :call <SID>ResizeFontSize(0)<CR>
    map <C-F8> :call <SID>ResizeFontSize(1)<CR>

    "只出现右边的滚动条即可
    set guioptions=cr
else
    "取消鼠标支持，这样终端可以复制文本
    set mouse=
endif



""""""""" windows gvim设置 """"""""
if has('win32') || has('win64')
    "防止菜单发生乱码
    set langmenu=zh_CN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "临时文件目录
    set dir=c:/temp,c:/,.

    "c/c++头文件位置
    set path +=C:/MinGW/include,C:/MinGW/include/c++/3.4.5

    "c头文件tags文件
    set tags +=C:/MinGW/include/tags

    "设置make程序
    set makeprg=C:/MinGW/bin/mingw32-make

    "按<F11>调用系统默认程序打开文件
    nnoremap <silent> <F11> :let old_reg=@"<CR>:let @"=substitute(expand("%:p"), "/", "\\", "g")<CR>:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>

endif



""""""""""""""""""""插件配置"""""""""""""""""""""

"html缩进的标签
let g:html_indent_inctags = "body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"配置netrw插件更好的浏览目录
let g:netrw_altv      = 1
let g:netrw_winsize   = 23
let g:netrw_liststyle = 3

set nofoldenable
