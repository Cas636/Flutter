import 'package:flutter/material.dart';
import 'form.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {

   void _navigateToform(BuildContext context) {
    navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => form()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Identificación",
      theme: ThemeData(
        fontFamily: 'ELEGANT TYPEWRITER',
        primarySwatch: Colors.deepPurple , 
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PASAPORTE'), 
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
          
          //
          children: [
            
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/img1.jpg'),
              
            ),
            
            const SizedBox(
              child: Column(
              children: [
                Text('PEPITO PEREZ', 
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                Text('NAME'),
                Text('COLOMBIANA', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text('NATIONALITY'),
                Text('13 DE ABRIL', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text('DATE OF ISSUE'),
                Text('COLOMBIA', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text('AUTHORITY'),
              ],
              ),
            ),
            
          ],
          
        ),
        Container(
              alignment: Alignment.center,
              child: ElevatedButton(
              onPressed: () {
                _navigateToform(context);
              },
              child: const Text('Ir a la segunda pantalla'),
          ),
            )
          ],
      ),
      ),
    );
  }
}