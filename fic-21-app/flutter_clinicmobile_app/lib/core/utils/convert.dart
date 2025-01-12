import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Convert {
  static String formatTimeWithoutSeconds(String timeWithSeconds) {
    DateTime parsedTime = DateFormat("HH:mm:ss").parse(timeWithSeconds);
    return DateFormat("HH:mm").format(parsedTime);
  }

  static String formatTo24Hour(TimeOfDay time) {
    final int hour = time.hour; // Mendapatkan jam dalam format 24-jam
    final int minute = time.minute; // Mendapatkan menit
    // Format angka menjadi dua digit
    final String formattedHour = hour.toString().padLeft(2, '0');
    final String formattedMinute = minute.toString().padLeft(2, '0');
    return "$formattedHour:$formattedMinute";
  }

  static String formatToReadableDate(String dateTimeString) {
    DateTime parsedDate =
    DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTimeString);
    return DateFormat("dd MMM yyyy").format(parsedDate);
  }

  // Menambahkan metode untuk format waktu
  static String formatToReadableTime(String dateTimeString) {
    DateTime parsedDate =
    DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTimeString);
    return DateFormat("HH:mm").format(parsedDate);
  }

  static String formatToReadableTime2(String dateTimeString) {
    DateTime parsedDate = DateFormat("HH:mm:ss").parse(dateTimeString);
    return DateFormat("HH:mm").format(parsedDate);
  }

  static String cleanCurrencyToNumber(String formattedText) {
    // Membersihkan semua karakter non-numeric dari string
    return formattedText.replaceAll(RegExp(r'[^0-9]'), '');
  }
}
