import 'package:flutter/material.dart';
import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class ConvexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height); // start point
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 50, // curve point
      size.width,
      size.height, // final point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .start,
        children: [
          Expanded(
            child: Stack(
              fit: .expand,
              children: [
                ClipPath(
                  clipper: ConvexClipper(),
                  child: ColorFiltered(
                    colorFilter: .matrix(<double>[
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
                    child: Image(
                      image: AssetImage('assets/images/login.jpg'),
                      fit: .cover,
                    ),
                  ),
                ),
                Align(
                  alignment:
                      Alignment.topCenter, // center, topLeft, bottomRight, etc.
                  child: Padding(
                    padding: .all(100),
                    child: Text(
                      'My Personal Cash',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Login'),
          ),

          SizedBox.fromSize(size: .fromHeight(50)),

          Row(
            mainAxisAlignment: .spaceBetween,

            children: [
              Text(
                'Version 1.0.0',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Row(
                children: [
                  Text(
                    'Configuración',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Icon(Icons.settings, size: 16),
                ],
              ),
            ],
          ),

          SizedBox.fromSize(size: .fromHeight(30)),
        ],
      ),
    );
  }
}
