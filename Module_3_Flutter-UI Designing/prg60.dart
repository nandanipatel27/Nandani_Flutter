import 'package:flutter/material.dart';

class Prg60 extends StatefulWidget {
  const Prg60({super.key});

  @override
  State<Prg60> createState() => _Prg60State();
}

class _Prg60State extends State<Prg60> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Restaurant",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text('20-30min'),
                  SizedBox(width: 8),
                  Text('2.4km'),
                  SizedBox(width: 8),
                  Text('Restaurant'),
                ],
              ),
              SizedBox(height: 8),
              Text('Orange Sandwiches is delicious'),
              SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('4.7'),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryUI(txt: "Recommend", value: 0),
                    categoryUI(txt: "Popular", value: 1),
                    categoryUI(txt: "Noodles", value: 2),
                    categoryUI(txt: "Sandwich", value: 3),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                children: [
                  _buildFoodItem(name:'Soba Soup', description: 'No.1 in sales', price: 12,img:'assets/images/soup.png'),
                  _buildFoodItem(name: 'Sei Ua Samun Phrai', description: 'No.1 in sales',price:  12,img: 'assets/images/soup.png'),
                  _buildFoodItem(name: 'Ratatouille Pasta',description:  'No.1 in sales', price: 12,img: 'assets/images/pasta.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  categoryUI({required String txt, required int value}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: selectedCategory == value ? Colors.amber : Colors.grey,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          txt,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

_buildFoodItem({required String name, required String description, required double price, required String img}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: Container(
         width: 100,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          //color: Colors.grey[200],
          image:  DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(name),
      subtitle: Text(description),
      trailing: Text('\$$price'),
    ),
  );
}
