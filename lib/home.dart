import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tex = "";
  var result = "";
  clr() {
    setState(() {
      result = "";
    });
  }

  Widget btn(var tex) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.266,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + tex;
          });
        },
        child: Text(tex),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black12),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget btn2(var tex) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.20,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                result = result + tex;
              });
            },
            child: Text(
              tex,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black54),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            )));
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
          ),
          Positioned(
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.80,
                    color: Colors.white10,
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      result,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: MediaQuery.of(context).size.width * 0.0,
            child: Column(
              children: [btn("7"), btn("4"), btn("1"), btn(".")],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: MediaQuery.of(context).size.width * 0.265,
            child: Column(
              children: [btn("8"), btn("5"), btn("2"), btn("0")],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            left: MediaQuery.of(context).size.width * 0.53,
            child: Column(
              children: [
                btn("9"),
                btn("6"),
                btn("3"),
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.266,
                  child: ElevatedButton(
                      onPressed: output,
                      child: Text("="),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: ElevatedButton(
                    onPressed: clr,
                    child: Text("CLR"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                ),
                btn2("/"),
                btn2("*"),
                btn2("-"),
                btn2("+")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
