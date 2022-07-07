import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/location/cubit/location_cubit.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  static Route createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: const LocationPage(),
      );
    });
  }

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void didChangeDependencies() {
    context.read<LocationCubit>().removeList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: kToolbarHeight + 20,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Select Location',
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       padding: const EdgeInsets.all(10),
        //       child: Row(
        //         children: const [
        //           Icon(
        //             Icons.map_outlined,
        //             color: Colors.black,
        //           ),
        //           SizedBox(width: 10),
        //           Text(
        //             'Select on map',
        //             style: TextStyle(color: Colors.black),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(.2)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: TextField(
                        onSubmitted: (value) {
                          context.read<LocationCubit>().getPlace(value);
                        },
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search location',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (state.locations.isEmpty) {
                    return const Center(
                      child: Text('No location found'),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ]),
                        child: ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          onTap: () {
                            context.read<LocationCubit>().setLocation(
                                state.locations[index].title ?? "");
                            Navigator.pop(context);
                          },
                          title: Text(state.locations[index].title ?? ""),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
