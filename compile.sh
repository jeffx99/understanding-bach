#!/bin/bash
set -o history
set -o histexpand

cd src
lilypond-book --pdf --output=../out book.lytex

cd ../out
pdflatex -output-directory ../pdf book.tex; !!
