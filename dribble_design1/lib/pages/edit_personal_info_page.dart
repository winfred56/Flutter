import 'package:flutter/material.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  String genderRadio = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading:  IconButton(onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black
          ),),
        title: Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue
            ),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(
                  Icons.done
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 195),
                child: Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 290),
                child: Text(
                    "Photo",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    )
                ),
              ),

              /// Profile Picture
              const CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVnja3DFheGQjch5AL1n0Rk8nOFHm6Ny60w&usqp=CAU'),
                radius: 50,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),

              /// Upload Image
              TextButton(
                  onPressed: (){},
                  child: const Text(
                      'Upload Image',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  )),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Name Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Gender Radio
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),

                  _radioIcon(gender: 'male', icon: const Icon(Icons.male, size: 30,)),
                  _radioIcon(gender: 'female', icon: const Icon(Icons.female, size: 30,))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),

              /// Age
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      "Age",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Email
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  /// Radio Button for Gender
  Widget _radioIcon({required String gender, required Icon icon }){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: genderRadio == gender ? Colors.blue : Colors.grey,
        ),
        child: InkResponse(
          child: icon,
          onTap: () {
            setState(() {
              genderRadio = gender;
            });
          },
        ),
      ),
    );
  }
}



