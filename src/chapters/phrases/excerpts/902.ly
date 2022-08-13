\language "english"
\include "lily/helper.ly"

global = {\key g \major \time 4/4}

soprano = \relative { \voiceOne
  \partial 2
  \highlight
  e''2~ | % mm.0
  e16 d e c a c b a d2~ | % mm.1
  d16 c d b g b a g c2~ | % mm.2
  \revert Beam.color
  c16
  \unhighlight
  b a g fs e d c b % mm.3
}

alto = \relative { \voiceTwo
  \partial 2
  \hhighlight
  r16 c''16 b c a b g a | % mm.0
  fs2~ fs16 b a b g a fs g | % mm.1
  e2~ e16 a g a fs g e fs | % mm.2
  d8 r8 % mm.3
}

tenor = \relative { \voiceOne
  \partial 2
  \highlight
  \circle
  c'8 r8 r4 | % mm.0
  r8 c8 fs,8 a8
  \circle
  b8 r8 r4 | % mm.1
  r8 b8 e, g
  \circle
  a r8 r4 | % mm.2
  s8 a[ d, fs]
  \circle
  g16 % mm.3
}

bass = \relative { \voiceTwo
  \partial 2
  \hhighlight
  r8 d8 c b | % mm.0
  \circle
  a r8 r4 r8 c b a | % mm.1
  \circle
  g r8 r4 r8 b a g | % mm.2
  \circle
  fs8
}


\score {
   \new PianoStaff <<
      \override PianoStaff.SystemStartBrace.collapse-height = #20
      \override Score.SystemStartBar.collapse-height = #20
     \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } \new Voice { \alto }>>
     \new Staff = "lower" << \global \bar "" \clef bass \new Voice { \tenor } \new Voice { \bass } >>
   >>

   \layout {
     \context {
       \Score
       \override SpacingSpanner spacing-increment = 0.8
       \override StaffGrouper.staff-staff-spacing.basic-distance = 11
     }
   }
}
