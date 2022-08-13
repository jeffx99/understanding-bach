\language "english"
\include "lily/helper.ly"

global = {\key ef \minor \time 3/4}

soprano = \relative { \voiceOne
\partial 4
af'4 |		% mm.0
f'2 af,4 |	% mm.1
[gf8 f] gf	% mm.2
}

alto = \relative { \voiceTwo
\partial 4
f'4 |		% mm.0
af2 f4 |	% mm.1
ef4.		% mm.2
}

bass    = \relative { \voiceTwo
\partial 4
ef8 f |			% mm.0
d! c! d ef c d |	% mm.1
[ef d!] ef		% mm.2
}

harmony = \figures {
\partial 4
s4 |		% mm.0
<6 3>2. |	% mm.1
<5 3>4		% mm.2
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } \new Voice { \alto } >>
        \new Staff = "lower" << \global \bar "" \clef bass   \new Voice { \bass }  \harmony >>
    >>
}
