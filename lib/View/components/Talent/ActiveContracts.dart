import 'package:flutter/material.dart';

class ActiveContracts extends StatefulWidget {
  @override
  _ActiveContractsState createState() => _ActiveContractsState();
}

class _ActiveContractsState extends State<ActiveContracts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 7.0,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 10),
              child: Text(
                "Active Contracts",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Text(
                  "Developer needed for implement a new design in WordPress website ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff57A72D),
                      fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Text("Mostafa Client",
                    style: TextStyle(
                      color: Colors.black,
                    ))),
            Padding(
                padding: const EdgeInsets.all(3),
                child: Text("200" + r'$' + "/hr",
                    style: TextStyle(
                      color: Colors.black,
                    ))),
            Padding(
                padding: const EdgeInsets.all(3),
                child: Text("6-3-2020 12.00.09 AM",
                    style: TextStyle(
                      color: Colors.black,
                    ))),
            Padding(
                padding: const EdgeInsets.all(3),
                child: Text("Completed 4 Feb",
                    style: TextStyle(
                      color: Colors.black,
                    ))),
          ],
        ),
      ),
    );
  }
}
