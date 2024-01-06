import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();

  var result="";

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI",style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700
              ),),

              SizedBox(height: 21,),

              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Entert Your Weight (in kgs)'),
                  prefixIcon:Icon(Icons.line_weight,color: Colors.black)
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 11,),

              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text('Entert Your Height (in feet)'),
                    prefixIcon:Icon(Icons.height_sharp,color: Colors.black)
                ),
                keyboardType: TextInputType.number,
              ),
            SizedBox(height: 11,),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                    label: Text('Entert Your Height (in inches)'),
                    prefixIcon:Icon(Icons.height_sharp,color: Colors.black,)
                ),
                keyboardType: TextInputType.number,
              ),
            SizedBox(height: 16,),

              ElevatedButton(onPressed: (){

                var wt=wtController.text.toString();
                var ft=ftController.text.toString();
                var inches=inController.text.toString();

                if(wt!="" && ft!="" && inches!=""){

                  //BMI calc
                  var iWt=int.parse(wt);
                  var iFt=int.parse(ft);
                  var iInches=int.parse(inches);
                    //conversion
                  var tInch=(iFt*12)+iInches;
                  var  tCm=tInch*2.54;
                  var tM=tCm/100;
                  var bmi=iWt/(tM*tM);
                  var msg="";
                  if(bmi>25){
                    msg="you are overweight!!";
                  }else if(bmi<18){
                    msg="you are underweight!!";
                  }else{
                    msg="you are healthy!!";

                  }
                  setState(() {
                    result="$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                  });


                  
                }else {
                  setState(() {
                    result="Please fill all the required blanks";
                  });
                }

              }, child: Text('Calculate')),

              SizedBox(height: 11),

              Text(result, style: TextStyle(fontSize: 19),
                ),
            ],
          ),
        ),
      )
    );
  }
}
