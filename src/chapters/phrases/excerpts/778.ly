\language "english"
\include "lily/helper.ly"

global = {\key e \minor \time 4/4}

soprano = \relative {
  \highlight
  r8 b'16 a g fs g e
  \revert Beam.color
  b'8^\mordent
  \unhighlight
  b8 e8.^\mordent fs16 | % mm.1
  \highlight \revert NoteHead.color \revert Stem.color
  ds8^\prall
  \highlight
  fs16 e
  ds cs ds b
  \revert Beam.color
  b'8
  \unhighlight
  a16 g fs8.^\prall e32 fs | % mm.2
  g8
}

bass = \relative {
  e^\mordent e, r4 r8
  \highlight
  b''16 a g fs g e |
  \revert Beam.color
  b'8
  \unhighlight
  b, r4 r8
  \highlight
  fs''16 e ds cs ds b|
  e8
}

\score {
    \new PianoStaff <<
        \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } >>
        \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass } >>
    >>

    \layout {
      \context {
        \Score
        \override SpacingSpanner spacing-increment = 0.6
      }
    }
}
