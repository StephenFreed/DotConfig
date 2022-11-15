"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NVIM v0.7.2
syntax on
set termguicolors
set hidden
set noshowmode
set conceallevel=0
" set shell=/bin/zsh
set updatetime=300
set timeoutlen=500
set cmdheight=2
set fileencoding=utf-8
set encoding=utf-8
set shortmess+=c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
let &t_SI = "\e[6 q" " insert mode cursor
let &t_EI = "\e[2 q" " everything else cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" History "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.local/share/nvim/undodir
set undofile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
set nohlsearch
set iskeyword+=-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lines "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set cindent
set cino=
" set cinoptions=i0,+0
set expandtab
set tabstop=2 
set softtabstop=0
set shiftwidth=2
" set relativenumber
set noerrorbells
set nu
set nowrap
set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=black guibg=black

lua << EOF
-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]
EOF

" Line Folding
set foldcolumn=2
" zf to fold 
" zo to open on line
" zc to reclose on line
" zr to restore all
" zm to minimize all
" zd to delete one fold
" zE to erase all folds

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remaps "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" sets leader key to space
let mapleader = " "
let maplocalleader = " "

" bring up commands file
nnoremap <leader>c :sp ~/.commands.cfg<CR>

" bring up nvim init file
nnoremap <leader>i :sp ~/.config/nvim/init.vim<CR>

" write source %
nnoremap <leader>ws :w<CR> :silent! source %<CR>l
   
" open man page of what is under cursor
nnoremap <leader>m <S-k>

" word spelling
nnoremap <leader>z z=

" set spelling
nnoremap <leader>sc :set spell<CR>
" set nospell
nnoremap <leader>sco :set nospell<CR>

" open in browser / http & search
vnoremap <leader>b y:!open <C-r>0<CR>
vnoremap <leader>bs y:!open http://www.google.com/search\?q=<C-r>0<CR><Esc>e

" line-indent
nnoremap <leader>si :IndentBlanklineToggle<CR>

" line spaces
autocmd VimEnter * nnoremap <leader>O O<Esc>
autocmd VimEnter * nnoremap <leader>o o<Esc>
autocmd VimEnter * nnoremap <leader>sb i<space><Esc>
autocmd VimEnter * nnoremap <leader>sa a<space><Esc>

" moving lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" moving letters
nnoremap L xp
nnoremap H xhhp

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" window splits
set splitbelow splitright
nnoremap <leader>vs :vertical split<CR>
nnoremap <leader>sp :split<CR>
nnoremap <leader>tt :vertical split<CR> :terminal<CR>i
nnoremap <leader>tb :10sp<CR> :terminal<CR>i
tnoremap <Esc> <C-\><C-n> " allows normal mode in terminal to switch windows
nnoremap <leader>l :MaximizerToggle<CR>
nnoremap <leader>wb :windo set scrollbind<CR>
nnoremap <leader>wnb :windo set noscrollbind<CR>

" make adjusting split sizes more friendly
nnoremap <silent> <C-l> :vertical resize -3<CR>
nnoremap <silent> <C-h> :vertical resize +3<CR>
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>

" move cursor to other windows and window stuff
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wr <C-w>r " rotate current window
nnoremap  <leader>wo <C-w>o " closes all other windows

" tabs
nnoremap  <leader>tab :tabnew<CR>
nnoremap  <leader>tn :tabNext<CR>
nnoremap  <leader>tm :tabmove<CR>
nnoremap  <leader>tf :tabfirst<CR>
nnoremap  <leader>tl :tablast<CR>

" buffers
" nnoremap  <leader>bn :bNext<CR>
" nnoremap  <leader>bp :bprevious<CR>
nnoremap  <leader>bn :BufferLineCycleNext<CR>
nnoremap  <leader>bp :BufferLineCyclePrev<CR>
nnoremap  <leader>bf :bfirst<CR>
nnoremap  <leader>bl :blast<CR>
nnoremap  <leader>bm :BufferLineMoveNext<CR>
nnoremap  <leader>bb :BufferLineMovePrev<CR>
nnoremap  <leader>bd :Bdelete<CR>

" file tree 
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>y :Startify<CR>

" Find files using Telescope
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fj :Telescope jumplist<CR>
nnoremap <leader>fh :Telescope help_tags<CR>

" GitSigns
nnoremap <leader>gp :Gitsigns preview_hunk<CR>
nnoremap <leader>gb :Gitsigns blame_line<CR>
nnoremap <leader>gn :Gitsigns next_hunk<CR>
nnoremap <leader>gN :Gitsigns prev_hunk<CR>

" Fugative
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>
" :Git
" = for inline diff
" dv for split diff / dq to quit
" :Gvdiffsplit / see diff vs previous commit
" :Gvdiffsplit branchName or commit / see dif vs another branch or commit
" :G log / o(split) or shift o(new tab) to see changes in commit
" :Gvdiffsplit! / merge conflict

" marks
" Use uppercase for other files
" m<a>
" '<a>
" :marks

" macro
" q<m>
" commands
" @q
" @@
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pluggins "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" installed and managed through git submodules
" helptags ~/.config/nvim/pack/<directory>/start/<directory>/doc

" themes 
" 'tomasiser/vim-code-dark'
" 'morhetz/gruvbox'
" 'joshdick/onedark.vim'

" layout
" 'mhinz/vim-startify' " startify
" 'kyazdani42/nvim-tree.lua' " for file tree
" 'kyazdani42/nvim-web-devicons' " for file icons
" 'vim-airline/vim-airline' " status bar
" 'akinsho/bufferline.nvim' " bufferline
" 'moll/vim-bbye' " delete buffers without closing
" 'akinsho/toggleterm.nvim' " floating terminal
" 'szw/vim-maximizer' " open window to full screen
" 'lukas-reineke/indent-blankline.nvim' " line for indents
" 'chentau/marks.nvim' " marks in sign colomn
" 'jiangmiao/auto-pairs' " adds pair ex. {}
" 'numToStr/Comment.nvim' " hot keys to comment in differnt languages

" ide
" 'nvim-lua/plenary.nvim'
" 'nvim-lua/popup.nvim'
" 'lewis6991/gitsigns.nvim' " gitsigns
" 'tpope/vim-fugitive' " git fugative
" 'nvim-telescope/telescope.nvim'
" 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
" NOT INSTALLED 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " markdown preview

" completion
" 'hrsh7h/nvim-cmp' " completion engine
" 'hrsh7th/cmp-buffer' " complete from buffer 
" 'hrsh7th/cmp-path' " complete file path 
" 'hrsh7th/cmp-cmdline' " complete in vim command line
" 'hrsh7th/cmp-nvim-lsp' " lsp completion
" 'hrsh7th/cmp-nvim-lua' " lua nvim api completion
" 'saadparwaiz1/cmp_luasnip' " snippit completion
" 'L3MON4D3/LuaSnip' " snippit engine
" 'rafamadriz/friendly-snippets' " snippit collection

" lsp
" 'nvim-lspconfig' " enable lsp config
" 'mason.nvim' lsp package manager
" 'mason-lspconfig.nvim' use lspconfig with mason.nvim
" 'null-ls.nvim' use nvim language srever to inject lsp diagnostics, code actions, and more via lua

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme codedark
" colorscheme onedark
" sets folds color
highlight Folded guibg=#569CD6 guifg=black
highlight FoldColumn guifg=#569CD6
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header = [
        \ '   ______                  _                    _______                    _ ',
        \ '  / _____) _              | |                  (_______)                  | |',
        \ ' ( (____ _| |_ _____ ____ | |__  _____ ____     _____ ____ _____ _____  __| |',
        \ '  \____ (_   _) ___ |  _ \|  _ \| ___ |  _ \   |  ___) ___) ___ | ___ |/ _  |',
        \ '  _____) )| |_| ____| |_| | | | | ____| | | |  | |  | |   | ____| ____( (_| |',
        \ ' (______/  \__)_____)  __/|_| |_|_____)_| |_|  |_|  |_|   |_____)_____)\____|',
        \ '                    |_|                                                      ',
        \]

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'c': '~/.commands.cfg'},
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

" sessions
" add ! to skip the prompt    
":SLoad       load a session
":SSave[!]    save a session
":SDelete[!]  delete a session
":SClose      close a session
" where to keep sessions
let g:startify_session_dir = '~/.local/share/nvim/startify/sessions'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim-Tree "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <C-]> will cd in the directory
" type a to add a file. directory requires leaving a leading / at the end
" type r to rename a file
" type y will copy name to system clipboard
" type Y will copy relative path to system clipboard
" type gy will copy absolute path to system clipboard
" type d to delete a file (will prompt for confirmation)
" I will toggle visibility of hidden folders / Files
" R will refresh the tree
lua << EOF
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {

    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,

    ignore_ft_on_setup = {
        "startify",
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },

    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 43,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        -- @deprecated
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = {"<2-RightMouse>", "<C-[>"}, cb = tree_cb("cd") },
        { key = "Y", cb = tree_cb("copy_absolute_path") },
        { key = "D", action = "remove" },
        { key = "d", action = "trash" },
        --{ key = "d", cb = ":lua NvimTreeTrash()<cr>" }
      },
    },

    float = {
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":t",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
        git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            deleted = "",
            untracked = "",
            ignored = "",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },


  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },


  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = false,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}

function NvimTreeTrash()
   local lib = require('nvim-tree.lib')
   local node = lib.get_node_at_cursor()
   local trash_cmd = "trash "

   local function get_user_input_char()
       local c = vim.fn.getchar()
       return vim.fn.nr2char(c)
   end

   print("Trash "..node.name.." ? y/n")

   if (get_user_input_char():match('^y') and node) then
       vim.fn.jobstart(trash_cmd .. node.absolute_path, {
           detach = true,
           on_exit = function (job_id, data, event) lib.refresh_tree() end,
       })
   end

   vim.api.nvim_command('normal :esc<CR>')
end
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline Pluggin "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch to your current theme
let g:airline_theme = 'codedark'
" let g:airline_theme = 'onedark'
" status line
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
" hide whitespace error
let g:airline#extensions#whitespace#enabled = 0
" git
let g:airline#extensions#branch#empty_message = '~No Repository~'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.dirty = '⚡changes'
" tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufferLine "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    -- indicator_icon = "|",
    -- buffer_close_icon = "",
    -- modified_icon = "●",
    -- close_icon = '',
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    -- left_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
}
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Terminal "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent-Blankline "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indent_blankline_char = '┆'
let g:indent_blankline_filetype_exclude = ['startify']
lua << EOF
--vim.opt.list = true
require("indent_blankline").setup {
     --for example, context is off by default, use this to turn it on
     show_current_context = true,
     show_current_context_start = false,
}
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Marks "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  builtin_marks = { },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    -- virt_text = "hello world"
  },
  mappings = {},
  mappings = {
    set_next = "mm",
    next = "m.",
    prev = "m,",
    delete_line  = "<space>md",
    delete_buf = "<space>m0"
  }
}
EOF

" m<,> or <.> for forward and backward
" m0 for bookmark | dm0 to delete bookmark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Pairs "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutFastWrap='<C-w>'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment.nvim "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode
" `gcc` - Toggles the current line using linewise comment
" `gbc` - Toggles the current line using blockwise comment

" Visual Mode
" `gc` - Toggles the region using linewise comment
" `gb` - Toggles the region using blockwise comment

lua << EOF
require('Comment').setup()
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitSigns "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end
gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-W>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    --fzf = {
    --  fuzzy = true,                    -- false will only do exact matching
    --  override_generic_sorter = true,  -- override the generic sorter
    --  override_file_sorter = true,     -- override the file sorter
    --  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    -- },

  }
}
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMP "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect
lua <<EOF

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({

  window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true,
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  sources = cmp.config.sources {
    { name = "nvim_lsp", keyword_length = 3},
    { name = "nvim_lua", keyword_length = 3},
    { name = "luasnip", keyword_length = 1},
    { name = "buffer", keyword_length = 3},
    { name = "path", keyword_length = 1 },
  },

  formatting = {
    fields = { "abbr",  "kind", "menu" },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim Lua]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end
  },
  
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),

})


-- No sources for seach '/' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    --{ name = 'buffer' }
  }
})

-- Use path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path' }
  }
})

EOF

" stops auto complete in vim command line
" autocmd CmdWinEnter * lua require('cmp').setup({enabled = false})
" autocmd CmdWinLeave * lua require('cmp').setup({enabled = true})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
-- require("lsp.handlers").setup()
--require "lsp.null-ls"

-- import mason plugin safely

require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}



-- NULL LS
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
	--	formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	--	formatting.black.with({ extra_args = { "--fast" } }),
	--	formatting.stylua,
  --      diagnostics.flake8
	},
})



EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run Files "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup exe_code
    autocmd!

    " execute bash code 
    autocmd FileType sh nnoremap <buffer> <localleader>r
            \ :20sp<CR> :terminal bash %<CR> :startinsert<CR>

    " execute python code 
    autocmd FileType python nnoremap <buffer> <localleader>r
            \ :20sp<CR> :terminal python3 %<CR> :startinsert<CR>

    " compile java code 
    autocmd FileType java nnoremap <buffer> <localleader>p
            \ :10sp<CR> :terminal javac %<CR> :startinsert<CR>

    " execute java code 
    autocmd FileType java nnoremap <buffer> <localleader>r
            \ :10sp<CR> :terminal java %:t:r<CR> :startinsert<CR>
    
    " execute JavaScript code 
    autocmd FileType javascript nnoremap <buffer> <localleader>r
            \ :10sp<CR> :terminal node %<CR> :startinsert<CR>

    " execute golang code
    autocmd FileType go nnoremap <buffer> <localleader>r
            \ :10sp<CR> :terminal go run %<CR> :startinsert<CR>

    " compile c++ code
    autocmd FileType cpp nnoremap <buffer> <localleader>p
            \ :10sp<CR> :terminal clang++ -std=c++11 % -o '%:r_runnable'<CR> :startinsert<CR>

    " execute c++ code
    autocmd FileType cpp nnoremap <buffer> <localleader>r
            \ :10sp<CR> :terminal '%:r_runnable'<CR> :startinsert<CR>

augroup END


