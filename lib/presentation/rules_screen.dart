import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAB7844),
        title: Text(loc.rulesTitle),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, loc.gameTitle),
              const SizedBox(height: 10),
              _buildDescription(
                context,
                loc.gameDescription,
              ),
              const SizedBox(height: 24),
              _buildSectionCard(
                context,
                loc.disasterScenario,
                loc.disasterScenarioDesc,
                Icons.warning_amber_rounded,
              ),
              _buildSectionCard(
                context,
                loc.characterRoles,
                loc.characterRolesDesc,
                Icons.person,
                bulletPoints: [
                  loc.profession,
                  loc.ageRule,
                  loc.healthRule,
                  loc.hobbiesRule,
                  loc.phobiasRule,
                  loc.luggageRule,
                  loc.additionalInfoRule,
                ],
              ),
              _buildSectionCard(
                context,
                loc.discussionDebate,
                loc.discussionDebateDesc,
                Icons.forum,
                bulletPoints: [
                  loc.discussionDebatePoint1,
                  loc.discussionDebatePoint2,
                ],
              ),
              _buildSectionCard(
                context,
                loc.votingTitle,
                loc.votingDesc,
                Icons.how_to_vote,
                bulletPoints: [
                  loc.votingPoint1,
                  loc.votingPoint2,
                  loc.votingPoint3,
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(loc.goBack),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }

  Widget _buildDescription(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontStyle: FontStyle.italic,
          ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    String description,
    IconData icon, {
    List<String>? bulletPoints,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (bulletPoints != null) ...[
              const SizedBox(height: 12),
              ...bulletPoints.map((point) => Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                            )),
                        Expanded(
                          child: Text(
                            point,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}
