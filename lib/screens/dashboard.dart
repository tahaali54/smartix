import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartix/models/routine.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _DashboardList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _DashboardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;

    var devices = context.watch<DashboardModel>();

    return ListView.builder(
      itemCount: devices.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            devices.remove(devices.items[index]);
          },
        ),
        title: Text(
          devices.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/catalog');
          },
          style: TextButton.styleFrom(primary: Colors.black),
          child: const Text('ADD DEVICES'),
        ),
      ),
    );
  }
}
