# Hands down glove 80 layouts

This is a collection of layouts for programmable keyboards.

Adds Moutis hands down vibranium v layer with some modifications for my own use cases inspired by Sunaku, as well as porting for windows/linux from OSX. 

References:
https://sites.google.com/alanreiser.com/handsdown/home
https://github.com/moutis/zmk-config
https://github.com/sunaku/glove80-keymaps
https://github.com/manna-harbour/miryoku

Future work:
- add more layers from both sources as well as Miryoku going forwards
- detect os, change ctrl/cmd/alt mods on the fly for osx compatibility
- port this to the zsa voyager

## Currently supported
- [Moergo Glove 80](https://moergo.com/glove80) keyboard. The Glove 80 is a wireless split contoured keyboard with a 4x5 key matrix on each side. The Glove 80 is powered by [ZMK firmware](https://zmk.dev).

## Planned
- [ZSA Voyager](https://www.zsa.io/voyager) keyboard. The Voyager is a wireless split contoured keyboard with a 4x5 key matrix on each side. The Voyager is powered by [QMK firmware](https://qmk.fm).

## Layouts


## Visualisation

The layouts are visualised using the [keymap-drawer](https://github.com/caksoylar/keymap-drawer) tool.
To build the visualisation, run the following:
```bash
# pipx install poetry==1.8.2  # if you don't have poetry installed, 1.8.2 is the compatible version
poetry run inv generate-visualisations
```

## Building locally

To build, first init the submodules:
```bash
git submodule update --init --recursive
```

Then, build the visualisations and firmware:
```bash
make all
```
