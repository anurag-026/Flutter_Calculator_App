import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: () {
          // Add numbers
          calculation(btntxt);
        },
        style: ElevatedButton.styleFrom(
          //shape: StadiumBorder(),
          backgroundColor: btncolor,
        ),
        child: Text(
          btntxt,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtcolor,
            fontSize: 35,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calc Display
            // Row(
            //   children: [
            //     TextField()
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white54, fontSize: 50),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.backspace_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 40,
              color: Colors.white,
              indent: 8,
              endIndent: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button Function
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add numbers
                      calculation('AC');
                    },
                    style: ElevatedButton.styleFrom(
                      //shape: StadiumBorder(),
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'AC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 27,
                      ),
                    ),
                  ),
                ),
                //calcbutton('AC', Colors.grey, Colors.red),
                calcbutton('()', Colors.grey, Colors.white),
                calcbutton('%', Colors.amber[700]!, Colors.white),
                calcbutton('/', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button Function
                calcbutton('7', Colors.grey[850]!, Colors.white),
                calcbutton('8', Colors.grey[850]!, Colors.white),
                calcbutton('9', Colors.grey[850]!, Colors.white),
                calcbutton('*', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button Function
                calcbutton('4', Colors.grey[850]!, Colors.white),
                calcbutton('5', Colors.grey[850]!, Colors.white),
                calcbutton('6', Colors.grey[850]!, Colors.white),
                calcbutton('-', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button Function
                calcbutton('1', Colors.grey[850]!, Colors.white),
                calcbutton('2', Colors.grey[850]!, Colors.white),
                calcbutton('3', Colors.grey[850]!, Colors.white),
                calcbutton('+', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button Function
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add numbers
                      calculation('+/-');
                    },
                    style: ElevatedButton.styleFrom(
                      //shape: StadiumBorder(),
                      backgroundColor: Colors.grey,
                    ),
                    child: Text(
                      '+/-',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                      ),
                    ),
                  ),
                ),
                calcbutton('0', Colors.grey[850]!, Colors.white),
                calcbutton('.', Colors.grey, Colors.white),
                calcbutton('=', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],

        ),
      ),
    );
  }


//Calculator logic
dynamic text ='0';
double numOne = 0;
double numTwo = 0;

dynamic result = '';
dynamic finalResult = '';
dynamic opr = '';
dynamic preOpr = '';

void calculation(btnText) {


  if(btnText  == 'AC') {
    text ='0';
    numOne = 0;
    numTwo = 0;
    result = '';
    finalResult = '0';
    opr = '';
    preOpr = '';

  } else if( opr == '=' && btnText == '=') {

    if(preOpr == '+') {
      finalResult = add();
    } else if( preOpr == '-') {
      finalResult = sub();
    } else if( preOpr == '*') {
      finalResult = mul();
    } else if( preOpr == '/') {
      finalResult = div();
    } else if( preOpr == '%') {
      finalResult = rem();
    }

  } else if(btnText == '+' || btnText == '-' || btnText == '*' || btnText == '/' || btnText == '=' || btnText == '%') {

    if(numOne == 0) {
      numOne = double.parse(result);
    } else {
      numTwo = double.parse(result);
    }

    if(opr == '+') {
      finalResult = add();
    } else if( opr == '-') {
      finalResult = sub();
    } else if( opr == '*') {
      finalResult = mul();
    } else if( opr == '/') {
      finalResult = div();
    }else if( opr == '%') {
      finalResult = rem();
    }
    preOpr = opr;
    opr = btnText;
    result = '';
  }
  else if(btnText == '%') {
    result = numOne / 100;
    finalResult = doesContainDecimal(result);
  } else if(btnText == '.') {
    if(!result.toString().contains('.')) {
      result = '$result.';
    }
    finalResult = result;
  }

  else if(btnText == '+/-') {
    result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
    finalResult = result;

  }

  else {
    result = result + btnText;
    finalResult = result;
  }


  setState( () {
    text = finalResult;
  });

}

String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
String rem() {
  result = (numOne % numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}


String doesContainDecimal(dynamic result) {

  if(result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if(!(int.parse(splitDecimal[1]) > 0)) {
      return result = splitDecimal[0].toString();
    }
  }
  return result;
}

}
