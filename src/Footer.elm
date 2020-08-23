module Footer exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div, span, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)
import Theme exposing (Theme)


view : Theme -> List (Html msg)
view theme =
    [ div
        [ css
            [ padding (px 5)
            , width (pct 100)
            , boxSizing borderBox
            , displayFlex
            , justifyContent center
            , fontSize (px 13)
            ]
        ]
        [ div
            [ css
                [ maxWidth (px theme.maxPageWidth)
                , displayFlex
                , flexDirection row
                , flexWrap wrap
                ]
            ]
            [ span [ css [ margin (px 5) ] ] [ text "© 2020 Alexander Kampf" ]
            , span [ css [ margin (px 5) ] ] [ plainLink [ href "/datenschutz" ] [ text "Datenschutzerklärung" ] ]
            , span [ css [ margin (px 5) ] ] [ plainLink [ href "/impressum" ] [ text "Impressum" ] ]
            , span [ css [ margin (px 5) ] ] [ plainLink [ href "https://github.com/dotKuro/website/issues" ] [ text "Report a bug" ] ]
            ]
        ]
    ]
