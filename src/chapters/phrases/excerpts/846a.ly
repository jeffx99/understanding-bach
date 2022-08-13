\language "english"
\include "lily/helper.ly"

global = {\key c \major \time 4/4}

soprano = \relative { \voiceOne
  r8 g'16 c e g, c e r8 g,16 c e g, c e | % mm.1
  r8 a,16 d f a, d f r8 a,16 d f a, d f |
  r8 g,16 d' f g, d' f r8 g,16 d' f g, d' f | \bar ""
}

tenor = \relative { \voiceTwo
  r16 e'8.~ e4 r16 e8.~ e4 | % mm.1
  r16 d8.~ d4 r16 d8.~ d4 | % mm.2
  r16 d8.~ d4 r16 d8.~ d4 | % mm.3
}

bass = \relative { \voiceTwo
  c'2 c | % mm.1
  c c | % mm.2
  b b | % mm.3
}


\score {
   \new PianoStaff <<
     \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } \new Voice { \tenor } >>
     \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass } >>
   >>

   \layout {
     \context {
       \Score
       \override SpacingSpanner spacing-increment = 0.5
     }
   }
}
