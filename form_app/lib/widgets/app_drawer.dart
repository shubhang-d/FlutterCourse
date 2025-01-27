import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-photo/background-with-colorful-pattern-texture-abstract-wave_1103290-42578.jpg?semt=ais_hybrid'),
            ),
            accountName: Text("John"),
            accountEmail: Text(
              "john@example.com",
            ),
            otherAccountsPictures: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/profile.jpg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/profile.jpg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/profile.jpg'),
              ),
            ],
            onDetailsPressed: () {},
          ),

          ListTile(
            onTap: () {},
            // selectedColor: Colors.indigo,
            // selected: index % 2 == 0,
            leading: Icon(Iconsax.user),
            title: Text("Profile "),
            subtitle: Text("This is for action for about us"),
            trailing: Icon(Iconsax.more),
          ),
          ListTile(
            onTap: () {},
            // selectedColor: Colors.indigo,
            // selected: index % 2 == 0,
            leading: Icon(Iconsax.info_circle),
            title: Text("About us "),
            subtitle: Text("This is for action for about us"),
            trailing: Icon(Iconsax.more),
          ),

          Spacer(),

          ListTile(
            selectedColor: Colors.red,
            selected: true,
            leading: Icon(Iconsax.logout),
            title: Text("Log out"),
          ),

          SizedBox(height: 30),

          // Expanded(
          //   child: ListView.separated(
          //     padding: EdgeInsets.zero,
          //     separatorBuilder: (context, index) => Divider(),
          //     itemCount: 15,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         onTap: () {},
          //         // selectedColor: Colors.indigo,
          //         // selected: index % 2 == 0,
          //         leading: Icon(Iconsax.note),
          //         title: Text("Option ${index + 1} "),
          //         subtitle: Text("This is for action ${index + 1}"),
          //         trailing: Icon(Iconsax.more),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
