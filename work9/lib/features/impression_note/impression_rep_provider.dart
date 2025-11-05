import 'package:flutter/material.dart';
import 'package:work9/features/impression_note/repository/impression_notes_repository.dart';



class ImpressionRepProvider extends InheritedWidget {
  final ImpressionNoteRepository impressionNoteRepository;

  const ImpressionRepProvider({
    super.key,
    required this.impressionNoteRepository,
    required Widget child,
  }) : super(child: child);

  static ImpressionRepProvider of(BuildContext context) {
    final ImpressionRepProvider? result =
    context.dependOnInheritedWidgetOfExactType<ImpressionRepProvider>();
    assert(result != null, 'ImpressionRepProvider null');
    return result!;
  }

  @override
  bool updateShouldNotify(ImpressionRepProvider oldWidget) =>
      oldWidget.impressionNoteRepository != impressionNoteRepository;
}