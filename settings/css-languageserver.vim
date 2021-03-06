augroup vimlsp_settings_css_languageserver
  au!
  autocmd User lsp_setup ++once call lsp#register_server({
      \ 'name': 'css-languageserver',
      \ 'cmd': {server_info->lsp_settings#get('css-languageserver', 'cmd', [lsp_settings#exec_path('css-languageserver'), '--stdio'])},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.git/']))},
      \ 'initialization_options': lsp_settings#get('css-languageserver', 'initialization_options', v:null),
      \ 'whitelist': lsp_settings#get('css-languageserver', 'whitelist', ['css']),
      \ 'blacklist': lsp_settings#get('css-languageserver', 'blacklist', []),
      \ 'config': lsp_settings#get('css-languageserver', 'config', v:null),
      \ 'workspace_config': lsp_settings#get('css-languageserver', 'workspace_config', {'css-languageserver': {'css.lint.validProperties': [], 'less.lint.validProperties': [], 'scss.lint.validProperties': []}}),
      \ })
augroup END
