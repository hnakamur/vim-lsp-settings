augroup vimlsp_settings_typescript_language_server
  au!
  let settings = {
      \ 'name': 'typescript-language-server',
      \ 'cmd': {server_info->lsp_settings#get('typescript-language-server', 'cmd', [lsp_settings#exec_path('typescript-language-server'), '--stdio'])},
      \ 'root_uri':{server_info->lsp_settings#get('typescript-language-server', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'initialization_options': lsp_settings#get('typescript-language-server', 'initialization_options', {"diagnostics": "true"}),
      \ 'whitelist': lsp_settings#get('typescript-language-server', 'whitelist', ['typescript', 'typescript.tsx']),
      \ 'blacklist': lsp_settings#get('typescript-language-server', 'blacklist', []),
      \ 'config': lsp_settings#get('typescript-language-server', 'config', {}),
      \ 'workspace_config': lsp_settings#get('typescript-language-server', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
