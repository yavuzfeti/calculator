import 'package:calculator/Components/Message.dart';
import 'package:calculator/Components/Themes.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String process = "0";
  double end = 0;

  bool isOperator(String s) => s == "+" || s == "-" || s == "*" || s == "/" || s == ",";

  bool canAppend(String process, String v) => !(v == "," && (process.endsWith(",") || process.contains(","))) && !(isOperator(process[process.length - 1]) && isOperator(v));

  void write(String v)
  {
    if(canAppend(process,v))
    {
      setState(() {
      if(process!="0")
      {
        process+=v;
      }
      else{
        process=v;
      }
    });
    }
    calculate(process);
  }
  
  void delete()
  {
    setState(() {
      if(process.length>1)
      {
        process=process.substring(0,process.length-1);
      }
      else
      {
        reset();
      }
    });
  }

  void reset()
  {
    setState(() {
      process = "0";
      end = 0;
    });
  }

  void calculate(String p) {
    if(!(p.endsWith("+")||p.endsWith("-")||p.endsWith("*")||p.endsWith("/")))
    {
      try {
        setState(() {
          end = Parser().parse(p.replaceAll(',', '.')).evaluate(EvaluationType.REAL, ContextModel());
        });
      } catch (e) {
        messageShow("Hata oluştu", color: Themes.fail);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    Container btn(String v, VoidCallback? f) =>
        Container(
          margin: const EdgeInsets.all(10),
          width: Themes.width/5,
          height: (Themes.width/5)+25,
          child: OutlinedButton(
            onPressed: f,
            child: Text(v,style: const TextStyle(color: Themes.light,fontSize: 40),),
          ),
        );

    Column col(List<Widget> b) =>
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: b,
        );


    String format (double v) {
      if (v == v.toInt()) {
        return v.toInt().toString();
      } else {
        return v.toStringAsFixed(1);
      }
    }

    return Scaffold(
      backgroundColor: Themes.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: Themes.height/4,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: SingleChildScrollView(child: Text(process,style: const TextStyle(color: Themes.light,fontWeight: FontWeight.bold,fontSize: 50),textAlign: TextAlign.end,))),
                  Expanded(child: SingleChildScrollView(child:Text(format(end),style: const TextStyle(color: Themes.color,fontSize: 40),textAlign: TextAlign.end,))),
                ],
              )),
          SizedBox(
            width: double.infinity,
            height: Themes.height/4*3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                col(
                  [
                    btn(">",delete),
                    btn("7",(){write("7");}),
                    btn("4",(){write("4");}),
                    btn("1",(){write("1");}),
                    btn("0",(){write("0");}),
                  ]
                ),
                col(
                  [
                    btn("C",reset),
                    btn("8",(){write("8");}),
                    btn("5",(){write("5");}),
                    btn("2",(){write("2");}),
                    btn(",",(){write(",");}),
                  ]
                ),
                col(
                  [
                    btn("",null),
                    btn("9",(){write("9");}),
                    btn("6",(){write("6");}),
                    btn("3",(){write("3");}),
                    btn("",null),
                  ]
                ),
                col(
                    [
                      btn("/",(){write("/");}),
                      btn("*",(){write("*");}),
                      btn("-",(){write("-");}),
                      btn("+",(){write("+");}),
                      btn("=",(){
                        calculate(process);
                        process = end.toString();
                      }),
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
