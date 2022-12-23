import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function(String searchTerm) onSearch;

  const SearchBox({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 8),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => onSearch(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
