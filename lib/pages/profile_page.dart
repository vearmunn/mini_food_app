import 'package:flutter/material.dart';
import 'package:mini_food_app/components/mybutton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
              ),
              const Text(
                'Profile',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.red,
                          width: double.infinity,
                          height: 300,
                          child: Image.network(
                            'https://images.pexels.com/photos/20726113/pexels-photo-20726113/free-photo-of-a-view-of-the-city-of-siena-italy.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          'Best View in Bahamas',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const MyButton(text: 'Register')
            ],
          ),
        ),
      ),
    );
  }
}
