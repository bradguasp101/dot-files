# Kobra's dot-files

## Extra Setup
1. Install GNU stow `brew install stow`
2. Use stow to symlink
  - `stow -v -R -t ~ nvim`
  - `-t ~` means the stow root is at `~`
3. Install [wollemi](https://github.com/tcncloud/wollemi)
4. Install [grpcui](https://github.com/fullstorydev/grpcui)

## When working with jest
Jest often transforms files causing breakpoints to be inserted
in the wrong place. To prevent this, you can add this to your
`.babelrc` in your project's root.
```json
{
  "retainLines": true,
  "sourceMap": "inline"
}
```
