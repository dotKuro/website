module Styled exposing (coloredLink, plainLink)

import Css exposing (..)
import Html.Styled exposing (Attribute, Html, a, styled)
import Theme exposing (Theme)


plainLink : List (Attribute msg) -> List (Html msg) -> Html msg
plainLink =
    styled a [ textDecoration none, color inherit ]


coloredLink : Theme -> List (Attribute msg) -> List (Html msg) -> Html msg
coloredLink theme =
    styled a [ color theme.accentColor ]
