module Pages.WhoAmI exposing (view)

import Css exposing (..)
import Helper exposing (StyledDocument, maxPageWidth)
import Html.Styled exposing (div, h1, h2, p, text)
import Html.Styled.Attributes exposing (css, href)
import Styled exposing (coloredLink)
import Theme exposing (Theme)


view : Theme -> StyledDocument msg
view theme =
    { title = "whoami"
    , body =
        [ div
            [ css [ width (pct 100), maxWidth (px maxPageWidth), padding (px 5) ] ]
            [ h1 [] [ text "whoami" ]
            , p [] [ text "My Name is Alex aka dotKuro or just Kuro. I am a computer science student, developer and TCG Lover from Frankfurt in Germany." ]
            , h2 [] [ text "Computer Science" ]
            , p []
                [ text "I'm not only liking the programming side of computer science. I'm really into math, "
                , text "theoretical computer science and the theory behind (functional) programming languages. "
                , text "Most of the university courses I visited dealt with these topics. I enjoy solving code puzzles on sites like "
                , coloredLink theme [ href "https://www.codewars.com/" ] [ text "Codewars" ]
                , text " or "
                , coloredLink theme [ href "https://www.codingame.com/" ] [ text "Coding Game" ]
                , text ". Puzzles like these usually connect the theoretical/math side of computer science with coding in a way that satisfies me a lot."
                ]
            , p []
                [ text "Furthermore, I am passionate about free and open source software. I use free software as much as possible. "
                , text "I use Linux as my operating system almost exclusively. Even on my phone I was able to get a decently free setup, thanks to "
                , coloredLink theme [ href "https://lineage.microg.org/" ] [ text "MicroG + LineageOS" ]
                , text ". I always prefer free alternatives like "
                , coloredLink theme [ href "https://github.com/microsoft/vscode" ] [ text "Code - OSS" ]
                , text " over proprietary garbage like Sublime. "
                , text "I try to publish most of the code I write myself, even if it's nothing special. You can visit "
                , coloredLink theme [ href "https://github.com/dotKuro" ] [ text "my GitHub profile" ]
                , text ". Also, "
                , coloredLink theme [ href "https://github.com/dotKuro/website" ] [ text "this website" ]
                , text " is open source. It is written in "
                , coloredLink theme [ href "https://elm-lang.org/" ] [ text "elm" ]
                , text ", a delightful functional programming language for the web. If you are interested in writing some elm your self, "
                , text "you could use this site's code as a resource."
                ]
            , p []
                [ text "I love Linux! Mainly because I love to customize my system to my liking. When I first got introduced to Linux, "
                , text "I was amazed on what I was able to tweak. It is a completely different world compared to the chains Windows puts you in. "
                , text "Doing this I got quite decent in shell scripting and some basic sysadmin tasks."
                ]
            , h2 []
                [ text "TCGs" ]
            , p []
                [ text "I played a lot of physical and digital card games in the past: Pokémon, Hearthstone, Spellweaver "
                , text " and Magic the Gathering, just to name a few. There is just something about building decks that appeals to me "
                , text "in a special way. Creating a pile of cards that makes the Luck favor you over your opponent and actually "
                , text "seeing it work in a real match. It just feels great!"
                ]
            , p []
                [ text "Yu-Gi-Oh is the card game I spent the most time on by a long shot. It is a card game that gives you a really "
                , text "small set of restrictions compared to other games. The combination of the huge active card pool and the fact, "
                , text "that you can just execute the craziest combos you can think of, makes for the most interesting mechanics of "
                , text "all card games I played so far. Unfortunately, I think it has the poorest designed cards from all big TCGs out "
                , text "there. For me this makes the game not as fun from time to time, depending on the meta game. It still my favorite "
                , text "TCG for now."
                ]
            ]
        ]
    }
