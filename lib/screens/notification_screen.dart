import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_kop_sq_mobile/screens/notification_all_tab.dart';

class NotificationScreen extends StatelessWidget {

  const NotificationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          leadingWidth: size.width * 0.2,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {

              },
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffE3E9ED)),
                ),
                child: const Icon(Icons.arrow_back_ios_new_sharp, size: 24, color: Color(0xff1F2C37),),
              ),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title:Text('Notifikasi', style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1F2C37)
          ),),
          bottom: TabBar(
            labelColor: const Color(0xff0D64EF),
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700, 
            ),
            unselectedLabelColor: const Color(0xffCCCCCC),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: const Color(0xff0D64EF),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                text: 'Semua Notifikasi',
              ),
              Tab(
                text: 'Belum Dibaca',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: NotificationAllTab(),
            ),
            Center(
              child: Text('Second Tab'),
            ),
          ],
        )
      ),
    );
  }
}