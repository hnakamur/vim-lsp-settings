augroup vimlsp_settings_javascript_typescript_langserver
  au!
  let settings = {
      \ 'name': 'javascript-typescript-langserver',
      \ 'cmd': {server_info->lsp_settings#get('javascript-typescript-langserver', 'cmd', [lsp_settings#exec_path('javascript-typescript-langserver')])},
      \ 'root_uri':{server_info->lsp_settings#get('javascript-typescript-langserver', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'initialization_options': lsp_settings#get('javascript-typescript-langserver', 'initialization_options', {"diagnostics": "true"}),
      \ 'whitelist': lsp_settings#get('javascript-typescript-langserver', 'whitelist', ['javascript']),
      \ 'blacklist': lsp_settings#get('javascript-typescript-langserver', 'blacklist', []),
      \ 'config': lsp_settings#get('javascript-typescript-langserver', 'config', {}),
      \ 'workspace_config': lsp_settings#get('javascript-typescript-langserver', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
