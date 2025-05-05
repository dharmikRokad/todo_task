import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('📱 App Overview'),
          _sectionBody(
            'A local offline ToDo app built with Flutter, using Clean Architecture, BLoC for state management, and SQLite for data persistence.',
          ),

          _sectionTitle('🎯 Features'),
          _bulletList([
            'Add, edit, delete ToDo tasks',
            'Mark ToDo as done (with smooth color transition)',
            'View pending ToDos grouped by created date',
            'Swipe to delete with confirmation dialog',
            'Edit ToDo using a pre-filled dialog',
            'Toggle between dark and light themes',
          ]),

          _sectionTitle('🗂️ Tech Stack'),
          _bulletList([
            'Flutter',
            'State Management: flutter_bloc',
            'Database: SQLite (sqflite package)',
            'Dependency Injection: get_it',
            'Architecture: Clean Architecture (Data, Domain, Presentation layers)',
          ]),

          _sectionTitle('🔍 Clean Architecture Layers'),
          _bulletList([
            'Data Layer → DataSource + Repository Implementation',
            'Domain Layer → Entities + Repository Abstraction + UseCases',
            'Presentation Layer → UI + BLoC + Widgets',
          ]),

          _sectionTitle('⚙️ Special Design Choices'),
          _bulletList([
            'Theme switching via ThemeBloc and AppThemes',
            'Database injected using GetIt for decoupled dependencies',
            'Testable and extendable by adhering to SOLID principles',
          ]),

          const SizedBox(height: 24),
          Center(
            child: Text(
              '👨‍💻 Developer: Dharmik Rokad',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  Widget _sectionBody(String text) =>
      Text(text, style: const TextStyle(fontSize: 16));

  Widget _bulletList(List<String> items) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
        items
            .map(
              (item) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(item, style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            )
            .toList(),
  );
}
