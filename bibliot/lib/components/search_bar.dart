import 'package:flutter/material.dart';

class SearchBarWidget  extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget ({super.key, required this.onChanged});

  @override
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        hintText: 'Pesquisar eventos',
        onChanged: onChanged,
        leading: const Icon(Icons.search),
      ),
    );
  }
}