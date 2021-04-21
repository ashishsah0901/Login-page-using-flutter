import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// this is the main app layout or main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this is shown on the tab
      title: "Login Page",
      // this is the actual content of the page
      home: LoginPage(),
      // this sets the color of the app
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}

// this is the stateful widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//  this is imported for the animation as we're having only one animation we have imported the single mixin
class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  // this controls the animation
  AnimationController _iconAnimationController;
  // this is the actual animation
  Animation<double> _iconAnimation;

  // this is the method used to control the animation
  @override
  void initState() {
    super.initState();
    // this creates the animation controller
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    // this creates the animation with parent as the animation controller and curve as the animation you want to perform
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    // this activates the animation
    _iconAnimation.addListener(() {
      this.setState(() {});
    });
    // this starts the animation
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // this is used when we want to put one widget over the other
      body: Stack(
        // this stretches the widget over the screen
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                // this is how we use animation in the widget
                size: _iconAnimation.value * 100,
              ),
              Form(
                // theme is used for styling the widget
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email...",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password...",
                          ),
                          keyboardType: TextInputType.text,
                          // this hides the input entered
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        MaterialButton(
                          height: 50.0,
                          minWidth: 90.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {},
                          // this is called when we click on the button
                          splashColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
