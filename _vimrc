set nocompatible  
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim  
call vundle#begin()  
Plugin 'gmarik/Vundle.vim'  
Plugin 'Valloric/YouCompleteMe'  
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'fholgado/minibufexpl'
Plugin 'file:///home/zhaoxiaobiao/.vim/bundle/minibufexpl'
"格式化代码插件
Plugin 'Chiel92/vim-autoformat'
"文档化注释
Plugin 'file:///home/zhaoxiaobiao/.vim/bundle/DoxygenToolkit'
"快速注释
Plugin 'scrooloose/nerdcommenter'
"高亮c++语法
Plugin 'octol/vim-cpp-enhanced-highlight'
"文件名搜索插件
Plugin 'kien/ctrlp.vim'
" 头文件源文件切换
Plugin 'vim-scripts/a.vim'
" 自动提示函数信息
Plugin 'mbbill/echofunc'
" 文件内容搜索 
Plugin 'dyng/ctrlsf.vim'
" 模板补全
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/c.vim'
call vundle#end()  

"filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"
"
"if filereadable(expand("~/.vim/.vimrc.bundles"))
"    source ~/.vim/.vimrc.bundles
"endif

" ycm 配置
let g:ycm_global_ycm_extra_conf = '/Users/zhaoxiaobiao/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全  
let g:ycm_confirm_extra_conf=0   " 打开vim时不再询问是否加载ycm_extra_conf.py配置  
let g:syntastic_check_on_open = 1 " 每次打开buff就语法检查
let g:syntastic_enable_highlighting = 1 " 错误单词高亮
let g:syntastic_aggregate_errors = 1 "第一时间检查发现任何错误
let g:syntastic_enable_signs = 1 
let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{,}%W{Warn:%fw #%w}]"
let g:syntastic_c_config_file = ['.syntastic_c_config']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:ycm_warning_symbol = '>*'
" vim 颜色表 http://blog.csdn.net/cp3alai/article/details/45509459
" warning 代码块颜色 ctermbg 背景色 ctermfg 前景色
highlight YcmWarningSection ctermbg=11
" warning 标记颜色
highlight YcmWarningSign ctermbg=11
" 代码中出错字段颜色 
highlight YcmErrorSection ctermbg=9
" 出错行颜色  
"highlight YcmErrorLine  
" c++11 支持
let g:syntastic_cpp_compiler = 'g++' "change the compiler to g++ to support c++11. 
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++' "set the options of g++ to suport c++11.

inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项  
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 20
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        :Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
" nnoremap <Leader>sn :lnext<cr>
" nnoremap <Leader>sp :lprevious<cr>"""'')'')"



" 格式化代码配置
let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']

"文档化注释配置
let g:DoxygenToolkit_briefTag_funcName = "yes"
" for C++ style, change the '@' to '\'
"let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre = "brief "
let g:DoxygenToolkit_templateParamTag_pre = "param "
let g:DoxygenToolkit_paramTag_pre = "param "
let g:DoxygenToolkit_returnTag = "return "
let g:DoxygenToolkit_throwTag_pre = "throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "file "
let g:DoxygenToolkit_dateTag = "date "
let g:DoxygenToolkit_authorTag = "author "
let g:DoxygenToolkit_versionTag = "version "
let g:DoxygenToolkit_blockTag = "name "
let g:DoxygenToolkit_classTag = "class "
let g:DoxygenToolkit_authorName = "zhaoxiaobiao, zhaoxiaobiaogm@gmail.com"
let g:doxygen_enhanced_color = 1
"let g:load_doxygen_syntax = 1

"快速注释配置
" <leader> 为 "\"
"1、 \cc 注释当前行和选中行
"2、 \cn 没有发现和\cc有区别
"3、 \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
"4、 \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
"5、 \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
"6、 \cs 添加性感的注释，代码开头介绍部分通常使用该注释
"7、 \cy 添加注释，并复制被添加注释的部分
"8、 \c$ 注释当前光标到改行结尾的内容
"9、 \cA 跳转到该行结尾添加注释，并进入编辑模式
"10、\ca 转换注释的方式，比如： /**/和//
"11、\cl \cb 左对齐和左右对其，左右对其主要针对/**/
"12、\cu 取消注释

"高亮c++语法配置
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1



syntax on
"if has("vms")
"    set nobackup	
"else	  
"    set backup
"endif
set backspace=2
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8,cp936,gb2312,gbk,gb18030
set showcmd
filetype plugin indent on
set backupdir=~/.backup/vim
set backupext=.bak
" 设置行号
set number
" 修改leader键为逗号 
"let mapleader=","
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 高亮显示当前行/列
"set cursorline
"set cursorcolumn
" 搜索忽略大小写
set ignorecase
" 搜索高亮
set hlsearch
" 搜索逐字符高亮
set incsearch 
" 设置粘贴快捷键
set pastetoggle=<F11>
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
set csto=0
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 显示右侧滚动条
"set guioptions+=r
"set guioptions+=R
" 高亮显示普通txt文件（需要txt.vim脚本）
" 允许鼠标 
"set mouse=a 

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
"代码折叠--------------------------------------------
set foldcolumn=2
"set foldmethod=marker
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=100  
"设置开启关闭paste模式的快捷键
set pastetoggle=<F4>
"启动gvim时不要自动折叠
""用法如下 在普通模式(命令行)下输入以下
" za 打开/关闭当前折叠 
" " zA 循环打开/关闭当前折叠
" " zo 打开当前折叠
" " zc 关闭当前折叠
" " zM 关闭所有折叠
" " zR 打开所有折叠
" "
" let Tlist_Show_One_File=1
" let Tlist_Exit_OnlyWindow=1
" let Tlist_Show_Menu=1
" 多窗口切换快捷键
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>
au BufRead,BufNewFile *  setfiletype txt
"自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction

" 打开文件列表
nmap dt :NERDTreeToggle<cr>

" 打开文件结构
nmap fl :TagbarToggle<CR>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" cscope 快捷键配置
" cscope setting
" set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
    " set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("./cscope.out")
        cs add cscope.out
    elseif filereadable("../cscope.out")
        cs add ../cscope.out ../
    elseif filereadable("../../cscope.out")
        cs add ../../cscope.out ../../
    elseif filereadable("../../../cscope.out")
        cs add ../../../cscope.out ../../../
    elseif filereadable("../../../../cscope.out")
        cs add ../../../../cscope.out ../../../../
    elseif filereadable("../../../../../cscope.out")
        cs add ../../../../../cscope.out ../../../../../
    elseif filereadable("../../../../../../cscope.out")
        cs add ../../../../../../cscope.out ../../../../../../
    elseif filereadable("../../../../../../../cscope.out")
        cs add ../../../../../../../cscope.out ../../../../../../../
    endif

    set csverb
endif
" 查找函数调用处
" :cs help 添加其他的功能
" 查找被调用
noremap <leader>fu :cs find c <C-R>=expand("<cword>")<CR><CR>
"noremap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" 查找当前文件被哪些文件包含
noremap <leader>fi :cs find i <C-R>=expand("%:t")<CR><CR>
" 查找这个定义
noremap <leader>fd :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找字符串
noremap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找当前函数调用(call)了哪些函数
noremap <leader>fc :cs find d <C-R>=expand("<cword>")<CR><CR>
" 查找当前变量  查找C语言符号，即查找函数名、宏、枚举值等出现的地方
noremap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>

"map <F5> :!php -l %<CR>


" 格式化代码
" 格式样式 http://www.cppblog.com/jerryma/archive/2012/02/02/164813.html
map <F2> :call FormatCode()<CR>
func! FormatCode()
    " 删除行尾空格 
    %s/\s\+$//g
    " 保存
    exec "w"
    " 保存当前行
    let lineNum = line(".")
    if &filetype == 'c' || &filetype == 'h'
        exec "%!astyle --style=linux --suffix=none -A8\<CR>"
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        exec "%!astyle --style=linux -A8\<CR>"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif

    " 回复当前行
    exec lineNum
endfunc

" 更新 cscope 文件
map <F3> :call UpdateCscope() <CR>
func! UpdateCscope()
    wa
    if filereadable("./cscope.out")
        cs kill 0
        :r !cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add cscope.out
    elseif filereadable("../cscope.out")
        cs kill 0
        :r !cd .. && cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add ../cscope.out ../
    elseif filereadable("../../cscope.out")
        cs kill 0
        :r !cd ../../ && cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add ../../cscope.out ../../
    elseif filereadable("../../../cscope.out")
        cs kill 0
        :r !cd ../../../ && cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add ../../../cscope.out ../../../
    elseif filereadable("../../../../cscope.out")
        cs kill 0
        :r !cd ../../../../ && cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add ../../../../cscope.out ../../../../
    elseif filereadable("../../../../../cscope.out")
        cs kill 0
        :r !cd ../../../../../ && cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add ../../../../../cscope.out ../../../../../
    elseif filereadable("../../../../../../cscope.out")
        cs kill 0
        :r !cd ../../../../../../ && cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add ../../../../../../cscope.out ../../../../../../
    else 
        :r !cscope -Rbq -p\`pwd\` >/dev/null 2>&1 
        cs add cscope.out
    endif
    
endfunc

" echofunc 配置
let g:EchoFuncShowOnStatus = 1     "显示在状态栏

" CtrlSF 快捷键
nnoremap <Leader>sp :CtrlSF<CR>

"UltiSnips 配置
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
