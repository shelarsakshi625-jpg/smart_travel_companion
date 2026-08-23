import 'package:flutter/material.dart';

void main() {
  runApp(const SmartTravelApp());
}

class SmartTravelApp extends StatelessWidget {
  const SmartTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Travel Companion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ---------------- LOGIN PAGE ----------------

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.travel_explore,
                    size: 80,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 15),

                  const Text(
                    'Smart Travel Companion',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: login,
                      child: const Text('Login'),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: login,
                    child: const Text('Create New Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME PAGE ----------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget travelCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Travel Companion'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Welcome, Sakshi! 👋',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('Everything you need for your journey in one place.'),

            const SizedBox(height: 20),

            travelCard(
              context,
              'Current Location',
              'View your travel location',
              Icons.location_on,
              Colors.red,
              const LocationPage(),
            ),

            travelCard(
              context,
              'Weather',
              'Check current weather',
              Icons.cloud,
              Colors.blue,
              const WeatherPage(),
            ),

            travelCard(
              context,
              'Travel Documents',
              'Manage your travel documents',
              Icons.folder,
              Colors.orange,
              const DocumentsPage(),
            ),

            travelCard(
              context,
              'Notifications',
              'View travel notifications',
              Icons.notifications,
              Colors.purple,
              const NotificationsPage(),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- LOCATION PAGE ----------------

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(25),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, size: 80, color: Colors.red),
                SizedBox(height: 15),
                Text(
                  'Current Location',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Pune, Maharashtra, India', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- WEATHER PAGE ----------------

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(25),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
                const SizedBox(height: 15),
                const Text(
                  '28°C',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text('Sunny • Pune'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- DOCUMENTS PAGE ----------------

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final List<String> documents = ['Passport.pdf', 'Travel Ticket.pdf'];

  void addDocument() {
    setState(() {
      documents.add('New Travel Document.pdf');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Documents')),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: Text(documents[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addDocument,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ---------------- NOTIFICATIONS PAGE ----------------

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<String> notifications = const [
    'Your trip starts tomorrow!',
    'Weather update: Sunny today.',
    'Don’t forget your travel documents.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.purple),
              title: Text(notifications[index]),
            ),
          );
        },
      ),
    );
  }
}
