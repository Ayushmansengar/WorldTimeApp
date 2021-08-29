import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  late String flag;

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    flag = data['flag'];
    String bgimage = data['isDaytime']?'day.jpg':'night.jpg';
    Color? bgColor =  data['isDaytime']? Colors.deepOrangeAccent[100]: Colors.indigo[600];


    return Scaffold(
      backgroundColor: bgColor,


      body: SafeArea(
        child:
             Container(
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage('assets/$bgimage'),
                     fit: BoxFit.cover,
                 )
               ),
               child: Center(

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,

                   children: [

                     Text(
                       data['location'],
                       style: TextStyle(
                         letterSpacing: 5.0,
                         fontSize: 25.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),

                     SizedBox(height: 10.0,),

                     Image(
                         image: AssetImage('assets/$flag'),
                       width: 30.0,
                       height: 30.0,
                     ),

                     SizedBox(height: 10.0,),

                     Text(
                       data['time'],
                       style: TextStyle(
                         letterSpacing: 5.0,
                         fontSize: 50.0,

                       ),
                     ),

                     SizedBox(height: 300.0,),

                     IconButton(
                       onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'isDaytime': result['isDaytime'],
                          };
                        });
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.amber,
                          size: 40.0,
                        ),
                        ),
                   ]),
               ),
             ),
           ),
    );
  }
}
