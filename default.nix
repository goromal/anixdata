{ pkgs ? import (fetchTarball "https://github.com/goromal/anixpkgs/archive/refs/heads/master.tar.gz") {} }:
let 
    mkData = name: data: {
        inherit name data;
    };
    minWallpaperIdx = 1;
    maxWallpaperIdx = 30;
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
    icons = {
        favicons = {
            arrows-rotate  = mkData "arrows-rotate.svg"  ./data/icons/favicons/arrows-rotate.svg;
            key            = mkData "key.svg"            ./data/icons/favicons/key.svg;
            piggy-bank     = mkData "piggy-bank.svg"     ./data/icons/favicons/piggy-bank.svg;
            inbox          = mkData "inbox.svg"          ./data/icons/favicons/inbox.svg;
            map-location-dot = mkData "map-location-dot.svg" ./data/icons/favicons/map-location-dot.svg;
            gears          = mkData "gears.svg"          ./data/icons/favicons/gears.svg;
            list-check     = mkData "list-check.svg"     ./data/icons/favicons/list-check.svg;
            graduation-cap = mkData "graduation-cap.svg" ./data/icons/favicons/graduation-cap.svg;
            download       = mkData "download.svg"       ./data/icons/favicons/download.svg;
            folder         = mkData "folder.svg"         ./data/icons/favicons/folder.svg;
            tv             = mkData "tv.svg"             ./data/icons/favicons/tv.svg;
        };
        fa6-solid = {
            arrows-rotate  = mkData "arrows-rotate.svg"  ./data/icons/fa6-solid/arrows-rotate.svg;
            key            = mkData "key.svg"            ./data/icons/fa6-solid/key.svg;
            piggy-bank     = mkData "piggy-bank.svg"     ./data/icons/fa6-solid/piggy-bank.svg;
            inbox          = mkData "inbox.svg"          ./data/icons/fa6-solid/inbox.svg;
            map-location-dot = mkData "map-location-dot.svg" ./data/icons/fa6-solid/map-location-dot.svg;
            gears          = mkData "gears.svg"          ./data/icons/fa6-solid/gears.svg;
            list-check     = mkData "list-check.svg"     ./data/icons/fa6-solid/list-check.svg;
            graduation-cap = mkData "graduation-cap.svg" ./data/icons/fa6-solid/graduation-cap.svg;
            download       = mkData "download.svg"       ./data/icons/fa6-solid/download.svg;
            book-open      = mkData "book-open.svg"      ./data/icons/fa6-solid/book-open.svg;
            chart-line     = mkData "chart-line.svg"     ./data/icons/fa6-solid/chart-line.svg;
            rocket         = mkData "rocket.svg"         ./data/icons/fa6-solid/rocket.svg;
            film           = mkData "film.svg"           ./data/icons/fa6-solid/film.svg;
            clipboard-check = mkData "clipboard-check.svg" ./data/icons/fa6-solid/clipboard-check.svg;
            calendar-check = mkData "calendar-check.svg" ./data/icons/fa6-solid/calendar-check.svg;
            house          = mkData "house.svg"          ./data/icons/fa6-solid/house.svg;
            server         = mkData "server.svg"         ./data/icons/fa6-solid/server.svg;
            folder         = mkData "folder.svg"         ./data/icons/fa6-solid/folder.svg;
            tv             = mkData "tv.svg"             ./data/icons/fa6-solid/tv.svg;
        };
    };
    themes = {
        nordic-gtk4 = {
            css = mkData "gtk.css" (callPackage ./data/themes/nordic-gtk4/css.nix { dark = false; });
            css-dark = mkData "gtk-dark.css" (callPackage ./data/themes/nordic-gtk4/css.nix { dark = true; });
            thumbnail = mkData "thumbnail.png" ./data/themes/nordic-gtk4/thumbnail.png;
        };
    };
}
