{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      goyo-vim
      fzf-vim
      vim-commentary
      vim-surround
      vim-css-color
    ];

    extraConfig = ''
      syntax enable
      filetype plugin indent on
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set noesckeys
      set relativenumber
      set number
      set ignorecase
      set smartcase
      set incsearch
      set modeline
      set nohlsearch

      vmap <C-c> "+yi
      vmap <C-x> "+c
      vmap <C-v> c<ESC>"+p
      imap <C-v> <ESC>"+pa

      " KEYBINDS
      let mapleader = " "
      nnoremap <Leader>g  :SearchCWD<CR>
      nnoremap <Leader>f  :Files<CR>
      nnoremap <Leader>b  :Marks<CR>
    '';
  };
}
