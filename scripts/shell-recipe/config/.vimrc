" 新規作成時：コメント挿入を一時無効 → shebang + 改行 → 元に戻す
autocmd BufNewFile *.sh call s:insert_shebang()

function! s:insert_shebang()
	" コメントの自動挿入一時無効化
	setlocal formatoptions-=ro

	" shebang と改行を挿入 (ノーマルモードで)
	execute "normal i#!/bin/bash\<CR>\<CR>\<Esc>"

	execute "normal i# ========================================\<CR>"
	execute "normal i#  \<CR>"
	execute "normal i# ========================================\<CR>"
	execute "normal i\<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i#  \<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i\<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i#  \<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i\<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i#  \<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i\<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i#  \<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i\<CR>"
	execute "normal i# ----------------------------------------\<CR>"
	execute "normal i#  \<CR>"
	execute "normal i# ----------------------------------------\<CR>"

	" formatoptionsを戻す (再び#が自動で入るように)
	setlocal formatoptions+=ro
endfunction

" 保存時に自動で実行権限を付与
autocmd BufWritePost *.sh silent! !chmod +x %
