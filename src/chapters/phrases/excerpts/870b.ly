\language "english"
\include "lily/helper.ly"

global = {\key c \major \time 2/4}


soprano = \relative { \voiceOne
{d'16 c d e} {d e c d} | % mm.1
{e d e f} {e f d e} |	% mm.2
c16			% mm.3
}

alto = \relative { \voiceTwo
\brokenTie #UP #-0.95 #-3
c'2~ |		% mm.1
c8 c4 b8 |	% mm.2
c16		% mm.3
}

bass = \relative { \voiceTwo
{d8\rest f16 e} {f8 d} |	% mm.1
g4 f4 |				% mm.2
e16				% mm.3
}

harmony = \figures {
s2 |		% mm.1
<6 4>4 <6 4> |	% mm.2
<6 3>16
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \clef treble \new Voice { \soprano } \new Voice { \alto }>>
        \new Staff = "lower" << \global \clef bass   \new Voice { \bass }  \harmony >>
    >>
}
