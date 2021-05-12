import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<MyApp>{
  double _percent=0.0;
  double _billAmount=0.0;
  //final _total = calculateTotal(_billAmount, _percent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electricity Bill Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Your Electricity Bill",
                    style: TextStyle(color: Colors.cyan,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  Text("${calculateTotal(_billAmount, _percent)}",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                    ),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(children: [
                // Icon(Icons.home,
                // size: 23,),

                // Text(" Base Price",
                //   style: TextStyle(color: Colors.redAccent),
                // ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      prefixText: " Base Price",
                      prefixStyle: TextStyle(color: Colors.red.shade500)
                  ),
                  //controller: _total,
                  onChanged: (String value){
                    try{
                      _billAmount=double.parse(value);
                      //calculateTotal(_billAmount, _percent);
                    }
                    catch(exception){
                      _billAmount=0.0;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Percent"),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              if(_percent>0.2){
                                _percent-=0.2;
                              }
                              else{
                                //do nothing
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.cyan.shade200
                            ),
                            child: Center(
                              child: Text("-",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                            ),
                          ),
                        ),
                        Text("${_percent.toStringAsFixed(1)}",
                          style: TextStyle(
                            color: Colors.blueGrey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _percent+=0.2;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.cyan.shade200
                            ),
                            child: Center(
                              child: Text("+",
                                style: TextStyle(
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Slider(value: _percent,
                    min: 0.0,
                    max: 100.0,
                    divisions: 500,
                    inactiveColor: Colors.grey,
                    label: _percent.toStringAsFixed(1),
                    onChanged: (double value){
                      setState(() {
                        _percent=value;
                      });
                    })
              ],),
            ),
          ],
        ),
      ),
    );

  }
  calculateTotal(double billAmount, double percentage){
    double _total=0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount== null){

    }
    else{
      _total= (billAmount * percentage)/100;
      _total+=billAmount;
    }
    return _total;
  }
}
// This widget is the root of your application.



