import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
  TO DO
  - Add Unique ID for Affected Individual
  - Add Media step for Photo, Video
*/

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final int stepLength = 9; // IMP! Have to Change Manually
  int currentStep = 0;
  bool formComplete = false;

  void nextStep() {
    currentStep + 1 != stepLength
        ? goToStep(currentStep + 1)
        : setState(() => formComplete = true);
  }

  void cancelStep() {
    if (currentStep == 0) {
      Navigator.pop(context);
    }
    if (currentStep > 0) {
      goToStep(currentStep - 1);
    }
  }

  void goToStep(int step) {
    setState(() => currentStep = step);
  }

  bool activeCheck(int step) {
    if (currentStep >= step) {
      return true;
    }
    return false;
  }

  stepState(int step) {
    if (currentStep >= step + 1) {
      return StepState.complete;
    }
    return StepState.indexed;
  }

  Widget formText(String placeholder) {
    return TextFormField(
      decoration: InputDecoration(labelText: placeholder),
    );
  }

  Widget formTextArea(String placeholder) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLength: 1000,
      minLines: 3,
      maxLines: 10,
      decoration: InputDecoration(labelText: placeholder),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Report'),
        ),
        body: Column(children: <Widget>[
          formComplete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: new Text("Report Submitted"),
                      content: new Text(
                        "Thank you for submitting the report!",
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text(
                            "Close",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                      // type: StepperType.horizontal,
                      currentStep: currentStep,
                      onStepContinue: nextStep,
                      onStepTapped: (step) => goToStep(step),
                      onStepCancel: cancelStep,
                      steps: <Step>[
                        // Affected (TO DO - Person ID)
                        Step(
                          title: const Text('Affected Individual'),
                          isActive: activeCheck(0),
                          state: stepState(0),
                          content: Column(
                            children: <Widget>[
                              formText('Name of Affected Person'),
                              formText('Age'),
                              formText('Gender'),
                              formText('Relationship within Family'),
                              formText('Aadhar Number'),
                              formText('Severity'), // Hi Med Lo
                              formText('GCType'), // 0 or 1 Dialog
                            ],
                          ),
                        ),
                        // CASE
                        Step(
                          isActive: activeCheck(1),
                          state: stepState(1),
                          title: const Text('Address'),
                          content: Column(
                            children: <Widget>[
                              formText('District'),
                              formText('Block'),
                              formText('GP'),
                              formText('Village'),
                              formText('Origin State'),
                              formText('Origin District'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(2),
                          state: stepState(2),
                          title: const Text('Contact'),
                          content: Column(
                            children: <Widget>[
                              formText('Affected Person\'s Phone'),
                              formText('Affected Person\'s Email'),
                              formText('Your (Volunteer)\'s Phone'),
                              formText('Your (Volunteer)\'s Email'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(3),
                          state: stepState(3),
                          title: const Text('Income'),
                          content: Column(
                            children: <Widget>[
                              formText('Affected Person\'s Job'),
                              formText('Affected Person\'s Income'),
                              formText('Family\'s Financial Status'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(4),
                          state: stepState(4),
                          title: const Text('Health'),
                          content: Column(
                            children: <Widget>[
                              formText('Fever Status'),
                              formText('Cough Status'),
                              formText('Respiratory Status'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(5),
                          state: stepState(5),
                          title: const Text('Education'),
                          content: Column(
                            children: <Widget>[
                              formText('Affected Person\'s Education'),
                              formText('Family\'s Education'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(6),
                          state: stepState(6),
                          title: const Text('Income'),
                          content: Column(
                            children: <Widget>[
                              formText('Affected Person\'s Job'),
                              formText('Affected Person\'s Income'),
                              formText('Family\'s Financial Status'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(7),
                          state: stepState(7),
                          title: const Text('Affected Family'),
                          content: Column(
                            children: <Widget>[
                              formText('Vulnerable Family Member'),
                              formText('Ages (Separated by Comma)'),
                              formText('Gender (Separated by Comma)'),
                            ],
                          ),
                        ),
                        Step(
                          isActive: activeCheck(8),
                          state: stepState(8),
                          title: const Text('Issue'),
                          content: Column(
                            children: <Widget>[
                              formTextArea('Describe the Case'),
                              formTextArea('History of the Case'),
                              formTextArea('Describe the Help Needed'),
                            ],
                          ),
                        ),
                        // TO DO - MEDIA
                      ]),
                ),
        ]
      )
    );
  }
}
