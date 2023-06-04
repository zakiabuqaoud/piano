
//Flutter Import
import 'package:flutter/cupertino.dart';

//External Library
import 'package:piano/piano.dart';

//My Path Files

class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  State<Piano> createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  @override
  Widget build(BuildContext context) {
    return  InteractivePiano(
      highlightedNotes: [
        NotePosition(note: Note.C, octave: 3)
      ],
      keyWidth: 60,
      noteRange: NoteRange.forClefs([
        Clef.Treble,
      ]),
      onNotePositionTapped: (position) {
        // Use an audio library like flutter_midi to play the sound

      },
    );
  }
}
