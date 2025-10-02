import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage("https://th.bing.com/th/id/OIP.0H5koaNYDnz0O5ilPu6q4QHaHa?w=197&h=197&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Akash Kumar Verma', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("akash@gmail.com")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            profileicon("Notifications",Icons.notifications,Color(0xff4A90E2)),
            profileicon("Payment Method",Icons.payment,Color(0xffF5A623)),
            profileicon("Reward Credits",Icons.workspace_premium,Color(0xff50E3C2)),
            profileicon("My Promo Code",Icons.code,Color(0xffBD10E0)),
            profileicon("Settings",Icons.settings,Color(0xffFF6B6B)),
            profileicon("Invite Friends",Icons.person_add,Color(0xff34495E)),
            profileicon("Help Center",Icons.headphones,Color(0xffB89D9F9)),
            profileicon("About Us",Icons.info_rounded,Color(0xff7ED321)),
          ],
        ),
      ),
    );
  }

  Widget profileicon(String name, IconData icon, Color color) {
    return ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[400]!,width: 2)
              ),
              child: Icon(icon,color: Colors.white)
            ),
            title: Text(name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
          );
  }
}