### 主要更改了neovim的配置文件，让neovim可以渲染Markdown文件

- 使用了[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)插件渲染,更改了一些图标
- 使用了[img-clip.nvim.nvim](https://github.com/HakonHarnes/img-clip.nvim)插插件实现图片的插入，在普通模式下将图片拖入neovim中就行，会在MD文件目录中生成图片目录，甚至能转换为体积更小的图片
- 使用了[bullets.vim](https://www.github.com/bullets-vim/bullets.vim)插件自动生成列表,用neovim自带的[C-d]和[C-t]可以在编辑模式中调整缩进
- 使用了[marksman](https://github.com/artempyanykh/marksman)实现笔记的双向链接，用mason.nvim安装，好像确实开箱即用,不过有网络问题没装上
- 使用[cbfmt](https://github.com/lukas-reineke/cbfmt)配合[conform.nvim](https://www.github.com/stevearc/conform.nvim)插件实现MD文件中不同代码块的格式化。cbfmt的配置文件在[~/.config/cbfmt/cbmft.toml]
- 主要按照[这个视频](https://www.bilibili.com/BV1Lba7zuEpw)配置
