import 'package:flutter/material.dart';
import 'package:zed/data/data_providers/firestore_service/username_exist.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            onPressed: () {
              FireStoreService.userIdExist();
            },
            icon: const Icon(Icons.local_activity)));
  }
}
