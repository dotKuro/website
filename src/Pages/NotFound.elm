module Pages.NotFound exposing (view)

import Css exposing (..)
import Helper exposing (StyledDocument, maxPageWidth)
import Html.Styled exposing (div, p, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)


view : StyledDocument msg
view =
    { title = "Not Found"
    , body =
        [ div
            [ css
                [ displayFlex
                , justifyContent center
                , alignItems center
                , height (pct 100)
                , flexDirection column
                , padding (px 10)
                , maxWidth (px maxPageWidth)
                ]
            ]
            [ p [] [ text "This page was not found." ]
            , p [ css [ textAlign center ] ]
                [ text "If you got here by clicking a link on my page, and not by editing the url by hand like a real hacker, "
                , text "tell me, so I can fix it. Thanks!"
                ]
            , p []
                [ plainLink
                    [ href "https://github.com/dotKuro/website/issues"
                    , css [ textDecoration underline ]
                    ]
                    [ text "bug tracker on github" ]
                ]
            ]
        ]
    }
