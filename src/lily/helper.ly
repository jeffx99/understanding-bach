brokenTie =
#(define-music-function (direction X-offset Y-offset) (ly:dir? real? real?)
#{
    \once \override LaissezVibrerTie.X-extent = #'(0 . 0)
    \once \override LaissezVibrerTie.details.note-head-gap = #'-1
    %\once \override LaissezVibrerTie.extra-offset = #(cons (/ further 2) 0)

    \once \override LaissezVibrerTie.direction = #direction
    %\once \override LaissezVibrerTie.X-offset = #X-offset
    %\once \override LaissezVibrerTie.Y-offset = #Y-offset
    \once \override LaissezVibrerTie.rotation = #(list 180 X-offset Y-offset)
    \once \override LaissezVibrerTie.dash-definition = #'((0 0.5 1 1) (0.5 1 0 0))

    <>\laissezVibrer
#})

circle =
\once \override NoteHead.stencil = #(lambda (grob)
    (let* ((note (ly:note-head::print grob))
           (combo-stencil (ly:stencil-add
               note
               (circle-stencil note 0.1 0.45))))
          (ly:make-stencil (ly:stencil-expr combo-stencil)
            (ly:stencil-extent note X)
            (ly:stencil-extent note Y))))

highlight = {
  \override NoteHead.color = #(rgb-color 0.31 0.24 0.62) %#(rgb-color 0.02 0.33 0.56)
  \override Stem.color = #(rgb-color 0.31 0.24 0.62) %#(rgb-color 0.02 0.33 0.56)
  \override Beam.color = #(rgb-color 0.31 0.24 0.62) %#(rgb-color 0.02 0.33 0.56)
}

hhighlight = {
  \override NoteHead.color = #(rgb-color 0.62 0.24 0.31) %#(rgb-color 0.02 0.33 0.56)
  \override Stem.color = #(rgb-color 0.62 0.24 0.31)  %#(rgb-color 0.02 0.33 0.56)
  \override Beam.color = #(rgb-color 0.62 0.24 0.31)  %#(rgb-color 0.02 0.33 0.56)
}

unhighlight = {
  \revert NoteHead.color
  \revert Stem.color
  \revert Beam.color
}

mark = \override NoteHead.color = "blueviolet"
flag = \override NoteHead.color = "lightcoral"
