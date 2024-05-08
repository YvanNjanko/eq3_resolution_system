import 'package:flutter/material.dart';
import 'equation_solver.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubic Equation Solver in R',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  TextEditingController _controllerC = TextEditingController();
  TextEditingController _controllerD = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubic Equation Solver in R'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient a'),
            ),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient b'),
            ),
            TextField(
              controller: _controllerC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient c'),
            ),
            TextField(
              controller: _controllerD,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient d'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double a = double.tryParse(_controllerA.text) ?? 0;
                double b = double.tryParse(_controllerB.text) ?? 0;
                double c = double.tryParse(_controllerC.text) ?? 0;
                double d = double.tryParse(_controllerD.text) ?? 0;

                if (a == 0 && b == 0 && c == 0 && d == 0) {
                  setState(() {
                    _result = 'Tout les coefficient ne peuvent etre nul';
                  });
                } else if (a == 0) {
                  setState(() {
                    _result = 'le coefficient a ne peut etre nul';
                  });
                } else {
                  List<double> solutions =
                      EquationSolver.solveCubic(a, b, c, d);
                  setState(() {
                    _result = 'Solutions: $solutions';
                  });
                }
              },
              child: Text('Resoudre'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
