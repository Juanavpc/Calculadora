import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora>{
  dynamic displaytxt = 20;
  Widget calcbotones(String btntxt, Color btncolor, Color txtcolor){
    return Container(
      child: RaisedButton(
        onPressed: (){
          //TODO añadir funcionalidad para los  botones al presionar
          calcular(btntxt);
        },
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //display calculadora
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                  child: Text('$text',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white,
                    fontSize: 100,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //botones de calculadora funciona cuando pase algun argumento
                calcbotones('AC', Colors.grey, Colors.black),
                calcbotones('+/-', Colors.grey, Colors.black),
                calcbotones('%', Colors.grey, Colors.black),
                calcbotones('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //botones de calculadora funciona cuando pase algun argumento
                calcbotones('7', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('8', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('9', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('X', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //botones de calculadora funciona cuando pase algun argumento
                calcbotones('4', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('5', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('6', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //botones de calculadora funciona cuando pase algun argumento
                calcbotones('1', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('2', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('3', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            //La ultima fila es diferente
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calcular('0');
                  },
                  shape: StadiumBorder(),
                  child: Text('0',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  color: Color.fromARGB(255, 93, 93, 93),
                ),
                calcbotones('.', Color.fromARGB(255, 94, 93, 93), Colors.white),
                calcbotones('=', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
  //logica de la calculadora
  dynamic text = '0';
  double num1 = 0;
  double num2 = 0;
  dynamic result = '';
  dynamic resultfinal = '';
  dynamic operacion = '';
  dynamic preOper = '';

  void calcular(btnText){
    if (btnText == 'AC'){
      text = '0';
      num1 = 0;
      num2 = 0;
      result = '';
      resultfinal = '0';
      operacion = '';
      preOper = '';
    }else if(operacion == '=' && btnText == '='){
      if (preOper == '+'){
        resultfinal = add();
      }else if(preOper == '-'){
        resultfinal = sub();
      }else if(preOper == 'X'){
        resultfinal = mul();
      }else if(preOper == '/'){
        resultfinal = div();
      }
    }else if(btnText == '+' || btnText == '-' || btnText == 'X' || btnText == '/' || btnText == '='){
      if (num1 == 0){
        num1 = double.parse(result);
      }else{
        num2 = double.parse(result);
      }

      if (operacion == '+'){
        resultfinal = add();
      }else if(operacion == '-'){
        resultfinal = sub();
      }else if(operacion == 'X'){
        resultfinal = mul();
      }else if(operacion == '/'){
        resultfinal = div();
      }
      preOper = operacion;
      operacion = btnText;
      result = '';
    }
    else if(btnText == '%'){
      result = num1 / 100;
      resultfinal = doesContainDecimal(result);
    }else if (btnText == '.'){
      if(!result.toString().contains('.')){
        result = result.toString()+'.';
      }
      resultfinal = result;
    }
    else if(btnText == '+/-'){
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      resultfinal = result;
    }
    else{
      result = result + btnText;
      resultfinal = result;
    }

    setState(() {
      text = resultfinal;
    });
  }
  String add(){
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String sub(){
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul(){
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String div(){
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }
  String doesContainDecimal(dynamic result){
    if(result.toString().contains('.')){
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}