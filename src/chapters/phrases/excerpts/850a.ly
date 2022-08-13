\language "english"
\include "lily/helper.ly"

global = {\key d \major \time 4/4}

soprano = \relative { \oneVoice
b'16 g a b d, b' a g d' b cs d gs, f'! e d |	% mm.1
cs
}

bass = \relative { \oneVoice
g,8 d'\rest g d\rest \once \mark
b d\rest d' d,\rest |	% mm.1
\once \mark
a
}

harmony = \figures {
s2 <6+ 4 3>2 |	% mm.1
<5 3>16 
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } >>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass }  \harmony >>
    >>

    \layout {
        \context {
            \Score
            \override SpacingSpanner spacing-increment = 0.5
        }
    }
}
