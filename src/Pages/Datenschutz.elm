module Pages.Datenschutz exposing (view)

import Css exposing (..)
import Helper exposing (StyledDocument, maxPageWidth)
import Html.Styled exposing (a, br, div, h1, h2, h3, li, p, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (coloredLink)
import Theme exposing (Theme)


view : Theme -> StyledDocument msg
view theme =
    { title = "Datenschutzerklärung"
    , body =
        [ div [ css [ width (pct 100), maxWidth (px maxPageWidth), padding (px 5) ] ]
            [ h1 [] [ text "Datenschutzerlkärung" ]
            , h2 [] [ text "Allgemeiner Hinweis und Pflichtinformationen" ]
            , h3 [] [ text "Benennung der verantwortlichen Stelle" ]
            , p [] [ text "Die verantwortliche Stelle für die Datenverarbeitung auf dieser Website ist:" ]
            , p []
                [ text "Alexander Kampf"
                , br [] []
                , text "Ginnheimerlandstr. 40"
                , br [] []
                , text "60487 Frankfurt am Main"
                ]
            , p [] [ text "Die verantwortliche Stelle entscheidet allein oder gemeinsam mit anderen über die Zwecke und Mittel der Verarbeitung von personenbezogenen Daten (z.B. Namen, Kontaktdaten o. Ä.)." ]
            , h3 [] [ text "Widerruf Ihrer Einwilligung zur Datenverarbeitung" ]
            , p [] [ text "Nur mit Ihrer ausdrücklichen Einwilligung sind einige Vorgänge der Datenverarbeitung möglich. Ein Widerruf Ihrer bereits erteilten Einwilligung ist jederzeit möglich. Für den Widerruf genügt eine formlose Mitteilung per E-Mail. Die Rechtmäßigkeit der bis zum Widerruf erfolgten Datenverarbeitung bleibt vom Widerruf unberührt." ]
            , h3 [] [ text "Recht auf Beschwerde bei der zuständigen Aufsichtsbehörde" ]
            , p []
                [ text "Als Betroffener steht Ihnen im Falle eines datenschutzrechtlichen Verstoßes ein Beschwerderecht bei der zuständigen Aufsichtsbehörde zu. Zuständige Aufsichtsbehörde bezüglich datenschutzrechtlicher Fragen ist der Landesdatenschutzbeauftragte des Bundeslandes, in dem sich der Sitz unseres Unternehmens befindet. Der folgende Link stellt eine Liste der Datenschutzbeauftragten sowie deren Kontaktdaten bereit: "
                , coloredLink theme [ href "https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html" ] [ text "https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html" ]
                , text "."
                ]
            , h3 [] [ text "Recht auf Datenübertragbarkeit" ]
            , p [] [ text "Ihnen steht das Recht zu, Daten, die wir auf Grundlage Ihrer Einwilligung oder in Erfüllung eines Vertrags automatisiert verarbeiten, an sich oder an Dritte aushändigen zu lassen. Die Bereitstellung erfolgt in einem maschinenlesbaren Format. Sofern Sie die direkte Übertragung der Daten an einen anderen Verantwortlichen verlangen, erfolgt dies nur, soweit es technisch machbar ist." ]
            , h3 [] [ text "Recht auf Auskunft, Berichtigung, Sperrung, Löschung" ]
            , p [] [ text "Sie haben jederzeit im Rahmen der geltenden gesetzlichen Bestimmungen das Recht auf unentgeltliche Auskunft über Ihre gespeicherten personenbezogenen Daten, Herkunft der Daten, deren Empfänger und den Zweck der Datenverarbeitung und ggf. ein Recht auf Berichtigung, Sperrung oder Löschung dieser Daten. Diesbezüglich und auch zu weiteren Fragen zum Thema personenbezogene Daten können Sie sich jederzeit über die im Impressum aufgeführten Kontaktmöglichkeiten an uns wenden." ]
            , h3 [] [ text "SSL- bzw. TLS-Verschlüsselung" ]
            , p [] [ text "Aus Sicherheitsgründen und zum Schutz der Übertragung vertraulicher Inhalte, die Sie an uns als Seitenbetreiber senden, nutzt unsere Website eine SSL-bzw. TLS-Verschlüsselung. Damit sind Daten, die Sie über diese Website übermitteln, für Dritte nicht mitlesbar. Sie erkennen eine verschlüsselte Verbindung an der „https://“ Adresszeile Ihres Browsers und am Schloss-Symbol in der Browserzeile." ]
            , h3 [] [ text "Server-Log-Dateien" ]
            , p [] [ text "In Server-Log-Dateien erhebt und speichert der Provider der Website automatisch Informationen, die Ihr Browser automatisch an uns übermittelt. Dies sind:" ]
            , ul []
                [ li [] [ text "Besuchte Seite auf unserer Domain" ]
                , li [] [ text "Datum und Uhrzeit der Serveranfrage" ]
                , li []
                    [ text "Verwendetes Betriebssystem"
                    , li [] [ text "Referrer URL" ]
                    , li [] [ text "Hostname des zugreifenden Rechners" ]
                    , li [] [ text "IP-Adresse" ]
                    ]
                ]
            , p [] [ text "Es findet keine Zusammenführung dieser Daten mit anderen Datenquellen statt. Grundlage der Datenverarbeitung bildet Art. 6 Abs. 1 lit. b DSGVO, der die Verarbeitung von Daten zur Erfüllung eines Vertrags oder vorvertraglicher Maßnahmen gestattet." ]
            ]
        ]
    }
