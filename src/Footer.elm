module Footer exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div, span, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)
import Theme exposing (Theme)


view : Theme -> List (Html msg)
view _ =
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
                [ maxWidth (px 850)
                , displayFlex
                , flexDirection row
                , flexWrap wrap
                ]
            ]
            [ span [ css [ margin (px 3) ] ] [ text "© 2020 Alexander Kampf" ]
            , span [ css [ margin (px 3) ] ] [ plainLink [ href "/datenschutz" ] [ text "Datenschutzerklärung" ] ]
            , span [ css [ margin (px 3) ] ] [ plainLink [ href "/impressum" ] [ text "Impressum" ] ]
            ]
        ]
    ]
