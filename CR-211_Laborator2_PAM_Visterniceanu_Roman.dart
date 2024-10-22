import 'package:flutter/material.dart';

void main() {
  runApp(const BarberSearchApp());
}

class BarberSearchApp extends StatelessWidget {
  const BarberSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BarberSearchHomePage(),
    );
  }
}

class BarberSearchHomePage extends StatefulWidget {
  const BarberSearchHomePage({super.key});

  @override
  State<BarberSearchHomePage> createState() => _BarberSearchHomePageState();
}

class _BarberSearchHomePageState extends State<BarberSearchHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laborator2'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://crosspointe.com/wp-content/uploads/2020/09/avatar-male.jpgx'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Joe Samanta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://www.ringmybarber.com/wp-content/uploads/2022/10/qualities-of-a-highly-professional-barber.jpg',
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Booking Now'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Barber's, Haircut...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nearest Barbershop',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildBarbershopCard(
                'Alana Barbershop - Haircut & Spa',
                'Danguntapan (5 km)',
                '4.5',
                'https://www.professionalbarber.shop/wp-content/uploads/2023/08/shutterstock_608094002-1.png',
              ),
              _buildBarbershopCard(
                'Hercha Barbershop - Haircut & Styling',
                'Jalan Kaliurang (8 km)',
                '5.0',
                'https://nationaltoday.com/wp-content/uploads/2022/02/Barbers-Day-1200x834.jpg',
              ),
              _buildBarbershopCard(
                'Barberking - Haircut styling & massage',
                'Jogja Expo Centre (12 km)',
                '4.5',
                'https://cdn.shopify.com/s/files/1/0001/9211/8835/files/Happy_Barber_and_Customer_Men_s_Hairstyle_480x480.png?v=1621594670',
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('See All'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Most Recommended',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildRecommendedCard(
                'Masterpiece Barbershop - Haircut styling',

                'Jogja Expo Centre (2 km)',
                '5.0',
                'https://d2zdpiztbgorvt.cloudfront.net/region1/us/623685/biz_photo/a10399badb6642d881e0bf4f624416-finito-hair-studio-barber-hass-biz-photo-4ac9e11452434ed387d0cbe6405b41-booksy.jpeg',
              ),
              _buildBarbershopCard(
                'Varcity Barbershop Jogja ex The Varcher',
                'Condongcatur (10 km)',
                '4.5',
                'https://plus.unsplash.com/premium_photo-1661645788141-8196a45fb483?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmFyYmVyfGVufDB8fDB8fHww',
              ),
              _buildBarbershopCard(
                'Twinsky Monkey Barber & Men Stuff',
                'Jalan Taman Siswa (8 km)',
                '4.5',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyYejVF4i5qOYso1URPADzoyiWTQy24uvUjA&s',
              ),
              _buildBarbershopCard(
                'Barberman - Haircut styling & massage',
                'J-Walk Centre (17 km)',
                '4.6',
                'https://proforientator.ru/upload/img/publications/stati/barber2.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarbershopCard(
      String name, String location, String rating, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Row(
          children: [
            Text(location),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                Text(rating),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedCard(
      String name, String location, String rating, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Row(
          children: [
            Text(location),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                Text(rating),
              ],
            ),
          ],
        ),

        ),
    );
  }
}
