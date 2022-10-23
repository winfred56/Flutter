import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
              Icons.arrow_back_ios,
            color: Colors.black
          ),),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15 ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Settings
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 200),
                child: Text(
                    "Settings",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  )
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Account Text
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 250, bottom: 20),
                child: Text(
                    "Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVnja3DFheGQjch5AL1n0Rk8nOFHm6Ny60w&usqp=CAU'),
                  radius: 30,
                ),
                title: const Text(
                    "David Clerisseau",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  )
                ),
                subtitle: const Text(
                    "Personal Info",
                  style: TextStyle(
                    color: Colors.grey,
                  )
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: IconButton(onPressed: () => Navigator.pushNamed(context, '/edit_personal_info'),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Settings
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 250, bottom: 30),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              /// Language settings
              ListTile(
                leading: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: const Icon(
                      Icons.language,
                    size: 30,
                    color: Colors.orangeAccent,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                        "Language",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    Text(
                        "English",
                        style: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ],
                ),

                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: IconButton(onPressed: (){},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Notifications
              ListTile(
                leading: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                title:const Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )
                ),

                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: IconButton(onPressed: (){},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Dark Mode
              ListTile(
                leading: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: const Icon(
                    Icons.dark_mode_rounded,
                    size: 30,
                    color: Colors.purple,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    Text(
                        "Off",
                        style: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ],
                ),

                trailing: Switch(
                  value: false,
                  onChanged: (bool value) {  },)
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),

              /// Help
              ListTile(
                leading: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: const Icon(
                    Icons.support,
                    size: 30,
                    color: Colors.redAccent,
                  ),
                ),
                title:const Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )
                ),

                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: IconButton(onPressed: (){},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                ),
              ),




            ],
          ),
        ),
      )

    );
  }
}
