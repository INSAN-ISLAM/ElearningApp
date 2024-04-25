import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quiz_app/constants.dart';
// import 'package:quiz_app/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../controllers/question_controller.dart';
import '../welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length }",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              ElevatedButton(onPressed: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomeScreen()));

              }, child: Text('Restar')),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
