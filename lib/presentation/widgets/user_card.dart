import 'package:bloc_sample_app/data/models/user_models.dart';
import 'package:flutter/material.dart';

class UserCardsWidget extends StatelessWidget {
  const UserCardsWidget({super.key, required this.userData});
  final List<UserApiResults> userData;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1232
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: userData.length,
            itemBuilder: (BuildContext context, int index) =>
                buildUserCard(index, data: userData))
        : GridView.builder(
            shrinkWrap: true,
            itemCount: userData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18.0,
              mainAxisSpacing: 60.0,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (BuildContext context, int index) =>
                buildUserCard(index, data: userData));
  }
}

Widget buildUserCard(int index, {required List<UserApiResults> data}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 140,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 70,
                  color: Colors.teal[800],
                ),
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 5, color: Colors.teal[800]!),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        data[index].picture!.medium.toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Hi! My name is',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 5),
          Text(
            '${data[index].name?.title} ${data[index].name?.first} ${data[index].name?.last}',
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Divider(
            endIndent: 100,
            indent: 100,
            thickness: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.streetview_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.phone),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}
