module Pages.Home exposing (view)

import Css exposing (..)
import Helper exposing (StyledDocument)
import Html.Styled exposing (div, span, text)
import Html.Styled.Attributes exposing (css)


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
            [ span [] [ text "dotKuro" ]
            , span [] [ text "Developer and TCG Lover" ]
            ]
        ]
    }
