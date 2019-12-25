augroup vimlsp_settings_emmylua_ls
  au!
  let settings = {
      \ 'name': 'emmylua-ls',
      \ 'cmd': {server_info->lsp_settings#get('emmylua-ls', 'cmd', [lsp_settings#exec_path('emmylua-ls')])},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/']))},
      \ 'initialization_options': lsp_settings#get('emmylua-ls', 'initialization_options', v:null),
      \ 'whitelist': lsp_settings#get('emmylua-ls', 'whitelist', ['lua']),
      \ 'blacklist': lsp_settings#get('emmylua-ls', 'blacklist', []),
      \ 'config': lsp_settings#get('emmylua-ls', 'config', {}),
      \ 'workspace_config': lsp_settings#get('emmylua-ls', 'workspace_config', {}),
      \ }
  if has('patch-8.1.000')
    autocmd User lsp_setup ++once call lsp#register_server(settings)
  else
    autocmd User lsp_setup call lsp#register_server(settings)
  endif
augroup END
