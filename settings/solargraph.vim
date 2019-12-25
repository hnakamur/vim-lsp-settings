augroup vimlsp_settings_solargraph
  au!
  let settings = {
      \ 'name': 'solargraph',
      \ 'cmd': {server_info->lsp_settings#get('solargraph', 'cmd', [lsp_settings#exec_path('solargraph'), 'stdio'])},
      \ 'root_uri':{server_info->lsp_settings#get('solargraph', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'initialization_options': lsp_settings#get('solargraph', 'initialization_options', {"diagnostics": "true"}),
      \ 'whitelist': lsp_settings#get('solargraph', 'whitelist', ['ruby']),
      \ 'blacklist': lsp_settings#get('solargraph', 'blacklist', []),
      \ 'config': lsp_settings#get('solargraph', 'config', {}),
      \ 'workspace_config': lsp_settings#get('solargraph', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
