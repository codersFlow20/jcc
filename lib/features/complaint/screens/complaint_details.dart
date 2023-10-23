import 'package:flutter/material.dart';

class ComplaintDetails extends StatelessWidget {
  // final ComplaintModel complaint;
  const ComplaintDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          'Complaint Details',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 22, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
              children: [
                Text(
                  "Complaint no.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 67),
                Text(
                  "Status",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text("45",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const SizedBox(width: 145),
                RichText(
                  text: const TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 16,
                      color: Colors.green,
                    )),
                    TextSpan(
                      text: " Registered",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ]),
                )
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Text(
                  "Registration Date",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 44),
                Text(
                  "Duration of Completion",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Text("24th August, 2004",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 23),
                Text('120 Hours',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
              ],
            ),
            const Text('Friday, 10:00 PM',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Text('Department',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text('Water Works',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Text('Subject',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text('Low Pressure of water',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  "Area Name",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 135),
                Text(
                  "Ward no.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Text("Community Hall",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 90),
                Text('1',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
              ],
            ),
            const SizedBox(height: 16),
            const Text('Address',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text('Near swaminarayan temple, Unknown Planet - 404',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Text('Description',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text(
              "There's a low pressure of water in our area due to some reasons, fix it within 34 hours",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 340,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Applicant Name',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                )),
            const SizedBox(height: 5),
            const Text('Parshottambhai Patidar',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Text('Applicant Mobile no.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                )),
            const SizedBox(height: 5),
            const Text('+91 9662430978',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Text('Remarks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                )),
            const SizedBox(height: 5),
            const Text('Add Remarks',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            const Text('Photographs : ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 220,
                    height: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 220,
                    height: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 220,
                    height: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Completion Code',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                )),
            const SizedBox(height: 5),
            const Text('123 456',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ]),
        ),
      ),
    );
  }
}
