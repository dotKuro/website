module Main exposing (main)

import Browser exposing (Document, UrlRequest, application)
import Browser.Events exposing (onResize)
import Browser.Navigation exposing (Key, load, pushUrl)
import Css exposing (..)
import Css.Global exposing (body, global, html)
import Footer
import Header
import Helper exposing (StyledDocument)
import Html.Styled as Html exposing (div, footer, header, main_, toUnstyled)
import Html.Styled.Attributes exposing (css)
import Pages.CurriculumVitae
import Pages.Datenschutz
import Pages.Home
import Pages.Impressum
import Pages.NotFound
import Pages.WhoAmI
import Platform exposing (Program)
import Task
import Theme exposing (Theme, dark)
import Time
import Url exposing (Url)


type Page
    = Home
    | Datenschutz
    | Impressum
    | CurriculumVitae
    | WhoAmI
    | NotFound


type alias Model =
    { navigationKey : Key
    , page : Page
    , theme : Theme
    , header : Header.Model
    , footer : Footer.Model
    }


type Msg
    = ClickedLink UrlRequest
    | ChangedUrl Url
    | GotFooterMsg Footer.Msg
    | GotHeaderMsg Header.Msg


type alias WindowWidth =
    Int


urlToPage : Url -> Page
urlToPage url =
    case url.path of
        "/" ->
            Home

        "/impressum" ->
            Impressum

        "/datenschutz" ->
            Datenschutz

        "/whoami" ->
            WhoAmI

        "/curriculum-vitae" ->
            CurriculumVitae

        _ ->
            NotFound


init : WindowWidth -> Url -> Key -> ( Model, Cmd Msg )
init windowWidth url key =
    ( { navigationKey = key
      , page = urlToPage url
      , theme = dark
      , footer = Footer.init
      , header = Header.init windowWidth
      }
    , Time.now |> Task.perform (\now -> GotFooterMsg <| Footer.GotYear <| Time.toYear Time.utc now)
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

                WhoAmI ->
                    viewPage identity <| Pages.WhoAmI.view model.theme

                CurriculumVitae ->
                    viewPage identity <| Pages.CurriculumVitae.view model.theme

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
                [ header [] <| List.map (Html.map GotHeaderMsg) <| Header.view model.theme model.header
                , main_ [ css [ flexGrow (int 1), width (pct 100), displayFlex, justifyContent center ] ] page.body
                , footer [] <| Footer.view model.footer
                ]
            ]
    }



-- updatePage toMsg toPage ( pageMsg, pageModel ) =
--   ( { model | page = toPage pageModel }, Cmd.map toMsg pageMsg )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        updateFooter toMsg ( footerModel, footerMsg ) =
            ( { model | footer = footerModel }, Cmd.map toMsg footerMsg )

        updateHeader toMsg ( headerModel, headerMsg ) =
            ( { model | header = headerModel }, Cmd.map toMsg headerMsg )
    in
    case ( msg, model.page ) of
        ( ClickedLink urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, pushUrl model.navigationKey (Url.toString url) )

                Browser.External href ->
                    ( model, load href )

        ( ChangedUrl url, _ ) ->
            ( { model | page = urlToPage url }, Cmd.none )

        ( GotFooterMsg footerMsg, _ ) ->
            updateFooter GotFooterMsg <| Footer.update footerMsg model.footer

        ( GotHeaderMsg headerMsg, _ ) ->
            updateHeader GotHeaderMsg <| Header.update headerMsg model.header



-- ( _, _ ) ->
--    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    onResize
        (\width _ ->
            GotHeaderMsg <| Header.GotScreenType <| Header.widthToScreenType width
        )


main : Program WindowWidth Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = ChangedUrl
        }
