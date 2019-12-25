augroup vimlsp_settings_html_languageserver
  au!
  let settings = {
      \ 'name': 'html-languageserver',
      \ 'cmd': {server_info->lsp_settings#get('html-languageserver', 'cmd', [lsp_settings#exec_path('html-languageserver'), '--stdio'])},
      \ 'root_uri':{server_info->lsp_settings#get('html-langserver', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'initialization_options': lsp_settings#get('html-languageserver', 'initialization_options', v:null),
      \ 'whitelist': lsp_settings#get('html-languageserver', 'whitelist', ['html']),
      \ 'blacklist': lsp_settings#get('html-languageserver', 'blacklist', []),
      \ 'config': lsp_settings#get('html-languageserver', 'config', {}),
      \ 'workspace_config': lsp_settings#get('html-languageserver', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
