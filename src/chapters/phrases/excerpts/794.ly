\language "english"
\include "lily/helper.ly"

global = {\key f \major \time 4/4}

soprano = \relative { \voiceOne
{e''16 f16 d e} f2 e4 |	% mm.1
f8			% mm.2
}

alto = \relative { \voiceTwo
c''8 bf {a16 bf c d} g,2 |	% mm.1
f8				% mm.2
}

bass    = \relative { \voiceTwo
\once \stemUp
c8 {c'16 a} {d8 c8} {bf^\prall a16 g} {c d \once \mark bf c} |	% mm.0
a8								% mm.1
}

harmony = \figures {
s2. <5 3>4 |	% mm.0
<6>		% mm.1
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } \new Voice { \alto } >>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass }  \harmony >>
    >>
}
