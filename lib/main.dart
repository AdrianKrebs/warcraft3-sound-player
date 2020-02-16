// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() => runApp(MyApp());
final List<SoundFile> entries = <SoundFile>[
  new SoundFile('Ja mein Lord', 'human/ja_mein_lord.flac'),
  new SoundFile('Ich bin tot', 'human/ich_bin_tot.flac'),
  new SoundFile('Ich geh dann mal', 'human/ich_geh_dann_mal.flac'),
  new SoundFile('Na gut', 'human/na_gut.flac'),
  new SoundFile('Pferd getreten', 'human/pferd_getreten.flac'),
  new SoundFile('Bereit zur Arbeit', 'human/bereit_zur_arbeit.flac'),


  new SoundFile('Das kann ich', 'orc/das_kann_ich.flac'),
  new SoundFile('Arbeit Arbeit', 'orc/arbeit_arbeit.flac'),

];

class SoundFile {
  String title;
  String fileName;

  SoundFile(this.title, this.fileName);


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warcraft 3 Sound Player',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: _buildRow(entries[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildRow(SoundFile soundFile) {
    return ListTile(
        title: Text(
          soundFile.title,
          style: _biggerFont,
        ),
        trailing: Icon(
          // Add the lines from here...
          Icons.play_arrow,
          color: Colors.lightBlue,
        ),
        onTap: () {
          AudioCache player = new AudioCache();
          String alarmAudioPath = soundFile.fileName;
          player.play(alarmAudioPath);
          print('log me');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warcraft 3 Sound Player'),
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
