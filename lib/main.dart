import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        fontFamily: "Fredoka",
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

var _selectedFood='MEAT';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: ListView(
        
        children: <Widget>[
          Stack(
            children: <Widget>[
              
              //Image.network('https://images.unsplash.com/photo-1503899036084-c55cdd92da26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
              ShaderMask(shaderCallback: (rect){
                return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.black,Colors.transparent]
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: 
                    Image.asset("japan.jpg",height: MediaQuery.of(context).size.height* 0.4,width: MediaQuery.of(context).size.width,
                    fit:BoxFit.cover
                    ),
              ),
              Positioned(
                left: 10,
                child: RotatedBox(quarterTurns: 3,
                  child: Text('JAPAN',style: TextStyle(fontSize: 85,color: Colors.white.withOpacity(0.15),fontFamily: "Raleway",fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ),
              Positioned(
                top:  MediaQuery.of(context).size.height* 0.4-100,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("WELCOME TO",
                        style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Fredoka",fontWeight: FontWeight.w400)),

                  Row(children: <Widget>[
                    Text("TOKYO ",style: TextStyle(fontSize: 50,color: Color.fromRGBO(161, 0, 49, 1),fontFamily: 'Fredoka' ),),
                    Text("JAPAN",style: TextStyle(fontSize: 50,color: Colors.white ,fontFamily: 'Fredoka'),),

                  ],)
                ],
              ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Icon(Icons.menu),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(161, 0, 49, 1),
                    borderRadius: BorderRadius.circular(3)
                  ),
                ),
              ),
            ]),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    hintText: 'Tap to search...',
                    hintStyle: TextStyle(color: Colors.white.withAlpha(50))
                  ),
                  style: TextStyle(color: Colors.white),
                  
                ),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buttonBuilder("SATISFIED", Icons.sentiment_satisfied),
                  _buttonBuilder("TEA", Icons.local_cafe),
                  _buttonBuilder("RESTAURANT", Icons.local_pizza),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buttonBuilder("CAR WASH", Icons.local_car_wash),
                  _buttonBuilder("FLORIST", Icons.local_florist),
                  _buttonBuilder("AIRPORT", Icons.local_airport),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buttonBuilder("GAS STATION", Icons.local_gas_station),
                  _buttonBuilder("HOSPITAL", Icons.local_hospital),
                  _buttonBuilder("PHARMACY", Icons.local_pharmacy),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buttonBuilder("BANK", Icons.local_atm),
                  _buttonBuilder("SUPERMAKET", Icons.local_grocery_store),
                  _buttonBuilder("LIBRARY", Icons.local_library),
                  
                ],
              )
        ],
      ),
    );
    
  }
  Widget _buttonBuilder(foodName,foodIcon){
    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){
        setState(() {
          _selectedFood=foodName;
        });
      },
      child: AnimatedContainer(
      
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
        height: (_selectedFood==foodName)? MediaQuery.of(context).size.height*0.5/3: MediaQuery.of(context).size.height*0.5/3*0.75,
        width: (_selectedFood==foodName)? MediaQuery.of(context).size.width/3:MediaQuery.of(context).size.width/3*0.75,
        color: (_selectedFood==foodName)? Color.fromRGBO(161, 0, 49, 1):Colors.transparent,

        child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Icon(foodIcon,color: Colors.white,),
              SizedBox(height: 7,),
              Text(foodName,style: TextStyle(color:Colors.white.withOpacity(0.7)),)
            ],
        ),
      ),
    );
  }

}
