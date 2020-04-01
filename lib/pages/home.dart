import 'package:challenge/model/challegeType.dart';
import 'package:challenge/values/challengeTypes.dart';
import 'package:challenge/values/strings.dart';
import 'package:flutter/cupertino.dart';
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
        SingleChildScrollView(
          child: Container(
            child: _buildPanel(),
          ),
        ),
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

  Widget _buildPanel() {
    List<Item> _data = generateItems(2);
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            print(isExpanded);
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Single $index',
      expandedValue: 'This is item number $index',
    );
  });
}
