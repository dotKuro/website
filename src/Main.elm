module Main exposing (main)

import Browser exposing (Document, UrlRequest, application)
import Browser.Navigation exposing (Key, load, pushUrl)
import Css exposing (..)
import Css.Global exposing (body, global, html)
import Footer
import Header
import Helper exposing (StyledDocument)
import Html.Styled as Html exposing (div, footer, header, main_, toUnstyled)
import Html.Styled.Attributes exposing (css)
import Pages.Datenschutz
import Pages.Home
import Pages.Impressum
import Pages.NotFound
import Platform exposing (Program)
import Task
import Theme exposing (Theme, dark)
import Time
import Url exposing (Url)


type Page
    = Home
    | Datenschutz
    | Impressum
    | NotFound


type alias Model =
    { navigationKey : Key
    , page : Page
    , theme : Theme
    , year : Int
    }


type Msg
    = ClickedLink UrlRequest
    | ChangedUrl Url
    | RecievedTime Time.Posix


urlToPage : Url -> Page
urlToPage url =
    case url.path of
        "/" ->
            Home

        "/impressum" ->
            Impressum

        "/datenschutz" ->
            Datenschutz

        _ ->
            NotFound


init : flags -> Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    ( { navigationKey = key
      , page = urlToPage url
      , theme = dark
      , year = 2020
      }
    , Time.now |> Task.perform RecievedTime
    )


viewPage : (msg -> Msg) -> StyledDocument msg -> StyledDocument Msg
viewPage toMsg { title, body } =
    { title = title, body = List.map (Html.map toMsg) body }


view : Model -> Document Msg
view model =
    let
        page =
            case model.page of
                Home ->
                    viewPage identity Pages.Home.view

                Datenschutz ->
                    viewPage identity <| Pages.Datenschutz.view model.theme

                Impressum ->
                    viewPage identity Pages.Impressum.view

                NotFound ->
                    viewPage identity Pages.NotFound.view
    in
    { title = page.title ++ " :: dotKuro"
    , body =
        List.map toUnstyled
            [ global
                [ html
                    [ width (pct 100)
                    , height (pct 100)
                    , backgroundColor model.theme.background
                    , color model.theme.foreground
                    ]
                , body
                    [ width (pct 100)
                    , height (pct 100)
                    , margin (px 0)
                    ]
                ]
            , div
                [ css
                    [ displayFlex
                    , flexDirection column
                    , width (pct 100)
                    , height (pct 100)
                    ]
                ]
                [ header [] (Header.view model.theme)
                , main_ [ css [ flexGrow (int 1), width (pct 100), displayFlex, justifyContent center ] ] page.body
                , footer [] <| Footer.view model.year
                ]
            ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    --    let
    --        updatePage toMsg toPage ( pageMsg, pageModel ) =
    --            ( { model | page = toPage pageModel }, Cmd.map toMsg pageMsg )
    --    in
    case ( msg, model.page ) of
        ( ClickedLink urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, pushUrl model.navigationKey (Url.toString url) )

                Browser.External href ->
                    ( model, load href )

        ( ChangedUrl url, _ ) ->
            ( { model | page = urlToPage url }, Cmd.none )

        ( RecievedTime now, _ ) ->
            ( { model | year = Time.toYear Time.utc now }, Cmd.none )



-- ( _, _ ) ->
--    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program () Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = ChangedUrl
        }
