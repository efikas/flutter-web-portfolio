import 'package:flutter_web/material.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/ui/common/body.dart';
import 'package:portfolio/ui/common/footer.dart';
import 'package:portfolio/ui/common/header.dart';
import 'package:portfolio/ui/common/responsive_widget.dart';
import 'package:portfolio/ui/screens/project_list.dart';
import 'dart:html' as html;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: AppColors.redAccent,
            )
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context) ? _drawer() : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            html.window.open("mailto:your_email_here", "Abdelouahed"),
        child: Icon(Icons.sms),
        backgroundColor: AppColors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: ListView(
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Header(), Body(), Footer()]),
        ],
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[AppColors.redAccent, Colors.red[400]],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    shape: BoxShape.circle),
                child: Text('AM',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "HOME",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(ProjectList.id),
              title: Text(
                "PROJECTS",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "CONTACT",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
