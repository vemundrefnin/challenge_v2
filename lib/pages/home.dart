import 'package:challenge/model/challegeType.dart';
import 'package:challenge/values/challengeTypes.dart';
import 'package:challenge/values/strings.dart';
import 'package:challenge/widgets/customExpansionPanelList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller;
  int currentpage = 0;
  List<ChallengeType> _challegeTypes = challengeTypes;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.titleApp),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, 'settings'),
              child: Icon(Icons.settings))
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: 200,
            // color: Colors.green,
            child: PageView.builder(
                itemCount: _challegeTypes.length,
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                controller: controller,
                itemBuilder: (context, index) => builder(index)),
          ),
        ),
        CustomExpansionPanelList(),
      ],
    );
  }

  builder(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        print(MediaQuery.of(context).size.width);
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: Card(
            // color: index % 2 == 0 ? Colors.blue : Colors.red,
            child: SizedBox(
              height: Curves.easeOut.transform(value) * 150,
              width: Curves.easeOut.transform(value) * 300,
              child: ListTile(
                title: Text(_challegeTypes[index].title),
                subtitle: Text(_challegeTypes[index].enabled.toString()),
              ),
            ),
          ),
        );
      },
    );
  }
}

