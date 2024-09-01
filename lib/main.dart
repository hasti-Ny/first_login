import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ButtonStyle(
        //   elevation: MaterialStatePropertyAll(0),
        //   shape: MaterialStatePropertyAll(
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        //   backgroundColor: MaterialStatePropertyAll(Color(0xff04D2FF)),
        // )),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            headlineLarge: TextStyle(
              color: Colors.white,
              fontSize: 55,
              fontWeight: FontWeight.w700,
            ),
            headlineSmall: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff026D8E),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/img/logo.png',
                    height: 230,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: themeData.textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 42,
                        child: TextField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color(0xff505050),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              labelText: 'example@email.com',
                              prefixIcon: _Prefix(
                                imagepath: 'assets/img/email.png',
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 42,
                        child: TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color(0xff505050),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              labelText: 'password',
                              prefixIcon: _Prefix(
                                imagepath: 'assets/img/lock.png',
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          _Shadow(),
                          _Button(
                            themeData: themeData,
                            title: 'Log in',
                            style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff04D2FF)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Forgot Password?',
                        style: themeData.textTheme.bodyLarge!
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 1.5,
                        width: 148,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'or',
                        style: themeData.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        color: Colors.black,
                        height: 1.5,
                        width: 148,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: Stack(
                    children: [
                      _Shadow(),
                      _Button(
                        themeData: themeData,
                        title: 'Sign Up',
                        style: ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0xff039DC1), width: 3),
                                  borderRadius: BorderRadius.circular(4))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff026D8E)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    super.key,
    required this.themeData,
    required this.title,
    required this.style,
  });

  final ThemeData themeData;
  final String title;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: themeData.textTheme.headlineSmall,
            ),
            SizedBox(
              width: 6,
            ),
            Image.asset(
              'assets/img/next.png',
              width: 20,
              height: 20,
            )
          ],
        ));
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 2,
      child: Container(
        width: 310,
        height: 20,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 4,
          )
        ]),
      ),
    );
  }
}

class _Prefix extends StatelessWidget {
  const _Prefix({
    super.key,
    required this.imagepath,
  });
  final String imagepath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffDCDADA),
            ),
            width: 42,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              imagepath,
              width: 22,
              height: 22,
            ),
          )
        ],
      ),
    );
  }
}
