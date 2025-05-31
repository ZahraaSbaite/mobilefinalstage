import 'package:final_project/screens/homecard.dart';
import 'package:final_project/widgets/card.dart';
import 'package:final_project/widgets/drawer.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        title: const Text('Skill Exchange'),
        titleTextStyle: TextStyle(
          color: Color(0xFF202D5A),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: true,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF202D5A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Courses',
                      style: TextStyle(
                        color: Color.fromARGB(255, 221, 221, 219),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your Hub for Skill exchange and experienced Connections',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  StatCard(
                    title: "My Services",
                    count: 0,
                    icon: Icons.person_search,
                    color: Color(0xFFFFF2CC),
                    screen: DetailScreen(title: 'My Services'),
                  ),
                  StatCard(
                    title: "Sent Requests",
                    count: 0,
                    icon: Icons.send,
                    color: Color(0xFFE9FFE4),
                    screen: DetailScreen(title: 'Sent Requests'),
                  ),
                  StatCard(
                    title: "Received Request",
                    count: 0,
                    icon: Icons.download,
                    color: Color(0xFFE1F3FF),
                    screen: DetailScreen(title: 'Received Request'),
                  ),
                  StatCard(
                    title: "New Messages",
                    count: 0,
                    icon: Icons.mail,
                    color: Color(0xFFF1E5FF),
                    screen: DetailScreen(title: 'New Messages'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
