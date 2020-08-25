module Footer exposing (Model, Msg(..), init, update, view)

import Css exposing (..)
import Helper exposing (maxPageWidth)
import Html.Styled exposing (Html, div, span, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)


type Msg
    = GotYear Int


type alias Model =
    { year : Int }


init : Model
init =
    { year = 2020 }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotYear year ->
            ( { model | year = year }, Cmd.none )


view : Model -> List (Html msg)
view model =
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
                [ maxWidth (px maxPageWidth)
                , displayFlex
                , flexDirection row
                , flexWrap wrap
                ]
            ]
            [ span [ css [ margin (px 5) ] ] [ text <| "© " ++ String.fromInt model.year ++ " Alexander Kampf" ]
            , span [ css [ margin (px 5) ] ] [ plainLink [ href "/datenschutz" ] [ text "Datenschutzerklärung" ] ]
            , span [ css [ margin (px 5) ] ] [ plainLink [ href "/impressum" ] [ text "Impressum" ] ]
            , span [ css [ margin (px 5) ] ] [ plainLink [ href "https://github.com/dotKuro/website/issues" ] [ text "Report a bug" ] ]
            ]
        ]
    ]
