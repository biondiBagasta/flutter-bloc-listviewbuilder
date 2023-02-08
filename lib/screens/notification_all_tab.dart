import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_kop_sq_mobile/cubit/notification_all_tab_cubit.dart';

class NotificationAllTab extends StatelessWidget {

  const NotificationAllTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<dynamic, dynamic>> notificationData = [
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Menerima',
        'status': 'READ'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Mengirim',
        'status': 'UNREAD'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Menerima',
        'status': 'READ'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Mengirim',
        'status': 'UNREAD'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Menerima',
        'status': 'READ'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Mengirim',
        'status': 'UNREAD'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Menerima',
        'status': 'READ'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Mengirim',
        'status': 'UNREAD'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Menerima',
        'status': 'READ'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Mengirim',
        'status': 'UNREAD'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Menerima',
        'status': 'READ'
      },
      {
        'title': 'Kamu menerima saldo dari Dodi Taison +Rp. 500.000',
        'posted': '11.00 AM',
        'type': 'Mengirim',
        'status': 'UNREAD'
      }
    ];
    return BlocProvider(
      create: (context2) => NotificationAllTabCubit(notificationsData: notificationData),
      child: Builder(
        builder: (context) {
          return BlocBuilder<NotificationAllTabCubit, NotificationAllTabState>(
            builder: (context3, state) {
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context4, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                              offset: Offset(0, 0.75)
                          )
                        ],
                        color: state.notifications[index]['status'] == 'UNREAD' ?
                        const Color(0xffF5F5F5) : Colors.white
                      ),
                      child: ListTile(
                        onTap: () {
                          context3.read<NotificationAllTabCubit>().removeNotificationsData(index);
                        },
                        leading: SvgPicture.asset(
                          state.notifications[index]['type'] == 'Menerima' ? 'assets/icon_menerima_saldo.svg'
                          : 'assets/icon_mengirim_saldo.svg'
                        ),
                        title: Text(
                          state.notifications[index]['title'], style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff006499)
                          ),
                        ),
                        subtitle: Text(
                          state.notifications[index]['posted'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff999999)
                          ),
                        ),
                      ),
                    ),
                  );
                }
              );
            },
          );
        }
      )
    );
  }
}