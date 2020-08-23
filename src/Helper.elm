module Helper exposing (StyledDocument, maxPageWidth)

import Html.Styled exposing (Html)


type alias StyledDocument msg =
    { title : String
    , body : List (Html msg)
    }


maxPageWidth : Float
maxPageWidth =
    850
