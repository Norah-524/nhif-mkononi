import 'package:flutter/material.dart';

class SList {
  String head;

  SList({required this.head});
}

List<SList> memberships = [
  SList(head: 'Toto Afya Card'),
  SList(head: 'Student'),
  SList(head: 'Public Institutions'),
  SList(head: 'Non Public Institutions'),
  SList(head: 'Retiree'),
  SList(head: 'Umoja Afya'),
  SList(head: 'Machinga Afya'),
  SList(head: 'Madereva Afya'),
];

List<SList> Bpacks = [
  SList(head: 'Consultations'),
  SList(head: 'Investigations'),
  SList(head: 'Eye and optical services'),
  SList(head: 'Medicines and medical supplies'),
  SList(head: 'Spectacles'),
  SList(head: 'Surgical services'),
];

// Inpatient care services including ICU and HDU
// Retirees health benefits
// Physiotherapy and rehabilitation services
// Medical or orthopaedic appliances
// Dental and oral health services

List<SList> Apacks = [
  SList(head: 'Student'),
];
