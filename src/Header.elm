module Header exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div, nav, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)
import Theme exposing (Theme)


view : Theme -> List (Html msg)
view theme =
    [ div
        [ css
            [ width (pct 100)
            , displayFlex
            , justifyContent center
            , backgroundColor theme.alternateBackground
            , padding2 (px 10) (px 5)
            , boxSizing borderBox
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , justifyContent spaceBetween
                , maxWidth (px theme.maxPageWidth)
                , flexGrow (int 1)
                , fontSize (px 20)
                ]
            ]
            [ plainLink [ css [ fontWeight bold ], href "/" ] [ text "> dotKuro$ cd ~" ]
            , nav []
                [ plainLink [ css [ margin2 (px 0) (px 5) ] ] [ text "whoami" ]
                , plainLink [ css [ margin2 (px 0) (px 5) ] ] [ text "CV" ]
                ]
            ]
        ]
    ]
