# coc_current_word

`coc_current_word` is a plugin highlighting the word under the cursor with the
[coc.nvim](https://github.com/neoclide/coc.nvim) `highlight` action.

This plugin is based on [vim_current_word](https://github.com/dominikduda/vim_current_word).

## Installation

Via `Plug`, `Neobundle` or `Vundle`:

```vim
Plug 'IngoMeyer441/coc_current_word'
NeoBundle 'IngoMeyer441/coc_current_word'
Plugin 'IngoMeyer441/coc_current_word'
```

Via `Pathogen`:

```bash
git clone https://github.com/IngoMeyer441/coc_current_word.git ~/.vim/bundle/coc_current_word
```

Via Vim 8 packages:

```bash
git clone https://github.com/IngoMeyer441/coc_current_word.git ~/.vim/pack/plugins/start/coc_current_word
```

## Quick start

`coc_current_word` will call the CoC action `highlight` on the current word under the cursor. The style of the
highlighted word is controlled by the highlight group `CurrentWord` and is linked to the `Search` style by default. If
you want to change this behavior see the [styling](#styling) section.

This plugin defines a `:CocCurrentWordToggle` command which enables/disables the plugin on the fly.

## Customization (values written here are defaults)

### Delay highlighting

Setting this option to more than 0 will enable delayed highlighting. The value of this variable is a delay in
milliseconds.

```vim
let g:coc_current_word_highlight_delay = 0
```

### Filetypes

You can limit this plugin to specific filtypes:

```vim
let g:coc_current_word_filetypes = ['*']  " enable for all filtypes by default
" let g:coc_current_word_filetypes = ['c', 'cpp']  " enable only in C and C++ files
```

### Blacklist buffers

To prevent the plugin from running in one or more buffers add following to your vimrc:

```vim
autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:coc_current_word_disabled_in_this_buffer = 1
```

The example above disables the plugin in:

- Every buffer which name start with `NERD_tree_`
- Every buffer which name equals `your_buffer_name.rb`
- Every buffer which name ends with `.js`

### Enable/disable plugin

```vim
:CocCurrentWordToggle
```

## Styling

Change highlight style of the **word under cursor**:

```vim
hi CurrentWord guifg=#XXXXXX guibg=#XXXXXX gui=underline,bold,italic ctermfg=XXX ctermbg=XXX cterm=underline,bold,italic
"                     └┴┴┴┴┴──┐     └┴┴┴┴┤     └┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┤         └┴┤         └┴┤       └┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┤
"  gui-vim font color hex code│          │   gui-vim special styles│           │           │ console-vim special styles│
"  ───────────────────────────┘          │   ──────────────────────┘           │           │ ──────────────────────────┘
"       gui-vim background color hex code│     console-vim font term color code│           │
"       ─────────────────────────────────┘     ────────────────────────────────┘           │
"                                                    console-vim background term color code│
"                                                    ──────────────────────────────────────┘
```

Rather important notes:

- If you do not want any special styles just ommit them (or use `gui=NONE cterm=NONE`)
- [Here](http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html) you can find color codes for console-vim

## FAQ

- Why doesn't my customized highlight work?

  You have to set custom higlights below `colorscheme` in your `.vimrc`.


## Credits

Thanks to [Dominik Duda](https://github.com/dominikduda) for creating the
[vim_current_word](https://github.com/dominikduda/vim_current_word) plugin which is the base for this plugin.
