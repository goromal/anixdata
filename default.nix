{ pkgs }:
let 
    mkData = name: data: {
        inherit name data;
    };
in with pkgs; rec {
    configs = {
        book-notes = mkData "book-notes.csv" ./data/configs/book-notes.csv;
    };
    fonts = {
        nexa = mkData "nexa.ttf" ./data/fonts/nexa.ttf;
    };
    img = {
        wallpaper      = mkData "wallpaper.png" ./data/img/wallpaper.png;
        ajt-logo-white = mkData "ajt.png" ./data/img/ajt.png;
        anix-logo-bmp  = mkData "anixpkgs.png" ./data/img/anixpkgs.png;
        anix-logo-svg  = mkData "anixpkgs.svg" ./data/img/anixpkgs.svg;
    };
    models = {
        spleeter = {
            checkpoint  = mkData "checkpoint" ./data/models/2stems/checkpoint;
            model-data  = mkData "model.data-00000-of-00001" ./data/models/2stems/model.data-00000-of-00001;
            model-index = mkData "model.index" ./data/models/2stems/model.index;
            model-meta  = mkData "model.meta" ./data/models/2stems/model.meta;
        };
        gender = {
            proto   = mkData "proto.prototxt" ./data/models/gender/proto.prototxt;
            weights = mkData "weights.caffemodel" ./data/models/gender/weights.caffemodel;
        };
    };
    records = {
        crypt = mkData "HOhuKN.tyz" ./data/records/HOhuKN.tyz;
    };
    themes = {
        nordic-gtk4 = {
            css = mkData "gtk.css" (callPackage ./data/themes/nordic-gtk4/css.nix { dark = false; });
            css-dark = mkData "gtk-dark.css" (callPackage ./data/themes/nordic-gtk4/css.nix { dark = true; });
            thumbnail = mkData "thumbnail.png" ./data/themes/nordic-gtk4/thumbnail.png;
        };
    };
}
