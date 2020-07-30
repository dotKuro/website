module Helper exposing (StyledDocument)

import Html.Styled exposing (Html)


type alias StyledDocument msg =
    { title : String
    , body : List (Html msg)
    }
