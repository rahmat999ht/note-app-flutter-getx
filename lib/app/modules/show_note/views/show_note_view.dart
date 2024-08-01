import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_note_controller.dart';

class ShowNoteView extends GetView<ShowNoteController> {
  const ShowNoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShowNoteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShowNoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
