/* class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
            Map<String, dynamic> data =
            document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['full_name']),
              subtitle: Text(data['company']),
            );
          })
              .toList()
              .cast(),
        );
      },
    );
  }
}



TextFormField(
textInputAction: TextInputAction.next,
decoration: InputDecoration(
prefixIcon: Icon(
Icons.mail,
color: Colors.grey,
),
contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
hintText: "Email",
hintStyle: TextStyle(color: Colors.grey),
border: UnderlineInputBorder(),
),
validator: (text) {
FirebaseFirestore.instance
    .collection('users')
    .doc(inputData())
    .update({'greenh': '$text'});
},
);




return Scaffold(
body: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Рециркуляция воздуха',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _recv,
onChanged: (bool value) {
setState(() {
_recv = value;
});
},
),
),
),
Container(
child: Column(
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Автоматический полив',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _autop,
onChanged: (bool value) {
setState(() {
_autop = value;
});
},
),
),
),
Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Slider(
max: 100,
divisions: 100,
activeColor: Color.fromARGB(255, 64, 208, 99),
inactiveColor: Color.fromARGB(100, 64, 208, 99),
value: _slvz,
onChanged: (double value) {
setState(() {
_slvz = value;
_znvz = _slvz.ceil();
});
},
),
Container(
padding: const EdgeInsets.only(right: 30.0),
child: Text(
'до $_znvz %',
style: TextStyle(fontSize: 20),
),
)
],
),
),
],
),
),
Container(
child: Column(
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Автоматическое проветрирование',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _autof,
onChanged: (bool value) {
setState(() {
_autof = value;
});
},
),
),
),
Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Slider(
max: 100,
divisions: 100,
activeColor: Color.fromARGB(255, 64, 208, 99),
inactiveColor: Color.fromARGB(100, 64, 208, 99),
value: _slvv,
onChanged: (double value) {
setState(() {
_slvv = value;
_znvv = _slvv.ceil();
});
},
),
Container(
padding: const EdgeInsets.only(right: 30.0),
child: Text(
'до $_znvv %',
style: TextStyle(fontSize: 20),
),
)
],
),
),
],
),
),
Container(
child: Column(
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Автоматический полив',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _aosv,
onChanged: (bool value) {
setState(() {
_aosv = value;
});
},
),
),
),
Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Slider(
max: 100,
divisions: 100,
activeColor: Color.fromARGB(255, 64, 208, 99),
inactiveColor: Color.fromARGB(100, 64, 208, 99),
value: _slosv,
onChanged: (double value) {
setState(() {
_slosv = value;
_znosv = _slosv.ceil();
});
},
),
Container(
padding: const EdgeInsets.only(right: 30.0),
child: Text(
'до $_znosv %',
style: TextStyle(fontSize: 20),
),
)
],
),
),
],
),
),
],
),
);






















FutureBuilder(
stream: FirebaseFirestore.instance
    .collection('greenhouses')
.doc(greenHouseName)
.snapshots(),
builder: (BuildContext context,
    AsyncSnapshot<DocumentSnapshot> snapshot) {
if (snapshot.hasError) {
return Text('Something went wrong');
}
if (snapshot.connectionState == ConnectionState.waiting) {
return Center(child: Text("Loading"),);
}


//bool _autop = (snapshot.data! as DocumentSnapshot).get('autopolb');
//bool _autof = (snapshot.data! as DocumentSnapshot).get('autoprovb');
//bool _recv = (snapshot.data! as DocumentSnapshot).get('rec');
//bool _aosv = (snapshot.data! as DocumentSnapshot).get('autolightb');
//double _slvv = (snapshot.data! as DocumentSnapshot).get('autopolz');
//double _slvz = (snapshot.data! as DocumentSnapshot).get('autoprovz');
//double _slosv = (snapshot.data! as DocumentSnapshot).get('autolightz');
bool _autop = true;
bool _autof = true;
bool _recv = true;
bool _aosv = true;
double _slvv = 0;
double _slvz = 0;
double _slosv = 0;
int _znvv = _slvv.ceil();
int _znvz = _slvz.ceil();
int _znosv = _slosv.ceil();
bool kek = (snapshot.data! as DocumentSnapshot).get('rec');
return Scaffold(
body: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Рециркуляция воздуха',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _recv,
onChanged: (bool value) {
setState(() {
_recv = value;
});
},
),
),
),
Container(
child: Column(
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Автоматический полив',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _autop,
onChanged: (bool value) {
setState(() {
_autop = value;
});
},
),
),
),
Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Slider(
max: 100,
divisions: 100,
activeColor: Color.fromARGB(255, 64, 208, 99),
inactiveColor: Color.fromARGB(100, 64, 208, 99),
value: _slvz,
onChanged: (double value) {
setState(() {
_slvz = value;
_znvz = _slvz.ceil();
});
},
),
Container(
padding: const EdgeInsets.only(right: 30.0),
child: Text(
'до $_znvz %',
style: TextStyle(fontSize: 20),
),
)
],
),
),
],
),
),
Container(
child: Column(
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Автоматическое проветрирование',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _autof,
onChanged: (bool value) {
setState(() {
_autof = value;
});
},
),
),
),
Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Slider(
max: 100,
divisions: 100,
activeColor: Color.fromARGB(255, 64, 208, 99),
inactiveColor: Color.fromARGB(100, 64, 208, 99),
value: _slvv,
onChanged: (double value) {
setState(() {
_slvv = value;
_znvv = _slvv.ceil();
});
},
),
Container(
padding: const EdgeInsets.only(right: 30.0),
child: Text(
'до $_znvv %',
style: TextStyle(fontSize: 20),
),
)
],
),
),
],
),
),
Container(
child: Column(
children: [
Container(
height: 100,
decoration: BoxDecoration(
color: Colors.grey[100],
border: Border.all(color: Colors.grey),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: SwitchListTile(
title: Text(
'Автоматический полив',
style: TextStyle(fontSize: 25),
),
activeColor: Color.fromARGB(255, 64, 208, 99),
activeTrackColor: Color.fromARGB(100, 64, 208, 99),
inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
value: _aosv,
onChanged: (bool value) {
setState(() {
_aosv = value;
});
},
),
),
),
Container(
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Slider(
max: 100,
divisions: 100,
activeColor: Color.fromARGB(255, 64, 208, 99),
inactiveColor: Color.fromARGB(100, 64, 208, 99),
value: _slosv,
onChanged: (double value) {
setState(() {
_slosv = value;
_znosv = _slosv.ceil();
});
},
),
Container(
padding: const EdgeInsets.only(right: 30.0),
child: Text(
'до $_znosv %',
style: TextStyle(fontSize: 20),
),
)
],
),
),
],
),
),
],
),
);
});

 */





StreamBuilder<DocumentSnapshot>(
stream: FirebaseFirestore.instance
    .collection('greenhouses')
.doc(greenHouseName)
.snapshots(),
builder: (BuildContext context,
    AsyncSnapshot<DocumentSnapshot> snapshot) {
bool autofort = (snapshot.data! as DocumentSnapshot).get('autofortb');
bool autopol = (snapshot.data! as DocumentSnapshot).get('autopolb');
bool autosvet = (snapshot.data! as DocumentSnapshot).get('autoosvb');
bool autorec = (snapshot.data! as DocumentSnapshot).get('recvoz');

return Container(
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Column(
children: [
_infmd('Форточка', autofort),
Padding(padding: EdgeInsets.only(top: 20)),
_infmd('Рециркуляция', autorec),
],
),
Container(
width: 7,
height: 170,
decoration: BoxDecoration(
shape: BoxShape.rectangle,
borderRadius: BorderRadius.circular(10),
color: Colors.green[600],
),
),
Column(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
_infmd('Полив', autopol),
Padding(padding: EdgeInsets.only(top: 20)),
_infmd('Свет', autosvet),
],
),
],
),
); });

