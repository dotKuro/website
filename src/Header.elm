module Header exposing (Model, Msg(..), init, update, view, widthToScreenType)

import Css exposing (..)
import Debug
import FeatherIcons as Icon
import Helper exposing (maxPageWidth)
import Html.Styled exposing (Html, div, fromUnstyled, nav, text)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Styled exposing (plainLink)
import Theme exposing (Theme)


type alias WindowWidth =
    Int


type ScreenType
    = Mobile
    | Desktop


type MenuStatus
    = Collapsed
    | Extended


type Msg
    = GotScreenType ScreenType
    | ClickedMenu


type alias Model =
    { screenType : ScreenType
    , menuStatus : MenuStatus
    }


widthToScreenType : Int -> ScreenType
widthToScreenType width =
    if width >= 1000 then
        Desktop

    else
        Mobile


toggleMenu : MenuStatus -> MenuStatus
toggleMenu status =
    case status of
        Collapsed ->
            Extended

        Extended ->
            Collapsed


init : WindowWidth -> Model
init windowWidth =
    { screenType = widthToScreenType windowWidth
    , menuStatus = Collapsed
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotScreenType screenType ->
            ( { model | screenType = screenType, menuStatus = Collapsed }, Cmd.none )

        ClickedMenu ->
            ( { model | menuStatus = toggleMenu model.menuStatus }, Cmd.none )


navLinks : List (Html msg)
navLinks =
    [ plainLink [ css [ margin (px 5) ], href "/whoami" ] [ text "whoami" ]
    , plainLink [ css [ margin (px 5) ], href "/curriculum-vitae" ] [ text "CV" ]
    ]


view : Theme -> Model -> List (Html Msg)
view theme model =
    [ div
        [ css
            [ width (pct 100)
            , displayFlex
            , flexDirection column
            , alignItems center
            , backgroundColor theme.alternateBackground
            , padding (px 10)
            , boxSizing borderBox
            , case model.screenType of
                Desktop ->
                    fontSize (px 25)

                Mobile ->
                    fontSize (px 70)
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , justifyContent spaceBetween
                , maxWidth (px maxPageWidth)
                , width (pct 100)
                ]
            ]
            [ plainLink [ css [ fontWeight bold ], href "/" ] [ text "> dotKuro$ cd ~" ]
            , case model.screenType of
                Desktop ->
                    nav [] navLinks

                Mobile ->
                    div
                        [ css [ flexGrow (int 1), displayFlex, justifyContent flexEnd ]
                        , onClick ClickedMenu
                        ]
                        [ Icon.menu |> Icon.withSize 70 |> Icon.toHtml [] |> fromUnstyled ]
            ]
        , nav
            [ css
                [ case model.menuStatus of
                    Extended ->
                        displayFlex

                    Collapsed ->
                        display none
                , flexDirection column
                , alignItems flexEnd
                , width (pct 100)
                , maxWidth (px maxPageWidth)
                ]
            ]
            navLinks
        ]
    ]
