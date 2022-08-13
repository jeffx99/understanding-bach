\language "english"
\include "lily/helper.ly"

global = {\key c \minor \time 3/4}

soprano = \relative { \voiceOne
\partial 2
s2 |						% mm.0
\stemDown
{ef''8 f16 ef} {d ef c8} {af'4~} |		% mm.1
{af16 f df c} {df f af g} g4~ |			% mm.2
{g16 e! f af} {bf, c df8~} {df16 c bf g'}	% mm.3
\stemUp
{bf, af g af} {bf g af f}			% mm.4
}

tenor = \relative { \voiceOne
\partial 2
s2 |			% mm.0
c'8 g f ef d c |	% mm.1
a'\rest bf af g f e! |	% mm.2
f\rest c d! e! f e! |	% mm.3
f4 c'			% mm.4
}

bass    = \relative { \voiceTwo
\mark
\partial 2 \brokenTie #DOWN #-0.9 #2.7
g8 f! ef d |	% mm.0
c2. |		% mm.1
bf |		% mm.2
af2 g4 |	% mm.3
f		% mm.4
}

harmony = \figures {
\partial 2
s2 |		% mm.0
s2. |		% mm.1
s2. |		% mm.2
s2 <6 4 3>4 |	% mm.3
<5 3>4		% mm.4
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } >>
        \new Staff = "lower" << \global \bar "" \clef bass   \new Voice { \tenor } \new Voice { \bass }  \harmony >>
    >>
}
