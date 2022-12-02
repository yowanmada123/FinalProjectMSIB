// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Aboutuspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(48.0),
                color: Theme.of(context).cardColor,
                child: Image(
                  image: AssetImage('assets/images/logo.png'), //delivoo logo
                  height: 130.0,
                  width: 99.7,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Syarat Ketentuan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Syarat dan ketentuan (Ketentuan Penggunaan) berikut ini berlaku untuk mengakses, memasang dan atau menggunakan Aplikasi.  Referensi ke Aplikasi dianggap termasuk turunannya, termasuk namun tidak terbatas pada aplikasi dan aplikasi web seluler.  Anda mengakui bahwa Anda telah membaca, memahami, dan setuju untuk terikat oleh Ketentuan Penggunaan yang ditetapkan di bawah ini dan syarat dan ketentuan lainnya sehubungan dengan Aplikasi, termasuk namun tidak terbatas pada kerahasiaan dan FAQ, yang merupakan bagian yang tidak terpisahkan dari Ketentuan ini.  Menggunakan.  Anda harus berusia minimal tujuh belas (17) tahun untuk menggunakan Aplikasi.",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                        'Perlu diketahui bahwa kami dapat mengubah, menambah, dan menghapus Ketentuan Penggunaan ini dari waktu ke waktu tanpa pemberitahuan sebelumnya.  Ketentuan Penggunaan harus dibaca secara berkala.  Dengan terus menggunakan Aplikasi setelah perubahan Ketentuan Penggunaan Pengunjung tersebut, pengguna terdaftar atau pengguna ("Anda" atau "Pengguna") setuju dan menerima perubahan tersebut.  Jika Anda menggunakan salah satu layanan kami yang lain, penggunaan Anda didasarkan pada kepatuhan dan penerimaan syarat dan ketentuan yang berlaku untuk layanan tersebut.')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
