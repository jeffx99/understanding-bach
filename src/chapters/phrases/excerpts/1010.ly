\language "english"
\include "lily/helper.ly"

global = {\key ef \major \time 4/4}

bass    = \relative {
\stemUp \once \mark
g,8		
\stemDown
d'' b! f af d, f b,! |	% mm.1
\stemUp \once \mark
c,			% mm.2
}

harmony = \figures {
<9 7 5 3>1 |		% mm.1
<5 3>8			% mm.2
}

\score {
   %\override Score.SystemStartBar.collapse-height = #20
    \new Staff = "lower" << \global \bar "" \clef bass   \new Voice { \bass }  \harmony >>
}
