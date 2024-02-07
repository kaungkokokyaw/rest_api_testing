import 'package:flutter/material.dart';
import 'package:rest_api/model/user.dart';
import 'package:rest_api/services/user_api.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return ListTile(
              leading: CircleAvatar(
                // ignore: unnecessary_null_comparison
                backgroundImage: user.picture != null
                    ? NetworkImage(user.picture.thumbnail)
                    : const NetworkImage(
                        'https://i.pinimg.com/564x/e3/ad/03/e3ad0345aa216f48c873d65f188de93b.jpg'),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.location.city),
              // tileColor: color,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();

    setState(() {
      users = response;
    });
  }
}
