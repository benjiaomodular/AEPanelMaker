# AEPanelMaker
[![CC BY 4.0][cc-by-shield]][cc-by]

A library for generating AEModular panels in OpenSCAD.

## Usage

```
    import AEPanelMaker
    
    units = 1;           # width in AE module units (25mm per unit)
    inputs = 8;          # number of input pins
    outputs = 8;         # number of output pins

    pots_rv09 = [];

    generate_panel();
```

## Configuration

### Title
#### Parameters: `title`, `title_font`, `title_font_size`

## Components

### Pots (RV09, PTV09)
Will fit most vertically-oriented 9mm potentiometers. Aligment based on middle pin.

#### Parameters `[x, y, label]`
- x - number of horizontal units from the left
- y - number of vertical units from the bottom
- label - text placed below the pot

#### Examples

Basic
```
pots_rv09 = [
    [4, 30, "A"]
];
```

Single Column
```
pots_rv09 = [
    [4, 30, "A"],
    [4, 30, "B"],
    [4, 30, "C"],
];
```

Grid
```
pots_rv09 = [
    [4, 30, "A"],
    [4, 30, "B"],
    [4, 30, "C"],
    [4, 30, "D"],
    [4, 30, "E"],
    [4, 30, "F"],
];
```

## Limitations and Caveats
1. By default, alignment in this library will be based on standard perfboard spacing (a 2.54mm grid) to make it easy for DIYers to build quick prototypes. This might make it more difficult to use with existing PCB-based AE modules.
2. Because the distance between standard AE mounting holes is not divisble by 2.54mm (perfboards), I had to align everything to one mounting hole (bottom-left). Because of this, you'll have to drill the top mounting holes a little wider to give the stand-offs a bit more wiggle room.
2. Input and output pins are farther away from the edges than usual AE modules. This is to help make the panels work with rough-cut perfboards.

## References

1. The AEM Technical Guide - https://docs.google.com/document/d/1loThrZ889Fn-SoxIRxbMBtzF8Ja44n78pzIcUGyLN20/edit


## LICENSE
This library is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
