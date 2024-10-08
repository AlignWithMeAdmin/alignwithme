import 'package:align_with_me/userCreation.dart';
import 'package:align_with_me/userRegistrationForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Import rendering.dart for SystemMouseCursors
import 'homePage.dart';
import 'package:align_with_me/newUser.dart';

class AlignWithMeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AlignWithMeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 97, 98, 99),
      title: MouseRegion(
        cursor: SystemMouseCursors.click, // Set cursor to hand icon
        child: GestureDetector(
          onTap: () {
            Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: const Text(
            'Align With Me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.login,
                color: Colors.white, // Set icon color to white
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            TextButton(
              onPressed: () {
                // Handle login button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.person_add,
                color: Colors.white, // Set icon color to white
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationForm()),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewUser()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AlighWithMeLayout extends StatelessWidget {
  const AlighWithMeLayout({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AlignWithMeAppBar(),
      backgroundColor: Color.fromARGB(255, 97, 98, 99),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: isDesktop(context) ?
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: LeftNavView(),
              ),
              const Expanded(
                flex: 4,
                child: ContentView(),
              ),
              const Expanded(
                flex: 1,
                child: RightNavView(),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                flex: 1,
                child: TopNavView(),
              ),
              const Expanded(
                flex: 8,
                child: ContentView(),
              ),
              const Expanded(
                flex: 1,
                child: BottomNavView(),
              ),
            ],
          ),
        ),
    );
  }
}

//Makes form fields, buttons change with screen size
class PaddedWidget extends StatelessWidget {
  final Widget child;

  const PaddedWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double paddingValue = constraints.maxWidth * 0.25;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingValue),
          child: Container(
            //width: constraints.maxWidth * paddingPercentage, // Example: 25% of the column width
            child: child,
          ),
        );
      },
    );
  }
}