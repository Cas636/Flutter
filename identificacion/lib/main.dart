import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Identificación",
      theme: ThemeData(
        fontFamily: 'ELEGANT TYPEWRITER',
        primarySwatch: Colors.deepPurple , 
      ),
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('PASAPORTE'), 
          centerTitle: true,
        ),
        body: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[ 
            Expanded(
              child: Container(
              child: Image.asset('assets/img1.jpg', ), 
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 67, 32, 70),
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(1)
        ),
        ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child:  Text('PEPITO PEREZ', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),), ),
                  Expanded(child: Text('NAME'),),
                  Expanded(child: Text('COLOMBIANA', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),),
                  Expanded(child: Text('NATIONALITY'),),
                  Expanded(child: Text('13 DE ABRIL', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),),
                  Expanded(child: Text('DATE OF ISSUE'),),
                  Expanded(child: Text('COLOMBIA', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),),
                  Expanded(child: Text('AUTHORITY'),),

                ],
              )
              ),
                     
            ],
        ),
      ),
    );
  }
}