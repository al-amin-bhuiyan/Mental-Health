import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ViewJournalController extends GetxController {
  // Search controller
  final TextEditingController searchController = TextEditingController();
  RxString searchQuery = ''.obs;

  // Recent Journal entries list
  RxList<Map<String, dynamic>> journalEntries = <Map<String, dynamic>>[
    {
      'title': 'Gratitude Journal',
      'mood': '😊',
      'content': 'Today I\'m grateful for the warm sunlight streaming through my window and the quiet moments of peace...',
      'timestamp': 'Yesterday, 11:34 PM',
      'hasImage': true,
    },
    {
      'title': 'Gratitude Journal',
      'mood': '😟',
      'content': 'Today I\'m grateful for the warm sunlight streaming through my window and the quiet moments of peace...',
      'timestamp': 'Yesterday, 11:34 PM',
      'hasImage': false,
    },
  ].obs;

  // Older Journal entries list
  RxList<Map<String, dynamic>> olderJournalEntries = <Map<String, dynamic>>[
    {
      'title': 'Gratitude Journal',
      'mood': '😌',
      'content': 'Today I\'m grateful for the warm sunlight streaming through my window and the quiet moments of peace...',
      'timestamp': '1 week ago',
      'hasImage': true,
    },
    {
      'title': 'Gratitude Journal',
      'mood': '😠',
      'content': 'Today I\'m grateful for the warm sunlight streaming through my window and the quiet moments of peace...',
      'timestamp': '1 week ago',
      'hasImage': false,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // Load journal entries from database or API
    loadJournalEntries();

    // Listen to search controller changes
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  // Load journal entries
  void loadJournalEntries() {
    // TODO: Call API to fetch journal entries
    // For now, using sample data
  }

  // Add new journal entry
  void addJournalEntry(Map<String, dynamic> entry) {
    journalEntries.insert(0, entry);
  }

  // Delete recent journal entry
  void deleteJournalEntry(int index) {
    if (index >= 0 && index < journalEntries.length) {
      journalEntries.removeAt(index);
    }
  }

  // Delete older journal entry
  void deleteOlderJournalEntry(int index) {
    if (index >= 0 && index < olderJournalEntries.length) {
      olderJournalEntries.removeAt(index);
    }
  }

  // Search journal entries
  void searchJournalEntries(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      // TODO: Call API to load all journal entries (no filter)
      loadJournalEntries();
      return;
    }

    // TODO: Call API to search journal entries by query
    // Example API call:
    // final response = await journalApi.searchJournals(query: query);
    // if (response.success) {
    //   journalEntries.value = response.recentEntries;
    //   olderJournalEntries.value = response.olderEntries;
    // }

    // For now, implementing local search as placeholder
    print('Searching for: $query');
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    // TODO: Call API to load all journal entries (reset to default)
    loadJournalEntries();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

