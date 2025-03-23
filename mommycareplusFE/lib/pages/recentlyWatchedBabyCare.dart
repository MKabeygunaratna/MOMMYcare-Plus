import 'package:flutter/material.dart';

class RecentlyWatchedScreen extends StatelessWidget {
  final List<Map<String, String>> recentlyWatched;

  RecentlyWatchedScreen({required this.recentlyWatched});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Baby Care',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Top Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('Videos', false),
                _buildTabButton('Recent', true), // Recent is selected
                _buildTabButton('Books', false),
                _buildTabButton('Articles', false),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Recently Watched List
          Expanded(
            child: recentlyWatched.isEmpty
                ? Center(child: Text('No recently watched videos.'))
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: recentlyWatched.length,
              itemBuilder: (context, index) {
                final video = recentlyWatched[index];
                return _buildVideoCard(video);
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  // Tab Button Widget
  Widget _buildTabButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Handle tab change if necessary
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF755DC1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Video Card Widget
  Widget _buildVideoCard(Map<String, String> video) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'https://img.youtube.com/vi/${video['videoId']}/0.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Text Content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video['title'] ?? 'Video Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Including temperature, timing, and products to use.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
