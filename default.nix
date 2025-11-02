{ pkgs }:
let 
    mkData = name: data: {
        inherit name data;
    };
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
        wallpapers = {
            wallpaper1 = mkData "wallpaper.png" ./data/img/wallpaper1.png;
            wallpaper2 = mkData "wallpaper.png" ./data/img/wallpaper2.png;
            wallpaper3 = mkData "wallpaper.png" ./data/img/wallpaper3.png;
            wallpaper4 = mkData "wallpaper.png" ./data/img/wallpaper4.png;
            wallpaper5 = mkData "wallpaper.png" ./data/img/wallpaper5.png;
            wallpaper6 = mkData "wallpaper.png" ./data/img/wallpaper6.png;
            wallpaper7 = mkData "wallpaper.png" ./data/img/wallpaper7.png;
            wallpaper8 = mkData "wallpaper.png" ./data/img/wallpaper8.png;
            wallpaper9 = mkData "wallpaper.png" ./data/img/wallpaper9.png;
            wallpaper10 = mkData "wallpaper.png" ./data/img/wallpaper10.png;
            wallpaper11 = mkData "wallpaper.png" ./data/img/wallpaper11.png;
            wallpaper12 = mkData "wallpaper.png" ./data/img/wallpaper12.png;
        };
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
