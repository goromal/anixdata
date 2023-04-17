{}:
let 
    mkData = name: data: {
        inherit name data;
    };
in rec {
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
            proto   = mkData "proto" ./data/models/gender/proto;
            weights = mkData "weights" ./data/models/gender/weights;
        };
    };
    records = {
        crypt = mkData "HOhuKN.tyz" ./data/records/HOhuKN.tyz;
    };
}
