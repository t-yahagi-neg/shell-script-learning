" 新しい .sh ファイルに shebang を自動挿入+カーソルを挿入モードへ
autocmd BufNewFile *.sh setlocal formatoptions-=ro
autocmd BufNewFile *.sh exec "normal i#!/bin/bash\<CR>\<Esc>"

" 保存時に自動で実行権限を付与
autocmd BufWritePost *.sh silent! !chmod +x %
