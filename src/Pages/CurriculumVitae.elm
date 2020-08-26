module Pages.CurriculumVitae exposing (view)

import Css exposing (..)
import Helper exposing (StyledDocument, maxPageWidth)
import Html.Styled exposing (Html, div, h1, h2, small, span, strong, table, td, text, tr)
import Html.Styled.Attributes exposing (css)
import Theme exposing (Theme)


view : Theme -> StyledDocument msg
view theme =
    { title = "Curriculum Vitae"
    , body =
        [ div
            [ css [ width (pct 100), maxWidth (px maxPageWidth), padding (px 5) ] ]
            [ h1 [] [ text "Curriculum Vitae" ]
            , h2 [] [ text "Work Experience" ]
            , entry "2020/07 - today"
                "Developer and Sysadmin"
                "student employee"
                "Feram"
                [ text "Tailored IT infrastructure and services for businesses. In a small group of 3 people, we fix any IT issues our "
                , text "customers may have. Notable activities include: Setup of Salesforce instances, Administration of Windows servers, "
                , text "hosting of cloud solutions for customers and Migration of IT infrastructure. We are the same developer team that "
                , text "formerly worked for Qthority."
                ]
            , entry "2020/03 - 2020/06"
                "Developer and Sysadmin"
                "student employee"
                "Qthority"
                [ text "Front and backend development of the website with Angular and the Discourse API. Deployment and administration "
                , text "of applications on GKE. Administration and development of the corporation's Salesforce instance. A nice job with "
                , text "challenging tasks that unfortunately took a steep end, due to the coronavirus."
                ]
            , entry "2019/03 - 2019/10"
                "Data Scientist"
                "student employee"
                "Degussa Bank"
                [ text "Analysis of huge amount of customer data, development of prediction models with machine learning and "
                , text "workflow automation. After working there for one semester I can say that this branch of computer science "
                , text "it not my future."
                ]
            , h2 [] [ text "Education" ]
            , entry "2017 - today"
                "Bachelor's Degree"
                "ongoing"
                "Goethe University Frankfurt"
                [ text "Studying computer science and mathematics. I set a personal focus on theoretical computer science and "
                , text "functional programming."
                ]
            , entry "up to 2017"
                "Abitur"
                "completed"
                "Kopernikussschule Freigericht"
                [ text "Completed with advanced courses in math, chemistry and basic courses in computer science." ]
            , div [ css [ displayFlex, flexWrap wrap ] ]
                [ div [ css [ displayFlex, flexDirection column, width (px 275), marginRight (px 35) ] ]
                    [ h2 [] [ text "Programming Languages" ]
                    , progressbar theme "Python" 95
                    , progressbar theme "Haskell" 90
                    , progressbar theme "Bash/Shell" 90
                    , progressbar theme "Typescript/NodeJs" 75
                    , progressbar theme "HTML/CSS/JS" 75
                    , progressbar theme "Elm" 70
                    , progressbar theme "C/C++" 25
                    , progressbar theme "Go" 25
                    ]
                , div [ css [ displayFlex, flexDirection column ] ]
                    [ h2 [] [ text "DevOps/Tools" ]
                    , progressbar theme "Git" 95
                    , progressbar theme "Docker" 90
                    , progressbar theme "Docker Compose" 90
                    , progressbar theme "Yarn/Npm" 75
                    , progressbar theme "Pipenv" 50
                    , progressbar theme "Stack" 50
                    , progressbar theme "Kubernetes" 30
                    ]
                ]
            , div [ css [ displayFlex, flexWrap wrap ] ]
                [ div [ css [ displayFlex, flexDirection column, width (px 275), marginRight (px 35) ] ]
                    [ h2 [] [ text "Languages" ]
                    , span [] [ strong [] [ text "German" ], text " - native" ]
                    , span [] [ strong [] [ text "English" ], text " - interest" ]
                    , span [] [ strong [] [ text "Russian" ], text " - nearly nothing but learing" ]
                    ]
                , div [ css [ displayFlex, flexDirection column ] ]
                    [ h2 [] [ text "Interest" ]
                    , span [] [ text "(digital) Privacy" ]
                    , span [] [ text "Linux" ]
                    , span [] [ text "Trading Card Games" ]
                    ]
                ]
            , h2 [] [ text "Non Profit" ]
            , span []
                [ text "Together with other members of the student association, we help freshmen to get started with their "
                , text "studies. We organize orientation events. Other than that I also try to get other students into Linux, the "
                , text "operating system and the entire free software philosophy around it. I organize events in which I help others "
                , text "installing Linux and start learning how to use it."
                ]
            ]
        ]
    }


entry : String -> String -> String -> String -> List (Html msg) -> Html msg
entry dateString jobDescription jobType corporation content =
    Html.Styled.table [ css [ paddingBottom (px 10) ] ]
        [ tr []
            [ td [ css [ width (px 160) ] ] [ text dateString ]
            , td [] [ strong [] [ text jobDescription ] ]
            ]
        , tr []
            [ td [] [ Html.Styled.small [] [ text jobType ] ]
            , td [] [ Html.Styled.small [] [ text corporation ] ]
            ]
        , tr []
            [ td [] []
            , td [] content
            ]
        ]


progressbar : Theme -> String -> Float -> Html msg
progressbar theme title progress =
    div [ css [ displayFlex, Css.flexDirection column ] ]
        [ span [ css [ paddingBottom (px 5) ] ] [ text title ]
        , span
            [ css
                [ width (pct 100)
                , maxWidth (px 200)
                , height (px 10)
                , backgroundColor theme.alternateBackground
                , marginBottom (px 10)
                ]
            ]
            [ span
                [ css
                    [ height (pct 100)
                    , width (pct progress)
                    , backgroundColor theme.accentColor
                    , display block
                    ]
                ]
                []
            ]
        ]
