\language "english"
\include "lily/helper.ly"

global = {\key d \minor \time 3/2}

soprano = \relative { \voiceOne
g''2 e2 {d8 cs8 d4} |	% mm.1
cs2. b!4 a2 |		% mm.2
c!			% mm.3
}


altoI = \relative { \voiceThree
d''2 bf b! |	% mm.1
a1 e2 |		% mm.2
a		% mm.3
}

altoII = \relative { \voiceTwo
g'2 g f |	% mm.1
\change Staff = lower
\stemUp
e d cs |	% mm.2
d!		% mm.3
}

tenor = \relative { \voiceOne
d'2	% mm.1
}

bass = \relative { \voiceTwo
bf2 g gs |	% mm. 1 
a1 g!2	|	% mm.2
fs		% mm.3
}

harmony = \figures {
s2 <6 3> <7 5 3!> |
<5 3>1 <6 4+ 2>2
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } \new Voice { \altoII} \new Voice { \altoI }>>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \tenor }\new Voice { \bass }  \harmony >>
    >>
}
