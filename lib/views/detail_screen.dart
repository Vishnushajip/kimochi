import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suzuki/services/UrlLauncher.dart';

import '../models/university.dart';

class DetailScreen extends StatelessWidget {
  final University university;

  const DetailScreen({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    final countryCode = university.alpha_two_code.toUpperCase();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'University Details',
          style: GoogleFonts.aBeeZee(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          children: [
            Center(
              child: countryCode.isNotEmpty
                  ? CountryFlag.fromCountryCode(
                      countryCode,
                      width: 120,
                      height: 80,
                    )
                  : const Icon(Icons.flag, size: 80, color: Colors.grey),
            ),

            const SizedBox(height: 32),

            Text(
              university.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),
            Text(
              university.country,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 24),
            if (university.webPages.isNotEmpty) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Website: ',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () async {
                        UrlLauncher.launch(university.webPages.first);
                      },
                      child: Text(
                        university.webPages.first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
