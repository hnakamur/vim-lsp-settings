augroup vimlsp_settings_intelephense_server
  au!
  let settings = {
      \ 'name': 'intelephense',
      \ 'cmd': {server_info->lsp_settings#get('intelephense', 'cmd', [lsp_settings#exec_path('intelephense-server'), '--stdio'])},
      \ 'root_uri':{server_info->lsp_settings#get('intelephense', 'root_uri', lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/'])))},
      \ 'whitelist': lsp_settings#get('intelephense', 'whitelist', ['php']),
      \ 'blacklist': lsp_settings#get('intelephense', 'blacklist', []),
      \ 'config': lsp_settings#get('intelephense', 'config', {}),
      \ 'workspace_config': lsp_settings#get('intelephense', 'workspace_config', {}),
      \ }
  call lsp_settings#register_server_settings(settings)
augroup END
