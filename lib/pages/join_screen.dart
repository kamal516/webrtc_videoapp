import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:videowebapp/models/meeting_details.dart';

class JoinScreen extends StatefulWidget {
  // final String? meetingId;
  final MeetingDetail? meetingDetail;
  const JoinScreen({Key? key,this.meetingDetail}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
    static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String userName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join Meeting "),
        backgroundColor: Colors.orange,
      ),
      body: Form(key: globalKey, child: formUI()),
    );
  }

  formUI() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
   
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),

        FormHelper.inputFieldWidget(
          context,
          "userId",
          "Enter your Name",
          (val) {
            if (val.isEmpty) {
              return "Name can't be empty";
            }
            return null;
          },
          (onSaved) {
            userName = onSaved;
          },
          borderRadius: 10,
          borderFocusColor: Colors.redAccent,
          borderColor: Colors.redAccent,
          hintColor: Colors.grey,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(child: FormHelper.submitButton("Join Meeting", () {
              if(validateAndSave()){

}
            })),
        
          ],
        )
      ]),
    ));
  }
    bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  }
