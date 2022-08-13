\language "english"
\include "lily/helper.ly"

global = {\key d \major \time 4/4}

soprano = \relative { \voiceOne
e''8 b e8. fs16 d16 cs b cs d cs d e |	% mm.1
fs					% mm.2
}

alto = \relative { \voiceTwo
\brokenTie  #UP #-1.2 #-1.7
e'8 g16 a b a b cs fs,4
\change Staff = "lower"
\stemUp
b, |				% mm.1
\flag
as16				% mm.2
}

bass    = \relative { \voiceTwo
g16 fs e fs g fs g a b8 a g4 |	% mm.1
fs16				% mm.2
}

harmony = \figures {
s2. <6 4 3>4 |	% mm.1
<5 3>16		% mm.2
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } \new Voice { \alto } >>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass }  \harmony >>
    >>

    \layout {
        \context {
            \Score
            \override SpacingSpanner spacing-increment = 0.75
        }
    }
}
