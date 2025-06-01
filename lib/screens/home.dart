import 'package:final_project/screens/homecard.dart';
import 'package:final_project/widgets/card.dart';
import 'package:final_project/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        title: Text(
          'Skill Exchange',
          style: TextStyle(
            color: const Color(0xFF202D5A),
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF202D5A),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Courses',
                      style: TextStyle(
                        color: const Color.fromARGB(
                          255,
                          221,
                          221,
                          219,
                        ),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Your Hub for Skill exchange and experienced Connections',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  int columns = constraints.maxWidth > 600 ? 4 : 2;

                  return GridView.count(
                    crossAxisCount: columns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 1.1,
                    children: [
                      StatCard(
                        title: "My Services",
                        count: 0,
                        icon: Icons.person_search,
                        color: const Color(0xFFFFF2CC),
                        screen: const DetailScreen(
                          title: 'My Services',
                        ),
                      ),
                      StatCard(
                        title: "Sent Requests",
                        count: 0,
                        icon: Icons.send,
                        color: const Color(0xFFE9FFE4),
                        screen: const DetailScreen(
                          title: 'Sent Requests',
                        ),
                      ),
                      StatCard(
                        title: "Received Request",
                        count: 0,
                        icon: Icons.download,
                        color: const Color(0xFFE1F3FF),
                        screen: const DetailScreen(
                          title: 'Received Request',
                        ),
                      ),
                      StatCard(
                        title: "New Messages",
                        count: 0,
                        icon: Icons.mail,
                        color: const Color(0xFFF1E5FF),
                        screen: const DetailScreen(
                          title: 'New Messages',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
