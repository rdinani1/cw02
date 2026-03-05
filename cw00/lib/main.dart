import 'package:flutter/material.dart';

// Theme seed colors (reliable in modern Flutter)
final Map<String, Color> themeSeeds = {
  'Purple': Colors.purple,
  'Blue': Colors.blue,
  'Green': Colors.green,
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTheme = 'Purple';

  @override
  Widget build(BuildContext context) {
    final seed = themeSeeds[_currentTheme] ?? Colors.purple;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Awesome App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorScheme.fromSeed(seedColor: seed).primary,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorScheme.fromSeed(seedColor: seed).primary,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: HomePage(
        currentTheme: _currentTheme,
        onThemeChanged: (theme) {
          debugPrint('Theme changed to: $theme'); // <-- proves it’s firing
          setState(() {
            _currentTheme = theme;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String currentTheme;
  final ValueChanged<String> onThemeChanged;

  const HomePage({
    super.key,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter is Fun!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Theme switcher
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Theme: '),
                DropdownButton<String>(
                  value: currentTheme,
                  items: themeSeeds.keys
                      .map(
                        (name) => DropdownMenuItem(
                          value: name,
                          child: Text(name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) onThemeChanged(value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Obvious indicator bar
            Container(
              width: 220,
              height: 12,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 20),

            const ProfileCard(
              name: 'Riya Dinani',
              major: 'Computer Science',
            ),

            const SizedBox(height: 20),

            const Text(
              'Welcome to My App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              "Let's learn Flutter together",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                debugPrint('Pressed!');
              },
              child: const Text('Press Here!'),
            ),

            const SizedBox(height: 30),

            const Text('Created by: Riya Dinani'),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String major;

  const ProfileCard({
    super.key,
    required this.name,
    required this.major,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.person, size: 50, color: primary),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Major: $major',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
