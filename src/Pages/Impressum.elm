module Pages.Impressum exposing (view)

import Css exposing (..)
import Helper exposing (StyledDocument, maxPageWidth)
import Html.Styled exposing (br, div, h1, h2, p, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (plainLink)


view : StyledDocument msg
view =
    { title = "Impressum"
    , body =
        [ div [ css [ width (pct 100), maxWidth (px maxPageWidth), padding (px 5) ] ]
            [ h1 [] [ text " Impressum" ]
            , h2 [] [ text "Angaben gemäß § 5 TMG" ]
            , p []
                [ text "Alexander Kampf"
                , br [] []
                , text "Ginnheimerlandstr. 40"
                , br [] []
                , text "60487 Frankfurt am Main"
                ]
            , h2 [] [ text "Kontankt" ]
            , p []
                [ text "Email: "
                , plainLink [ href "mailto://mail@akampf.dev" ] [ text "mail@akampf.dev" ]
                , br [] []
                , text "Telegram: "
                , plainLink [ href "t.me/dotKuro 1337" ] [ text "@dotKuro1337" ]
                , br [] []
                , text "Twitter: "
                , plainLink [ href "twitter.com/dotKuro1337" ] [ text "@dotKuro1337" ]
                ]
            , h2 [] [ text "Haftung für Inhalte" ]
            , p [] [ text "Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen." ]
            , p [] [ text "Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen." ]
            , h2 [] [ text "Haftung für Links" ]
            , p [] [ text "Unser Angebot enthält Links zu externen Websites Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar." ]
            , p [] [ text "Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen." ]
            , h2 [] [ text "Urheberrecht" ]
            , p [] [ text "Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet." ]
            , p [] [ text "Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen." ]
            ]
        ]
    }
