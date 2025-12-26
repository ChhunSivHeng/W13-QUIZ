import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import 'grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  final TextEditingController _searchController = TextEditingController();
  String searchGrocery = ''; 

  
  
//Fucntion
  void onCreate() async {
    // Navigate to the form screen using the Navigator push
    Grocery? newGrocery = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(builder: (context) => const GroceryForm()),
    );
    if (newGrocery != null) {
      setState(() {
        dummyGroceryItems.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    

    //display groceries
    Widget _buildAllGrocery(){
      //  Display groceries with an Item builder and  LIst Tile
      return ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (context, index){
        final grocery = dummyGroceryItems[index];
        return GroceryTile(grocery: grocery);
        },
      );
    }

    //search groceries
    widget _searchGrocery(){
      final filteredGroceries = dummyGroceryItems.where((grocery) {
      if (searchGrocery.isEmpty) return true;


    }
    
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Groceries'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onCreate,
            ),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.local_grocery_store),
              text: 'All',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            body: TabBarView(children: [
              _buildAllGrocery(),
            ])
          ],
          
      ) ,
      )
    );
  }
}


class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
