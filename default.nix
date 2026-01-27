{ pkgs ? import (fetchTarball "https://github.com/goromal/anixpkgs/archive/refs/heads/master.tar.gz") {} }:
let 
    mkData = name: data: {
        inherit name data;
    };
    minWallpaperIdx = 1;
    maxWallpaperIdx = 18;
in with pkgs; rec {
    apps = {
        la-quiz = {
            N-img = mkData "GLAA-N.png" ./data/apps/la-quiz/GLAA-N.png;
            E-img = mkData "GLAA-E.png" ./data/apps/la-quiz/GLAA-E.png;
            C-img = mkData "GLAA-C.png" ./data/apps/la-quiz/GLAA-C.png;
            S-img = mkData "GLAA-S.png" ./data/apps/la-quiz/GLAA-S.png;
        };
    };
    fonts = {
        nexa = mkData "nexa.ttf" ./data/fonts/nexa.ttf;
    };
    img = {
        wallpapers = (builtins.listToAttrs (
            builtins.genList (i:
                let idx = i + minWallpaperIdx;
                in {
                    name = "wallpaper${toString idx}";
                    value = mkData "wallpaper.png" ./data/img/wallpaper${toString idx}.png;
                }
            ) (maxWallpaperIdx - minWallpaperIdx + 1)
        )) // { inherit minWallpaperIdx maxWallpaperIdx; };
        ajt-logo-white = mkData "ajt.png" ./data/img/ajt.png;
        anix-logo-bmp  = mkData "anixpkgs.png" ./data/img/anixpkgs.png;
        anix-logo-svg  = mkData "anixpkgs.svg" ./data/img/anixpkgs.svg;
        anix-logo-white-bmp  = mkData "anixpkgs.png" ./data/img/anixpkgs_white.png;
        anix-logo-white-svg  = mkData "anixpkgs.svg" ./data/img/anixpkgs_white.svg;
        blank-svg      = mkData "blank.svg" ./data/img/blank.svg;
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
        rcloneConf = mkData "rclone.conf.tyz" ./data/records/rclone.conf.tyz;
    };
    themes = {
        nordic-gtk4 = {
            css = mkData "gtk.css" (callPackage ./data/themes/nordic-gtk4/css.nix { dark = false; });
            css-dark = mkData "gtk-dark.css" (callPackage ./data/themes/nordic-gtk4/css.nix { dark = true; });
            thumbnail = mkData "thumbnail.png" ./data/themes/nordic-gtk4/thumbnail.png;
        };
    };
}
