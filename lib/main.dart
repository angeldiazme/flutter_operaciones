import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Simple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
//  String _resultado = '';

  void _calcular(String operacion) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    double resultado = 0;

    switch (operacion) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '*':
        resultado = num1 * num2;
        break;
      case '/':
        resultado = num2 != 0 ? num1 / num2 : 0;  // Evitar división por 0
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPantalla(
          resultado: resultado.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Calculadora'),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,//.stretch  Para que los botones ocupen todo el ancho
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(labelText: 'Número 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(labelText: 'Número 2'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
           /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [*/
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: Text('SUMAR'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: Text('RESTAR'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: Text('MULTIPLICAR'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: Text('DIVIDIR'),
                ),
              //],
           // ),
         ],
        ),
     ),
    );
  }
}

class ResultadoPantalla extends StatelessWidget {
  final String resultado;

  ResultadoPantalla({required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   /*   appBar: AppBar(
        title: Text('Resultado'),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'El resultado es:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                 // Volver a la pantalla principal
              },
              child: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}

