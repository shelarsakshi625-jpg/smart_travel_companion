import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentDashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    AttendancePage(),
    AssignmentPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ================= HOME =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.indigo,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 55,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Good Morning',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Sakshi Shelar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: const [
                    Text(
                      'StudentDashboard',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        Info('Roll No', '73'),
                        Info('Semester', '5th'),
                        Info('Division', 'C'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SectionTitle(
              title: 'Academic Overview',
            ),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: const [
                StatCard(
                  title: 'Attendance',
                  value: '87%',
                  icon: Icons.percent,
                ),
                StatCard(
                  title: 'CGPA',
                  value: '8.6',
                  icon: Icons.grade,
                ),
                StatCard(
                  title: 'Assignments',
                  value: '12',
                  icon: Icons.assignment,
                ),
                StatCard(
                  title: 'Subjects',
                  value: '6',
                  icon: Icons.book,
                ),
              ],
            ),

            const SectionTitle(
              title: "Today's Timetable",
            ),

            const SubjectTile(
              subject: 'Java Programming',
              time: '09:00 AM',
            ),
            const SubjectTile(
              subject: 'Database Management',
              time: '11:00 AM',
            ),
            const SubjectTile(
              subject: 'Computer Networks',
              time: '01:30 PM',
            ),
            const SubjectTile(
              subject:
                  'Mobile Application Development',
              time: '03:30 PM',
            ),

            const SectionTitle(
              title: 'Notice Board',
            ),

            const NoticeTile(
              title: 'Internal Exam Schedule',
              subtitle:
                  'Exam starts from 25 August.',
              icon: Icons.event,
            ),

            const NoticeTile(
              title: 'Project Submission',
              subtitle:
                  'Submit project before Friday.',
              icon: Icons.upload_file,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ================= ATTENDANCE =================

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(title: 'Attendance'),

            const SizedBox(height: 25),

            const Text(
              'Overall Attendance',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      value: 0.87,
                      strokeWidth: 14,
                      color: Colors.green,
                      backgroundColor:
                          Colors.grey.shade300,
                    ),
                  ),
                  const Text(
                    '87%',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const SectionTitle(
              title: 'Subject Wise Attendance',
            ),

            const Attend(
              subject: 'Java Programming',
              value: 0.92,
            ),
            const Attend(
              subject: 'Database Management',
              value: 0.85,
            ),
            const Attend(
              subject: 'Computer Networks',
              value: 0.88,
            ),
            const Attend(
              subject:
                  'Mobile Application Development',
              value: 0.90,
            ),
            const Attend(
              subject: 'Software Engineering',
              value: 0.80,
            ),
            const Attend(
              subject: 'Web Technology',
              value: 0.87,
            ),
          ],
        ),
      ),
    );
  }
}

// ================= ASSIGNMENTS =================

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(title: 'Assignments'),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: const [
                AssignmentCard(
                  subject: 'Java Programming',
                  title: 'Exception Handling',
                  date: '20 Aug 2026',
                  status: 'Pending',
                ),
                AssignmentCard(
                  subject: 'Database Management',
                  title: 'SQL Queries',
                  date: '22 Aug 2026',
                  status: 'Submitted',
                ),
                AssignmentCard(
                  subject: 'Computer Networks',
                  title: 'OSI Model',
                  date: '24 Aug 2026',
                  status: 'Pending',
                ),
                AssignmentCard(
                  subject: 'Flutter',
                  title: 'StudentDashboard',
                  date: '28 Aug 2026',
                  status: 'Pending',
                ),
                AssignmentCard(
                  subject: 'Web Technology',
                  title: 'HTML and CSS Project',
                  date: '30 Aug 2026',
                  status: 'Submitted',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= PROFILE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(title: 'Profile'),

            const SizedBox(height: 25),

            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Sakshi Shelar',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Computer Technology',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            const ProfileItem(
              title: 'Student ID',
              value: '73',
            ),
            const ProfileItem(
              title: 'Email',
              value: 'student@example.com',
            ),
            const ProfileItem(
              title: 'Mobile',
              value: '+91 XXXXX XXXXX',
            ),
            const ProfileItem(
              title: 'College',
              value: 'Polytechnic College',
            ),
            const ProfileItem(
              title: 'Class',
              value: 'Computer Technology - C',
            ),
            const ProfileItem(
              title: 'Academic Year',
              value: '2026 - 2027',
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ================= REUSABLE WIDGETS =================

class Header extends StatelessWidget {
  final String title;

  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      color: Colors.indigo,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        15,
        15,
        15,
        10,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String title;
  final String value;

  const Info(
    this.title,
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.indigo,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(title),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  final String subject;
  final String time;

  const SubjectTile({
    super.key,
    required this.subject,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.book,
          color: Colors.indigo,
        ),
        title: Text(subject),
        trailing: Text(
          time,
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NoticeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const NoticeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.orange,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }
}

class Attend extends StatelessWidget {
  final String subject;
  final double value;

  const Attend({
    super.key,
    required this.subject,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final int percentage = (value * 100).round();

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(subject),
                ),
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: value,
              minHeight: 8,
              borderRadius:
                  BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final String subject;
  final String title;
  final String date;
  final String status;

  const AssignmentCard({
    super.key,
    required this.subject,
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool submitted =
        status == 'Submitted';

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.assignment,
          color: Colors.indigo,
          size: 35,
        ),
        title: Text(
          subject,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '$title\nDue: $date',
        ),
        isThreeLine: true,
        trailing: Text(
          status,
          style: TextStyle(
            color: submitted
                ? Colors.green
                : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.person,
          color: Colors.indigo,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}