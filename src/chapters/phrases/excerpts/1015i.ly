\language "english"
\include "lily/helper.ly"

global = {\key a \major \time 6/8}

violin = \relative {
  \highlight
  a'4 e8 fs16 gs gs8.^\trill fs32 gs |  % mm.1
  \revert Beam.color
  a16( \unhighlight gs) a( b) cs( b) \grace { b( cs) } d8 cs16 b16 e8 | % mm.2
  cs e a~ a16 gs16 b4 | % mm.3
  \flag a16
}

soprano = \relative {
R2. | % mm.1
\highlight a'4 e8 fs16 gs gs8.^\trill fs32 gs |  % mm.2
\revert Beam.color
a16( \unhighlight gs) a( b) cs( b) \grace { b( cs) } d8 cs16 b16 e8 | % mm.3
cs16
}

bass = \relative {
a,2.~ | % mm.1
a |  % mm.2
\highlight a'4 e8 fs16 gs gs8.^\trill fs32 gs |  % mm.3
a16
}

\score {
  %\override Score.SystemStartBar.collapse-height = #20
  \new StaffGroup <<
    \new Staff = "violin" << \global \bar "" \clef treble  \new Voice { \violin } >>
    \new Staff = "upper" << \global \clef treble \new Voice { \soprano } >>
    \new Staff = "lower" << \global \clef bass   \new Voice { \bass } >>
  >>

  \layout {
    \context {
      \Score
      \override SpacingSpanner spacing-increment = 0.9
    }
  }
}
