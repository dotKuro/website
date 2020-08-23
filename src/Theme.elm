module Theme exposing (Theme, dark)

import Css exposing (Color, rgb)


type alias Theme =
    { background : Color
    , foreground : Color
    , alternateBackground : Color
    , accentColor : Color
    }


dark : Theme
dark =
    { background = rgb 40 40 40
    , foreground = rgb 225 225 225
    , alternateBackground = rgb 50 50 50
    , accentColor = rgb 255 85 85
    }
