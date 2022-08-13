\language "english"
\include "lily/helper.ly"

global = {\key e \minor \time 3/4}

soprano = \relative {
  \highlight
  a'8 gs a e b' e, | % mm.1
  c'4 r4 r4 | % mm.2
  b8 a b e, c' e, % mm.2
  \voiceOne
  d'4 r4 r4 | % mm.4
  \once \hide Score.BarLine \once \hide Score.SpanBar \break
  \oneVoice
  c8 b c a d a | % mm.5
  \revert Beam.color
  \voiceOne
  e'
  \unhighlight 
  c e b a f'! | % mm.6
  d b d a gs! e' | % mm.7
  c a d c b a | % mm.8
  gs16 % mm.9
}

bass = \relative { \voiceTwo
  a4 c, e | % mm.1
  a, r4 r4 | % mm.2
  d4\rest gs a_~ | % mm.3
  a8 b16 a gs8 b gs e | % mm.4
  \break
  a8 gs16 fs e a gs fs e d c b | % mm.5
  a4 r4 d8\rest a'8 | % mm.6
  b8 d,8\rest d4\rest d8\rest gs8 | % mm.7
  a d,8\rest d4\rest d8\rest d8 | % mm.8
  e16  % mm.9
}

tenor = \relative { \voiceOne
  \change Staff = "upper"
  \once \stemDown
  c'4
  \change Staff = "lower"
  a gs | % mm.1
  a16 e fs gs a e fs gs a b c d | % mm.2
  e4 d c | % mm.3
  b16
  \change Staff = "upper"
  \stemDown
  a' gs fs e a gs fs e d c b | % mm.4
  \break
  \change Staff = "lower"
  \stemUp
  a8 r8 r4 r4 | % mm.5
  r8 a8 c e f! r8 | % mm.6
  r8 d8 f! d b r8 | % mm.7
  r8 c b e d
  \change Staff = "upper"
  \stemDown
  f! | % mm.8
  e16 % mm.9
}

\score {
   \new PianoStaff <<
      \override PianoStaff.SystemStartBrace.collapse-height = #20
      \override Score.SystemStartBar.collapse-height = #20
      \new Staff = "upper" << \global \bar "" \clef treble \new Voice { \soprano } >>
      \new Staff = "lower" << \global \bar "" \clef bass  \new Voice { \bass } \new Voice { \tenor }>>
   >>

   \layout {
     \context {
       \Score
       \omit BarNumber
       \override SpacingSpanner spacing-increment = 0.8
       \override NonMusicalPaperColumn.line-break-permission = ##f
       \override NonMusicalPaperColumn.page-break-permission = ##f
     }
   }
}
