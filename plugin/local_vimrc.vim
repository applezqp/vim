"=============================================================================
" File:		local_vimrc.vim                                           {{{1
" Author:	Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"		<URL:http://hermitte.free.fr/vim/>
" URL: http://hermitte.free.fr/vim/ressources/vimfiles/plugin/local_vimrc.vim
" Version:	1.3
" Created:	09th Apr 2003
" Last Update:	30th Jul 2003
"------------------------------------------------------------------------
" Description:	Solution to Yakov Lerner's question on Vim ML {{{2
"	Search for a _vimrc_local.vim file in the parents directories and
"	source it if found.
"
"	Initial Question:
"	"Is it possible, after sourcing ~/.exrc, to traverse from $HOME down
"	 to cwd, and source .exrc from every directory if present ?
"	 (And if cwd is not under $HOME, just source ~/.exrc).
"	 What do I put into .vimrc to do this ?
" 
"	"Example: current dir is ~/a/b/c. Files are sourced in this order:
"	 ~/.exrc, then ~/a/.exrc, ~/a/b/.exrc, ~/a/b/c/.exrc.
"	 No messages if some of .exrc does not exist."
" }}}2
"------------------------------------------------------------------------
" Installation:	{{{2
" 	0- Set g:local_vimrc in your .vimrc if you wish to use filenames other
" 	   than '_vimrc_local.vim'
" 	a- Drop this plugin into a {rtp}/plugin/ directory
" 	b- Define _vimrc_local.vim files into your directories
"
" 	   Ideally, each foo/bar/_vimrc_local.vim should be defined the same
" 	   way as a ftplugin, i.e.: {{{3
"		" Global stuff that needs to be updated/override
"		let g:bar = 'bar'  " YES! This is a global variable!
"		
"		" Local stuff that needs to be defined once for each buffer
"		if exists('b:foo_bar_local_vimrc') | finish | endif
"		let b:foo_bar_local_vimrc = 1
"		setlocal xxx
"		nnoremap <buffer> foo :call <sid>s:Foo()<cr>
"		let b:foo = 'foo'
"		
"		" Global stuff that needs to be defined once only => functions
"		if exists('g:foo_bar_local_vimrc') | finish | endif
"		let g:foo_bar_local_vimrc = 1
"		function s:Foo()
"		  ...
"		endfunction
"
" History:	{{{2
"	v1.3    More comments.
"	        Trace of the directories searched when 'verbose' >= 2
"	v1.2	Stops at $HOME or at root (/)
" 	v1.1	Uses _vimrc_local.vim
" 	v1.0	Initial solution
" TODO:		{{{2
" 	(*) Add option to stop looking at $HOME or elsewhere
" 	    ([bg]:lv_stop_at : string, default $HOME) 
" }}}1
"=============================================================================

"=============================================================================
" Avoid global reinclusion {{{1
if exists("g:loaded_local_vimrc_vim") 
  finish 
endif
let g:loaded_local_vimrc_vim = 1
let s:cpo_save=&cpo
set cpo&vim
" Avoid global reinclusion }}}1
"------------------------------------------------------------------------
" Functions {{{1
" Name of the files used                                              {{{2
function! s:LocalVimrcName()
  return exists('g:local_vimrc') ? g:local_vimrc : '_vimrc_local.vim'
endfunction

let s:local_vimrc = s:LocalVimrcName()

" Value of $HOME -- actually a regex.                                 {{{2
let s:home = substitute($HOME, '/\|\\', '[/\\\\]', 'g')

" Regex used to determine when we must stop looking for local-vimrc's {{{2
let s:re_last_path = '^/\=$\|^[A-Za-z]:[/\\]$'. 
      \ ((s:home != '') ? ('\|^'.s:home.'$') : '')

" The main function                                                   {{{2
function! s:SourceLocal(path)
  let up_path = fnamemodify(a:path,':h')
  " call confirm('crt='.a:path."\nup=".up_path."\n$HOME=".s:home, '&Ok', 1)
  if (a:path !~ s:re_last_path)
    if (up_path !~ s:re_last_path)
      " Recursive call: first check the parent directory
      call s:SourceLocal(up_path)
    elseif filereadable(up_path.'/'.s:local_vimrc)
      " Terminal condition: try to source the upper(/uppest?) local-vimrc
      if &verbose >= 2
	echo 'Check '.up_path.' for '.s:local_vimrc.' ... found!'
      endif
      exe 'source '.up_path.'/'.s:local_vimrc
    elseif &verbose >= 2
      echo 'Check '.up_path.' for '.s:local_vimrc.' ... none!'
    endif
  endif

  " In all case, try to source the local-vimrc present in the directory
  " currently considered
  if filereadable(a:path.'/'.s:local_vimrc)
    if &verbose >= 2
      echo 'Check '.a:path.' for '.s:local_vimrc.' ... found!'
    endif
    exe 'source '.a:path.'/'.s:local_vimrc
  elseif &verbose >= 2
    echo 'Check '.a:path.' for '.s:local_vimrc.' ... none!'
  endif
endfunction

" Auto-command                                                        {{{2
" => automate the loading of local-vimrc's everytime we change buffers 
au BufEnter * :call s:SourceLocal(expand('<afile>:p:h'))

" Functions }}}1
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
