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
      theme: ThemeData.dark().copyWith(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Loading button',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isReady ? Colors.green : Colors.red,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () async {
                  //exit the function if clicked while loading
                  if (isLoading) return;

                  setState(() {
                    isLoading = true;
                  });

                  await Future.delayed(const Duration(seconds: 3));

                  setState(() {
                    isLoading = false;
                    isReady = !isReady;
                  });
                },
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Please wait...',
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      )
                    : isReady
                        ? const Text(
                            'You are ready!',
                            style: TextStyle(fontSize: 22),
                          )
                        : const Text(
                            'You are not ready',
                            style: TextStyle(fontSize: 22),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
