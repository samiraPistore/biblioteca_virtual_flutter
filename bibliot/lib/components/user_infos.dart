import 'package:bibliot/models/user_modal.dart';
import 'package:bibliot/routes/app.routes.dart';
import 'package:bibliot/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserInfos extends StatefulWidget {
  const UserInfos({super.key});

  @override
  State<UserInfos> createState() => _UserInfosState();
}

class _UserInfosState extends State<UserInfos> {
  final box = Hive.box('user');
  final name = Hive.box('user').get("name");
  final email = Hive.box('user').get("email");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF122F51),
                  borderRadius: BorderRadius.circular(10),
                ),
                accountName: Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  email,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    name != null && name.isNotEmpty
                        ? name[0].toUpperCase()
                        : "U",
                    style: TextStyle(fontSize: 40, color: Color(0xFF122F51)),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
