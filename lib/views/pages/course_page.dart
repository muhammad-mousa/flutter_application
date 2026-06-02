import 'package:flutter/material.dart';
import 'package:flutter_application/data/classes/activity_class.dart';
import 'package:flutter_application/service/activity_service.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<Activity> _activityFuture;

  @override
  void initState() {
    super.initState();
    _loadActivity();
  }

  void _loadActivity() {
    _activityFuture = ActivityService().fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Activity>(
        future: _activityFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.teal),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No activity found'));
          }

          final activity = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 180,
                pinned: true,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal, Color(0xFF26A69A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      'Activity Finder',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.withValues(alpha: 0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.emoji_objects_rounded,
                              size: 60,
                              color: Colors.teal,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              activity.activity,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Chip(
                            avatar: const Icon(
                              Icons.category,
                              size: 18,
                              color: Colors.teal,
                            ),
                            label: Text(activity.type),
                          ),
                          Chip(
                            avatar: const Icon(
                              Icons.people,
                              size: 18,
                              color: Colors.teal,
                            ),
                            label: Text(
                              '${activity.participants} Participant(s)',
                            ),
                          ),
                          Chip(
                            avatar: const Icon(
                              Icons.accessibility_new,
                              size: 18,
                              color: Colors.teal,
                            ),
                            label: Text(activity.accessibility),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              _infoTile(
                                Icons.attach_money,
                                'Price',
                                activity.price.toString(),
                              ),
                              _infoTile(
                                Icons.schedule,
                                'Duration',
                                activity.duration,
                              ),
                              _infoTile(
                                Icons.event_available,
                                'Availability',
                                activity.availability.toString(),
                              ),
                              _infoTile(
                                Icons.child_care,
                                'Kid Friendly',
                                activity.kidFriendly ? 'Yes' : 'No',
                              ),
                              _infoTile(Icons.vpn_key, 'Key', activity.key),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _loadActivity();
                            });
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text(
                            'Get Another Activity',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      subtitle: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
