import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //homeに最初に開くファイルを入れる
      home: JankenPage(),
    );
    
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String computerHand = '👊';
  String myHand = '👊';
  String result = '引き分け';

  //ボタンクリック時の挙動関数
  //自分の手が読み込まれる
  void selectHand(String selectedHand) {
    //myHandの値更新
    myHand = selectedHand;
    // print(selectedHand);
    //コンピューターの手を生成
    generateComputerHand();
    //勝敗判定
    judge();
    //画面の再描画
    setState(() {});
  }

  //コンピューターの手関数
  void generateComputerHand() {
    //変数に乱数を代入
    final randomNumber = Random().nextInt(3);
    //数値をジャンケンの手に変換する関数に乱数を渡し、返り値を変数に代入。
    computerHand = randomNumberToHand(randomNumber);
    print(randomNumberToHand(randomNumber));
  }

  //乱数をジャンケンの手に変換
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber){
      case 0:
        return '👊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      //caseで定義したもの以外の場合
      default:
        return '👊';
    }
  }

  void judge(){
    // if (computerHand == myHand){
    //   result = '引き分け';
    // }else if(myHand == '👊' && computerHand == '✌️'){
    //     result = '勝ち';
    //   } else if ( myHand == '✌️' && computerHand == '✋'){
    //     result = '勝ち';
    //   } else if ( myHand == '✋' && computerHand == '👊'){
    //     result = '勝ち';
    //   }
    if (computerHand == myHand){
      result = '引き分け';
    }else if(myHand == '👊' && computerHand == '✌️' || myHand == '✌️' && computerHand == '✋' || myHand == '✋' && computerHand == '👊'){
        result = '勝ち';
    }else{
      result = '負け';
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Janken'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 32
              ),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 32
              ),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32
              ),
            ),
            SizedBox(height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    selectHand('👊');                      
                  },
                  child: Text('👊'),
                ),
                ElevatedButton(
                  onPressed: (){
                    selectHand('✌️'); 
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: (){
                    selectHand('✋'); 
                  },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}