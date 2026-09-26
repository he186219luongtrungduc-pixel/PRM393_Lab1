import 'package:flutter/material.dart';

// ======================================================
// EXERCISE 1
// Core Widgets
// ======================================================

// EXERCISE 1

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercise 1 - Core Widgets')),
      body: Column(
        children: [
          Text('Welcome to Flutter UI'),

          Icon(Icons.movie),

          Image.network(
            'https://media.istockphoto.com/id/515278244/photo/aerial-view-above-the-expressway-and-ring-road.jpg?s=170667a&w=0&k=20&c=vofCmYvO-Kold1_-zYT9I4KxeUWaMHoaJq2ht_hr4pE=',
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text('Movie Item'),
              subtitle: Text('This is a movie'),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// EXERCISE 2
// Input Widgets
// ======================================================

// EXERCISE 2

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});
  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  double sliderValue = 50;
  bool switchValue = false;
  String? selectedOption;
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercise 2 - Layouts')),
      body: Column(
        children: [
          Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          Text('Value : ${sliderValue.toInt()}'),
          Text('Switch'),
          Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
          Text(switchValue ? 'ON' : 'OFF'),

          Text('Radio'),

          RadioListTile<String>(
            title: Text('Action'),
            value: 'Action',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),

          RadioListTile<String>(
            title: Text('Comedy'),
            value: 'Comedy',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),

          Text('Selected: ${selectedOption ?? 'None'}'),

          ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Text('Pick Date'),
          ),

          Text(
            selectedDate == null
                ? 'No date selected'
                : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
          ),
        ],
      ),
    );
  }
}

// ======================================================
// EXERCISE 3
// Layout Basics
// ======================================================

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  final List<String> movies = const [
    "Avatar",
    "Inception",
    "Interstellar",
    "Joker",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 3 - Layout Demo")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const Text(
              "Now Playing",

              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),

                      child: Row(
                        children: [
                          CircleAvatar(child: Text(movies[index][0])),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  movies[index],

                                  style: const TextStyle(
                                    fontSize: 18,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                const Text("Sample description"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} // ======================================================
// ======================================================
// EXERCISE 4
// Scaffold + AppBar + FAB + Theme + Dark Mode
// ======================================================

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        brightness: Brightness.light,

        colorSchemeSeed: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,

        colorSchemeSeed: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercise 4 - App Structure"),

          actions: [
            Row(
              children: [
                const Text("Dark"),

                Switch(
                  value: darkMode,

                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),

        body: Center(
          child: Text(
            darkMode ? "Dark Mode Enabled" : "Light Mode Enabled",

            style: const TextStyle(fontSize: 20),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Button clicked");
          },

          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// ======================================================
// EXERCISE 5
// Debug & Fix Common UI Errors
// ======================================================

class Exercise5 extends StatefulWidget {
  const Exercise5({super.key});

  @override
  State<Exercise5> createState() => _Exercise5State();
}

class _Exercise5State extends State<Exercise5> {
  int counter = 0;

  DateTime? selectedDate;

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 5 - UI Fixes")),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),

            child: Text(
              "Correct ListView inside Column using Expanded",

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 5,

              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.movie),

                  title: Text("Movie ${index + 1}"),
                );
              },
            ),
          ),

          Text("Counter: $counter"),

          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },

            child: const Text("Increase"),
          ),

          ElevatedButton(
            onPressed: () {
              pickDate(context);
            },

            child: const Text("Open Date Picker"),
          ),

          Padding(
            padding: const EdgeInsets.all(8),

            child: Text(
              selectedDate == null
                  ? "No date selected"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            ),
          ),
        ],
      ),
    );
  }
}
