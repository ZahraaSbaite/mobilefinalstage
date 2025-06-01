import 'package:final_project/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF202D5A)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const AssetImage(
                    'assets/images/profile.jpg',
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "User Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_border,
              color: const Color(0xFF202D5A),
              size: 18.sp,
            ),
            title: Text(
              "Favorites",
              style: TextStyle(
                color: const Color(0xFF202D5A),
                fontSize: 14.sp,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
