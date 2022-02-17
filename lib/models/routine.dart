import 'package:flutter/foundation.dart';

import 'devices.dart';

class DashboardModel extends ChangeNotifier {
  late DevicesModel _catalog;

  final List<int> _itemIds = [];

  DevicesModel get catalog => _catalog;

  set catalog(DevicesModel newCatalog) {
    _catalog = newCatalog;

    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);

    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);

    notifyListeners();
  }
}
