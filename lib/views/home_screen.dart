import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suzuki/services/LoginBottomSheet.dart';
import 'package:suzuki/views/user_profile_Screen.dart';
import 'package:suzuki/widgets/Typo_Head.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoginBottomSheet.checkAndShow(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Global University Search + User Profile App",
          style: GoogleFonts.nunito(color: Colors.black, fontSize: 15),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: const [UserProfileRow(), SearchBarall()]),
      ),
    );
  }
}
