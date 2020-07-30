module Pages.NotFound exposing (view)

import Helper exposing (StyledDocument)
import Html.Styled exposing (a, div, text)
import Html.Styled.Attributes exposing (href)


view : StyledDocument msg
view =
    { title = "Not Found"
    , body =
        [ div
            []
            [ text "Something went wrong. Go back "
            , a [ href "/" ] [ text "Home" ]
            ]
        ]
    }
