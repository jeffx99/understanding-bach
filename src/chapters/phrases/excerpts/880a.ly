\language "english"
\include "lily/helper.ly"

global = {\key f \major \time 3/2}

soprano = \relative { \voiceOne
r2 r2 {f''8\rest a, bf c~} |	% mm.1
\once \override Tie.staff-position = 5 c2~ c8 a8 bf4 % mm.2
}

altoI = \relative { \voiceTwo
{r8 c' d ef} d1~ |					% mm.1
\once \override NoteColumn.force-hshift = 0.5 d2 g4.	% mm.2
}

altoII = \relative { \voiceThree
b'2\rest {b8\rest e,! fs g} fs2_~ |	% mm.1
{fs8 a g fs}				% mm.2
}

tenor = \relative { \voiceOne
\brokenTie #DOWN #-0.9 #2.7
g4 g4 fs4 bf a2~ |	% mm.1
a4 d,2 g4		% mm.2
}

bass = \relative { \voiceTwo
a,2  d1 |	% mm.1
g,2 bf2		% mm.2
}

harmony = \figures {
\bassFigureExtendersOn
s2 <7 5 3>1 |			% mm.1
<7 5 3>4 <7 5 3>4 <7 6>4	% mm.2
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \clef treble \new Voice { \soprano } \new Voice { \altoI } \new Voice { \altoII }>>
        \new Staff = "lower" << \global \clef bass   \new Voice { \tenor } \new Voice { \bass }  \harmony >>
    >>
}
