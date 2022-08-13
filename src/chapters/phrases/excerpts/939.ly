\language "english"
global = {\key c \major \time 4/4}

soprano = \relative {
{a''16 g f e} {d c b a} {\stemDown b g a b} {c d e f} |	% mm.1 
g4 <<c,2 \\ g2>> <<b4 \\ d,4>> |			% mm.2
<<c'1 \\ e,1>> \bar "|."				% mm.3
}

bass    = \relative {
f1~ |			% mm.1
f8 d e c g'4 g,4 |	% mm.2
c,1 \bar "|."		% mm.3 
}

harmony = \figures {
s1 |				%mm.1
s4 <5 3>4 <4>4 <5 3>4 |		%mm.2
<3>4				%mm.3
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \clef treble \new Voice { \soprano } >>
        \new Staff = "lower" << \clef bass   \new Voice { \bass }  \harmony >>
    >>
}
