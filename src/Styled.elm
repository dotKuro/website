module Styled exposing (plainLink)

import Css exposing (..)
import Html.Styled exposing (Attribute, Html, a, styled)


plainLink : List (Attribute msg) -> List (Html msg) -> Html msg
plainLink =
    styled a [ textDecoration none, color inherit ]
