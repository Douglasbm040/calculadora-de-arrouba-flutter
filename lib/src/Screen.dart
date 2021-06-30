import 'package:flutter/material.dart';
//import '../widget/calculadora.dart';
//import '../models/calcular.dart';
import 'package:auto_size_text/auto_size_text.dart'; //*MODIFICAR AUTOMATICAMENTE O TAMANHO DA FONTE

class Screen extends StatefulWidget {
//?CONSTRUTOR DE ESTADO
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  //! NÃO USADA DESECREVE CORES DE FOMAR HEXCOLOR
  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

//* METODO BUILD ONDE EMPILHA OS WIDGET SENDO O PRIMEIRO O WIDGET DE BAIXO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: _display(),
          ),
          Align(
            alignment: Alignment(0, -0.65),
            child: _text(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _content(),
          ),
          Align(
            alignment: Alignment(-1, -0.65),
            //child: ,
          ),
          Align(
            alignment: Alignment(0, 0.9),
            //child:_raisedButton(),
          ),
        ],
      ),
    );
  }

  num valor_final = 0;
//* TEXTO DO DISPLAY
  Widget _text() {
    return Container(
      width: 400,
      height: 90,
      //color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AutoSizeText(
            calculadora(),
            minFontSize: 20,
            maxFontSize: 35,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              decoration: TextDecoration.none,
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),

      decoration: BoxDecoration(
        color: Colors.deepPurple, //_getColorFromHex('#f8f8f2') ,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }

//*display da calculadora
  Widget _display() {
    return Container(
      color: Colors.deepPurple, //_getColorFromHex('#44475A'),
      height: 400,
    );
  }

//* KEYBOARD DA CALCULADORA CORPO DA CALCULADORA
  Widget _content() {
    return Container(
      height: 630,
      child: _listeview(),
      decoration: BoxDecoration(
        color: _getColorFromHex('#f8f8f2'),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

//! WIDGET NÃO USADO
  Widget _action() {
    return Container(
        width: 200,
        height: 45,
        margin: EdgeInsets.only(bottom: 40),
        child: _listeview());
  }

//*ESTE WIDGET É O BOTAO DE LIMPEZA
  Widget _buttondelimpar() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360.0),
          side: BorderSide(color: Colors.deepPurple)),
      color: Colors.deepPurple,
      onPressed: () {
        valor_final = 1;
        setState(() {
          limpeza();
        });
      },
      child: Icon(
        Icons.clear_all_sharp,
        color: Colors.white,
      ),
    );
    //);
  }

  bool _numberInputIsValid = true;
  //* VARIAVEIS FIXAS PARA MANIPULAR OS VALORES RECEBIDOS NOS EDITORES DE TEXTO
  final arrouba = TextEditingController();
  final preco = TextEditingController();
  final tara = TextEditingController();
  final desconto = TextEditingController();
  final text = TextEditingController();
  @override
  void dispose() {
    arrouba.dispose();
    tara.dispose();
    preco.dispose();
    desconto.dispose();
    text.dispose();
    super.dispose();
  }

  //*SÃO WIDGET DE EDITOR DE TEXTO
  Widget _buildNumberTextField_PESO() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.display1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
          //: Icon(Icons.attach_money),
          labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),

          labelText: 'Peso em kg ',
          suffixText: "Kg  ",
          suffixStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),
          errorText: _numberInputIsValid ? null : 'confira os valores ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        //onSubmitted: (val) =>
        //Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
        //onChanged: ,
        controller: arrouba,
      ),
    );
  }

  Widget _buildNumberTextField_PRECO() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.display1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
          //icon: Icon(Icons.attach_money),
          labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),

          labelText: "Preço da arrouba ",
          suffixText: "@/\$  ",
          suffixStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),
          errorText: _numberInputIsValid ? null : 'confira os valores ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        //onSubmitted: (val) =>
        //Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
        //onChanged: preco,
        controller: preco,
      ),
    );
  }

  Widget _buildNumberTextField_tara() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.display1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
          //icon: Icon(Icons.attach_money),
          labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),

          labelText: "Tara",
          suffixText: "\Kg  ",
          suffixStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),
          errorText: _numberInputIsValid ? null : 'confira os valores ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        //onSubmitted: (val) =>
        //Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
        controller: tara,
      ),
    );
  }

  //! WIDGET NAO USADO EDITOR DE TEXTO
  Widget _buildNumberTextField_valor() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.display1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
          //icon: Icon(Icons.attach_money),
          labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),

          labelText: "valor final",
          suffixText: "R\$  ",
          suffixStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),
          errorText: _numberInputIsValid ? null : 'confira os valores ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        //onSubmitted: (val) =>
        //Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
        controller: tara,
      ),
    );
  }

  Widget _buildNumberTextField_DESCONTO() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.display1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
          //icon: Icon(Icons.attach_money),
          labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),

          labelText: "Desconto",
          suffixText: "kg por arrouba  ",
          suffixStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.deepPurple),
          errorText: _numberInputIsValid ? null : 'confira os valores ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        controller: desconto,
        //onSubmitted: (val) =>
        //Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
        /*onChanged: (String rendimento) {
          final v = int.tryParse(rendimento);
          debugPrint('parsed value = $v');
          if (v == arrouba) {
            setState(() => _numberInputIsValid = false);
          } else {
            setState(() => _numberInputIsValid = true);
          }
        },*/
      ),
    );
  }

  //final _controller = TextEditingController();
//*ESTÁ FUNÇÃO REALIZA A LIMPEZADO EDITOR DE TEXTO
  limpeza() {
    valor_final = 0;
    arrouba.clear();
    preco.clear();
    tara.clear();
    desconto.clear();
  }

//*ESTA FUNÇÃO DESCREVE A LOGICA DA CALCULADORA NELA ESTA A MATEMATICA
  String calculadora() {
    switch (valor_final) {
      case 0:
        return "$valor_final Reais";
        break;
      case 1: //! desenvolver a logica matematica da calculadora
        double peso = double.tryParse(arrouba.text);
        double valor = double.tryParse(preco.text);
        double taxa = double.tryParse(tara.text);
        double desconta = double.tryParse(desconto.text);
        num x = ((peso / 2 - taxa) - desconta * (peso / 2 - taxa) / 15) /
            15 *
            valor;

        if (x == null) {
          return "$valor_final Reais";
        } else {
          return "$x Reais";
        }
        break;
    }
  }

  //*este widget é a lista que esta dentro do conteiner principal onde esta dos butoes e os editores de texto
  Widget _listeview() {
    return ListView(
      children: <Widget>[
        /*Padding(
            padding: const EdgeInsets.only(bottom:0.0,left:0,right:0,top:0,),
            child: ListTile(title: Text('calculadora de arrouba',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w200,
						color: Colors.deepPurple
					),)),
          ),*/
        Padding(
          padding: const EdgeInsets.only(
            bottom: 0,
            left: 5.0,
            right: 0,
            top: 0,
          ),
          child: Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.bottomLeft,
              child: _buttondelimpar()),
        ),
        /*Padding(
            padding: const EdgeInsets.only(bottom:0.0,left:0,right:0,top:0,),
            child: ListTile(title: Text('calculadora de arrouba',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w200,
						color: Colors.deepPurple
					),)),
          ),*/

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildNumberTextField_PESO(),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildNumberTextField_PRECO(),
        ),
        //ListTile(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildNumberTextField_tara(),
        ),
        //ListTile(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildNumberTextField_DESCONTO(),
        ),
        /* Padding(
            padding: const EdgeInsets.all(10.0),
            child: _buildNumberTextField_Meio_Por_Meio(),
          ),*/

        //ListTile(),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: _raisedButton(),
        ),
      ],
    );
  }

  SizedBox _raisedButton() {
    return SizedBox(
      width: 200.0,
      height: 55.0,
      child: RaisedButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.deepPurple)),
        onPressed: () {
          valor_final = 1;
          setState(() {
            calculadora();
          });
        },
        child: Text(
          'CALCULAR',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
