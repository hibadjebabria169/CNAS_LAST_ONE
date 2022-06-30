import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Dest extends StatefulWidget {
  const Dest({Key? key}) : super(key: key);

  @override
  State<Dest> createState() => _DestState();
}

class _DestState extends State<Dest> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String googleApikey = "AIzaSyBTLqmoGquOc07Hmr7oBCF4sPBxmCCgRlY";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(37.42796133580664, -122.085749655962);
  String location = "Choisissez une destination";

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Rendez-vous"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition(
                //innital position in map
                target: startLocation, //initial position
                zoom: 14.0, //initial zoom level
              ),
              mapType: MapType.normal, //map type
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
            ),
          ),

          //search autoconplete input
          Positioned(
              //search input bar
              top: 20,
              child: InkWell(
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApikey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'dz')],
                        //google_map_webservice package
                        onError: (err) {
                          print(err);
                        });

                    if (place != null) {
                      setState(() {
                        location = place.description.toString();
                      });

                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(
                        apiKey: googleApikey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid);
                      final geometry = detail.result.geometry!;
                      final lat = geometry.location.lat;
                      final lang = geometry.location.lng;
                      var newlatlang = LatLng(lat, lang);

                      //move map camera to selected place with animation
                      mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 17)));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title: Text(
                              location,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )),
                    ),
                  ))),

          Padding(
            padding: const EdgeInsets.only(
                left: 20, top: 620, right: 20, bottom: 10),
            child: buildButton(
                text: ('Add'),
                onClicked: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(location))),
          ),
        ],
      ),
    );
  }
}

final format = DateFormat("yyyy-MM-dd");
final initialValue = DateTime.now();
AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
bool? readOnly = true;
bool? showResetIcon = true;
DateTime? value = DateTime.now();
int changedCount = 0;
int savedCount = 0;

Widget buildButton({
  required String text,
  required VoidCallback onClicked,
}) =>
    ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey,
      ),
      onPressed: onClicked,
      label: const Text(
        'Ajouter',
        style: TextStyle(fontSize: 20),
      ),
      icon: const Icon(Icons.add_circle),
    );

Widget buildSheet(String location) => Column(children: <Widget>[
      SizedBox(height: 40),
      ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.blueGrey,
        ),
        title: Text(
          location,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
      ),
      SizedBox(height: 30),
      Padding(
        //  padding: const EdgeInsets.all(8.0),

        padding: const EdgeInsets.only(right: 300),

        child: Text(
          'Date',
          style: TextStyle(color: Colors.blueGrey, fontSize: 25),
          textAlign: TextAlign.left,
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.calendar_month,
          color: Colors.blueGrey,
        ),
        title: DateTimeField(
          decoration: InputDecoration(

              //icon of text field

              labelText: "Choisissez une date" //label text of field

              ),
          format: format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2022),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));

            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );

              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          autovalidateMode: autoValidateMode,
          validator: (date) => date == null ? 'Invalid date' : null,
          initialValue: initialValue,
          resetIcon: showResetIcon! ? Icon(Icons.delete) : null,
          readOnly: readOnly!,
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 50, bottom: 20),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: Colors.blueGrey,
          child: new Text(
            "Lancer",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    ]);

final url = 'https://77d3-105-235-129-168.in.ngrok.io/';

void postData() async {
  try {
    final response = await post(Uri.parse(url), body: {
      'idrdv': '1',
      'daterdv': '16-09-2019',
      'locationFrom': '1',
      'locationTo': '1',
      'idPatient': '1',
      'idOperateur': '1',
      'typeRdv': 'rdv',
      'longDep': '37.42796133580664',
      'latDep': 'lang',
      'longDes': '-122.085749655962',
      'latDes': 'lat',
    });
  } catch (err) {
    print(err);
  }
}
