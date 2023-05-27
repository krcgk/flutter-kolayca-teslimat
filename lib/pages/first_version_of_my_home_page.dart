import 'package:flutter/material.dart';

class FirstVersionOfMyHomePage extends StatelessWidget {
  const FirstVersionOfMyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Home Page')),
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildSampleTextWidget(),
            buildMyFirstButton(),
            buildSampleImage(),
            buildCheckbox(),
            buildTextField(),
          ],
        ),
      ),
    );
  }

  Widget buildSampleTextWidget() {
    return Container(
      width: 100,
      child: Text(
        'lorem ipsum dolor sit amet',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 48,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildMyFirstButton() {
    return Container(
      width: 100,
      child: IconButton(
        icon: Icon(Icons.person),
        color: Colors.blue,
        onPressed: () {
          print('My First Button Pressed');
        },
      ),
    );
  }

  Widget buildSampleImage() {
    return Container(
      width: 100,
      child: Image.network(
        'https://picsum.photos/250?image=9',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCheckbox() {
    return Container(
      width: 1000,
      child: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
    );
  }

  Widget buildTextField() {
    return Container(
        width: 100,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Adinizi Giriniz',
          ),
        ));
  }
}
