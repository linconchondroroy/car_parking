import 'package:flutter/material.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _ParkingFilterPageState();
}

class _ParkingFilterPageState extends State<HomeScreenTwo> {
  String vehicleType = "Car";
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.car_repair, color: Colors.redAccent),
            const SizedBox(width: 8),
            const Text(
              "Parking Filter",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("Parking Filter"),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildVehicleOption("Car"),
                const SizedBox(width: 15),
                _buildVehicleOption("Truck"),
              ],
            ),
            const SizedBox(height: 20),
            _buildTitle("Location"),
            const SizedBox(height: 10),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: "Enter Your Location",
                hintStyle: const TextStyle(color: Colors.redAccent),
                prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.redAccent),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTitle("Location Distance"),
            const SizedBox(height: 10),
            _buildBox("10KM"),
            const SizedBox(height: 20),
            _buildTitle("Reservation Date"),
            const SizedBox(height: 10),
            TextField(
              controller: dateController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "mm/dd/yyyy",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.redAccent),
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        // dateController.text = DateFormat('MM/dd/yyyy').format(picked);
                      });
                    }
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTitle("Price Range"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildBox("\$25")),
                const SizedBox(width: 15),
                Expanded(child: _buildBox("\$50")),
              ],
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (contex)=>HomePage3()));
                },
                child: const Text(
                  "Apply Filters",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _buildVehicleOption(String type) {
    final bool isSelected = vehicleType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            vehicleType = type;
          });
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.redAccent.withOpacity(0.1) : Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: type,
                groupValue: vehicleType,
                activeColor: Colors.redAccent,
                onChanged: (value) {
                  setState(() {
                    vehicleType = value!;
                  });
                },
              ),
              Text(
                type,
                style: TextStyle(
                  color: isSelected ? Colors.redAccent : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox(String text) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}