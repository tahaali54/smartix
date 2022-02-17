import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  final String _logoPath =
      'https://media-exp1.licdn.com/dms/image/C4D0BAQGmoAgLliPeIg/company-logo_200_200/0/1625174567129?e=1652918400&v=beta&t=qBK4jS6CvaC0wub2NnyId_F4HSKrP-yWxG3zRnu6AuI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(_logoPath),
              ElevatedButton(
                child: const Text('GET STARTED'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
