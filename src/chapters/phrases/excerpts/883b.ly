\language "english"
\include "lily/helper.ly"

global = {\key fs \minor \time 4/4}

soprano = \relative {
  r1 | % mm.1
  r1 | % mm.2
  r1 | % mm.3
  r4 r8 fs'8 e[ cs]
}

bass = \relative { \voiceOne
  r4 r8 cs'8 a fs d'4~ | % mm.1
  d8 cs16 b cs4~ cs8 fs b,4~ | % mm.2
  b8 a16 gs16 a8 fs8 gs2^\prallprall | % mm.3
  \highlight
  fs8 gs a b cs4 % mm.4
}

\score {
    \new PianoStaff <<
        \override PianoStaff.SystemStartBrace.collapse-height = #20
        \override Score.SystemStartBar.collapse-height = #20
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } >>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass } >>
    >>

    \layout {
      \context {
        \Score
        \override SpacingSpanner spacing-increment = 0.8
      }
    }
}
