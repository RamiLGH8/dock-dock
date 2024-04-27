import 'package:app/features/AddTrip/data/repositories/TripServices.dart';
import 'package:app/features/Dashboard/data/models/fetched_trip_model.dart';
import 'package:app/features/Dashboard/presenation/components/dock_component.dart';
import 'package:app/features/Dashboard/presenation/components/ship_component.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool showManageShipsOptions = false;
  bool showManageTripsOptions = false;
  List<FetchedTrip> trips = [];
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      final token = value.getString('token');
      TripServices.getTrips(token!).then((value) {
        setState(() {
          trips = value;
          print(trips.toString());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Dashboard'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Manage Ships'),
                      onTap: () {
                        setState(() {
                          showManageShipsOptions = !showManageShipsOptions;
                        });
                      },
                    ),
                    // Options under Manage Ships
                    if (showManageShipsOptions)
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.add),
                              title: const Text('Add Ship'),
                              onTap: () {
                                // Handle adding a ship
                                Navigator.pushNamed(context, '/add_ship');
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit Ship'),
                              onTap: () {
                                // Handle editing a ship
                              },
                            ),
                          ],
                        ),
                      ),
                    ListTile(
                      leading: const Icon(Icons.trip_origin),
                      title: const Text('Manage Trips'),
                      onTap: () {
                        setState(() {
                          showManageTripsOptions = !showManageTripsOptions;
                        });
                      },
                    ),
                    if (showManageTripsOptions)
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.add),
                              title: const Text('Add Trip'),
                              onTap: () {
                                Navigator.pushNamed(context, 'add_trip');

                                // Handle adding a ship
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit Trip'),
                              onTap: () {
                                // Handle editing a ship
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Add your settings page navigation here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dock Status'),
              TextButton(onPressed: () {}, child: const Text('see all'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DockComponent('Free', 5),
              DockComponent('Occupied', 15),
              DockComponent('Out of Service', 5),
            ],
          ),
          const Text('Todays Trips'),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShipComponent(
                        const Icon(Icons.add),
                        trips[index].toJson()['ship']['name'],
                        DateTime.parse(trips[index].toJson()['arrivalDate'])
                                .hour
                                .toString() +
                            ':' +
                            DateTime.parse(trips[index].toJson()['arrivalDate'])
                                .minute
                                .toString(),
                               

                        'day'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
