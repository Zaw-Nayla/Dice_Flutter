import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Let See Who is in Favor of God!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dicenumberlist = [1, 2, 3, 4, 5, 6];
  int dicenumber1 = 3;
  int dicenumber2 = 3;

  void rollDice1() {
    setState(() {
      dicenumberlist.shuffle();
      dicenumber1 = dicenumberlist[0];
    });
  }

  void rollDice2() {
    setState(() {
      dicenumberlist.shuffle();
      dicenumber2 = dicenumberlist[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(176, 0, 187, 212)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          " Player 1 :",
                          style: TextStyle(
                            fontFamily: "EduSA",
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            rollDice1();
                          },
                          child: Image(
                            image: AssetImage("images/dice$dicenumber1.png"),
                            color: const Color.fromARGB(255, 78, 58, 58),
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          " Player 2 :",
                          style: TextStyle(
                            fontFamily: "EduSA",
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            rollDice2();
                          },
                          child: Image(
                            image: AssetImage("images/dice$dicenumber2.png"),
                            color: const Color.fromARGB(255, 78, 58, 58),
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Remember! Dice rolls randomly."),
                      Text("So hit your dice only once and accept your fate.")
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (dicenumber1 > dicenumber2) {
                            var snackBar = const SnackBar(
                              duration:  Duration(milliseconds: 500),
                              content:  Text(
                                "Player 1 win!",
                                style: TextStyle(
                                    fontFamily: "EduSA",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.greenAccent),
                              )
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (dicenumber1 == dicenumber2) {
                            var snackBar =  const SnackBar(
                              duration:  Duration(milliseconds: 500),
                              content:   Text(
                                "Draw",
                                style: TextStyle(
                                  fontFamily: "EduSA",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                ),
                                
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var snackBar = const SnackBar(
                              duration:  Duration(milliseconds: 500),
                              content:  Text(
                                "Player 2 win!",
                                style: TextStyle(
                                    fontFamily: "EduSA",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.greenAccent),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text(
                          "Check who win!",
                          style: TextStyle(
                            fontFamily: "Libra",
                            fontStyle: FontStyle.italic,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
