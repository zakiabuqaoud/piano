
//Flutter Import
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';

//External Library
import 'package:piano/piano.dart';

//My Path Files

class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  State<Piano> createState() => _PianoState();
}
class _PianoState extends State<Piano> {
  final _flutterMidi = FlutterMidi();
  @override
  void initState() {
    load('assets/sound_font/Yamaha-Grand-Lite-SF-v1.1.sf2');
    super.initState();
  }

  void load(String asset) async {
    _flutterMidi.unmute(); // Optionally Unmute
    ByteData _byte = await rootBundle.load(asset);
    _flutterMidi.prepare(sf2: _byte);
  }


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
        _flutterMidi.playMidiNote(midi: position.pitch);
      },
    );
  }
}
