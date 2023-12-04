import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:flutter/material.dart';

class ProfileSectionWidget extends StatelessWidget {
  const ProfileSectionWidget({super.key, required this.userData});
  final List<UserApiResults> userData;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[700],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage:
                  NetworkImage(userData[0].picture!.large.toString()),
            ),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 60),
                  Text(
                    '${userData[0].name?.title} ${userData[0].name?.first} ${userData[0].name?.last}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'email : ${userData[0].email}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'phone : ${userData[0].phone}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
