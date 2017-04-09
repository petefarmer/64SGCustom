% 64 SG Custom
\version "2.18.0"
\include "definitions_No-Tab.ly"
\include "AChords.ly"
\include "AChordsRefrain.ly"
\include "ALeadGuitar.ly"
\include "BLeadGuitar.ly"
\include "ALeadGuitarRefrain.ly"
\include "ABass.ly"
\include "BBass.ly"
\include "ABassRefrain.ly"
\include "BChords.ly"
\include "BChordsCoda.ly"
\include "ABeats.ly"
\include "ABeatsRefrain.ly"
\include "BBeats.ly"
\include "BBeatsCoda.ly"
\include "CChords.ly"
\include "CBeats.ly"

\book {
 \header {
  title = "64 SG Custom 3"
  subtitle = "DRAFT"
  subsubtitle = "v0.1"
  composer = "John Jorgenson"
  copyright = \markup { \char ##x00A9 Copyright Jorgensongs 2014 }
 }
%{
\markup {
 \fill-line {
  \score {
   <<
   \new ChordNames << 
       \StaticChordChart
     >>
   \new FretBoards << 
     \StaticChordChart
     >>
   >>
   \layout {
    line-width = #100
    ragged-last = ##t
    \context {
     \ChordNames
     \override ChordName.stencil = #text-interface::print-X-centered
    }

    \context {
     \FretBoards
     \override FretBoard.align-dir = #CENTER
    }
   }
  }
 }
}
%}

\score {
<<
  \context ChordNames {
   \override ChordName #'font-size = #-1
   \AChords
   \BChords
   \AChordsRefrain
%   \BChords
%   \CChords
%   \AChordsRefrain
%   \BChordsCoda
  }

%\unfoldRepeats
 \new StaffGroup <<

  \new RhythmicStaff \with {
   \consists "Pitch_squash_engraver"
%   squashedPostion = #0
   instrumentName = \markup {\column {"Rhythm" \line {"Guitar"}}}
   }{
   \override Staff.NoteHead.style = #'slash
   \overrideTimeSignatureSettings
    4/4 % timeSignatureFraction
    1/8 % baseMomentFraction
    #'(3 3 2) % beatStructure
    #'() % beamExceptions
   \time 4/4
   \tempo 4 = 100
%   \ABeats
%   \BBeats
%   \ABeatsRefrain
%   \BBeats
%   \CBeats
%   \ABeatsRefrain
%   \BBeatsCoda
  }


  \new Staff \with {
   instrumentName = \markup {\column {"Lead" \line {"Guitar"}}}
   \clef "treble_8"
  }{
   \key e \major
   \ALeadGuitar
   \BLeadGuitar
   \ALeadGuitarRefrain
  }


  \new Staff {
   \set Staff.instrumentName = #"Bass" 
   \clef "bass"
   \key e \major
   \ABass
   \BBass
   \ABassRefrain
  }

 >> % StaffGroup
>> % Chords OUTSIDE StaffGroup
 \layout {
  \context {
   \Score {
    \override StaffGrouper.staff-staff-spacing.padding = #5
    \override StaffGrouper.staff-staff-spacing.basic-distance = #5
   }
  }
  \context { \TabStaff \remove Clef_engraver }
 }
\midi {}
} % score
} % book
