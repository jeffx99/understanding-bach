 \language "english"
\include "lily/helper.ly"

global = {\key d \minor \time 3/4}

soprano = \relative {
  \highlight
  f''4 e d | % mm.1
  cs^\prall \appoggiatura cs8 d2 | % mm.2
  \unhighlight
  a4 bf8 a g bf | % mm.3
  a4 g8 f e d | % mm.4
  \highlight
  f'4 e d | % mm.5
  bf' a2~ | % mm.6
  \unhighlight
  a4
  \stemUp
  g8 f e d | % mm.7
  cs2.^\prall | \bar "" % mm.8
}

bass = \relative {
  d8 a' e a f a | % mm.1
  g a f a e a | % mm.2
  f a g f e d | % mm. 3
  cs4^\prall d2 | % mm. 4

  d8 d' e, d' f, d' | % mm.5
  g,2 r8 f8 | % mm.6
  bf2. | % mm.7
  \flag
  a2. | % mm.8
}

tenor = \relative { \voiceOne
  s2. | s2. | s2. | s2. | s2. | % mm.1-5
  r8 d'8 cs a d4 | % mm.6
  r8 cs8
  \change Staff = "upper"
  \stemDown
  d e f g | % mm.7
  a2. | % mm.8
}

\score {
    \new PianoStaff <<
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } >>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass } \new Voice { \tenor }>>
    >>

    \layout {
      \context {
        \Score
        \override SpacingSpanner spacing-increment = 0.8
        \override StaffGrouper.staff-staff-spacing.basic-distance = 11
      }
    }
}
