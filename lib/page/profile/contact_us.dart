import 'package:flutter/material.dart';



class EditContactUsPage extends StatefulWidget {
  @override
  _EditContactUsPageState createState() => _EditContactUsPageState();
}

class _EditContactUsPageState extends State<EditContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white
          ),
          onPressed: () {},
          ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16,),
        child: ListView(
          children: [
            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
           const  SizedBox(
              height: 20,
            ),
           Center(
            child: ListView(
              children: [
                const Text(
                  "ANGGOTA",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
               const SizedBox(
                height: 32,
               ),
               Stack(
                 children: [
                    Container(
                       width: 50,
                       height: 50,
                       decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/people.png'),
                          ),
                       ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        "Yowanda Frisky A"    "_CEO",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ),
                     const  SizedBox(width: 10,),
                      const Expanded(
                        child: Text(
                          "082231532679",
                          style: TextStyle(fontSize: 5, fontWeight: FontWeight.w100),
                        ),
                        ),
                        const SizedBox(
                height: 15,
               ),
               Stack(
                 children: [
                    Container(
                       width: 50,
                       height: 50,
                       decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/people.png'),
                          ),
                       ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        "Hafizh Dharmawan"    "_CEO",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: const Text(
                          "085155316774",
                          style: TextStyle(fontSize: 5, fontWeight: FontWeight.w100),
                        ),
                        ),
                     const SizedBox(
                height: 15,
               ),
               Stack(
                 children: [
                    Container(
                       width: 50,
                       height: 50,
                       decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/people.png'),
                          ),
                       ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        "Wardhatul Mufida"    "_CEO",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ),
                     const SizedBox(width: 10,),
                      const Expanded(
                        child: Text(
                          "085816817899",
                          style: TextStyle(fontSize: 5, fontWeight: FontWeight.w100),
                        ),
                        ), 
                        const SizedBox(
                height: 15,
               ),
               Stack(
                 children: [
                    Container(
                       width: 50,
                       height: 50,
                       decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/people.png'),
                          ),
                       ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        "Gede Rizky Chandra Saputra"    "_CEO",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ),
                      const SizedBox(width: 10,),
                      const Expanded(
                        child: Text(
                          "081999942144",
                          style: TextStyle(fontSize: 5, fontWeight: FontWeight.w100),
                        ),
                        ), 
                      const SizedBox(
                height: 15,
               ),
               Stack(
                 children: [
                    Container(
                       width: 50,
                       height: 50,
                       decoration:const  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/people.png'),
                          ),
                       ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        "Muhammad Faris Rahman"    "_CEO",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ),
                     const  SizedBox(width: 10,),
                      const Expanded(
                        child: Text(
                          "0895325690949",
                          style: TextStyle(fontSize: 5, fontWeight: FontWeight.w100),
                        ),
                        ),  
                        const SizedBox(
                height: 15,
               ),
               Stack(
                 children: [
                    Container(
                       width: 50,
                       height: 50,
                       decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/people.png'),
                          ),
                       ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        "Muhammad Ruchyat Siregar"    "_CEO",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ),
                      const SizedBox(width: 10,),
                      const Expanded(
                        child: Text(
                          "085361086319",
                          style: TextStyle(fontSize: 5, fontWeight: FontWeight.w100),
                        ),
                        ), 
                 ],
               ),
                 ],
               ),
                 ],
               ),
                 ],
               ),
                 ],
                ),
              ],
            ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
