module Pages.Home exposing (view)

import Css exposing (..)
import FeatherIcons as Icon exposing (Icon)
import Helper exposing (StyledDocument)
import Html.Styled exposing (Html, div, fromUnstyled, span, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)


iconLink : Icon -> String -> Html msg
iconLink icon url =
    plainLink
        [ css [ margin (px 5) ]
        , href url
        ]
        [ icon
            |> Icon.withSize 20
            |> Icon.toHtml []
            |> fromUnstyled
        ]


view : StyledDocument msg
view =
    { title = "Home"
    , body =
        [ div
            [ css
                [ width (pct 100)
                , height (pct 100)

                -- Flex for children
                , displayFlex
                , alignItems center
                , justifyContent center
                , flexDirection column
                ]
            ]
            [ span [ css [ fontSize (px 80), fontWeight bold ] ] [ text "dotKuro" ]
            , span [] [ text "Developer and TCG Lover" ]
            , span [ css [ margin (px 5) ] ]
                [ iconLink Icon.github "https://github.com/dotKuro"
                , iconLink Icon.twitter "https://twitter.com/dotKuro1337"
                , iconLink Icon.send "https://t.me/dotKuro1337"
                , iconLink Icon.mail "mailto://mail@akampf.dev"
                ]
            ]
        ]
    }
