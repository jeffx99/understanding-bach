\language "english"
\include "lily/helper.ly"

global = {\key a \minor \time 3/8}


soprano = \relative { \voiceOne
a'4.~ |		% mm.1
a8. b16 c d |	% mm.2
e f e d c b |	% mm.3
c		% mm.4
}

alto = \relative { \voiceTwo
c'16 b c d e f |	% mm.1
e d c b a gs |		% mm.2
\change Staff = "lower"
\stemUp
a b gs4^\prall |	% mm.3
a16			% mm.4
}

bass = \relative { \oneVoice
a,4 b8 |	% mm.1
\stemDown
c4 \mark d8 |	% mm.2
c8 b4 |		% mm.3
a16		% mm.4 
}

harmony = \figures {
s4. |		% mm.1
s4. |		% mm.2
s8 <6 4 3>4 |	% mm.3
<3>16		% mm.4
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \clef treble \new Voice { \soprano } \new Voice { \alto }>>
        \new Staff = "lower" << \global \clef bass   \new Voice { \bass }  \harmony >>
    >>
}
