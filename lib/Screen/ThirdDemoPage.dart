import 'package:flutter/material.dart';
import 'package:mobx_demo/Screen/usersList.dart';

import 'PostsList.dart';


class ThirdDemoPage extends StatefulWidget {
  @override
  _ThirdDemoPageState createState() => _ThirdDemoPageState();
}

class _ThirdDemoPageState extends State<ThirdDemoPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MobX API Demo"),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: 'Posts',
              ),
              Tab(
                text: 'Users',
              )
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              PostsList(),
              UserList(),
            ],
          ),
        )
    );
  }
}