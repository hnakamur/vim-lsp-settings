augroup vimlsp_settings_terraform_lsp
  au!
  let settings = {
      \ 'name': 'terraform-lsp',
      \ 'cmd': {server_info->lsp_settings#get('terraform-lsp', 'cmd', [lsp_settings#exec_path('terraform-lsp')])},
      \ 'root_uri':{server_info->lsp_settings#get('terraform-lsp', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'whitelist': lsp_settings#get('terraform-lsp', 'whitelist', ['terraform']),
      \ 'blacklist': lsp_settings#get('terraform-lsp', 'blacklist', []),
      \ 'config': lsp_settings#get('terraform-lsp', 'config', {}),
      \ 'workspace_config': lsp_settings#get('terraform-lsp', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
