augroup vimlsp_settings_bash_language_server
  au!
  let settings = {
      \ 'name': 'bash-language-server',
      \ 'cmd': {server_info->lsp_settings#get('bash-language-server', 'cmd', [lsp_settings#exec_path('bash-language-server'), 'start'])},
      \ 'root_uri':{server_info->lsp_settings#get('bash-language-server', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'whitelist': lsp_settings#get('bash-language-server', 'whitelist', ['sh']),
      \ 'blacklist': lsp_settings#get('bash-language-server', 'blacklist', []),
      \ 'config': lsp_settings#get('bash-language-server', 'config', {}),
      \ 'workspace_config': lsp_settings#get('bash-language-server', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
