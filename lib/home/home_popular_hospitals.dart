import 'package:flutter/material.dart';

import '../common/data/models/hospital.dart';
import '../common/widgets/hospital_item.dart';
import '../common/widgets/resources.dart';
import '../routes.dart';

class HomePopularHospitals extends StatelessWidget {
  final VoidCallback goToSearch;

  const HomePopularHospitals({
    Key? key,
    required this.goToSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: Text(
            'Popular Hospitals',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.titleFamily,
            ),
          ),
        ),
        const SizedBox(height: AppPadding.normal),
        Container(
          height: 340,
          padding: const EdgeInsets.only(left: AppPadding.normal),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.hospitalDetails,
                arguments: index,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: AppPadding.normal),
                child: HospitalItem(
                  hospital: testHospitals[index],
                  axis: Axis.vertical,
                ),
              ),
            ),
            itemCount: testHospitals.length,
          ),
        ),
        const SizedBox(height: AppPadding.small),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: TextButton.icon(
            onPressed: goToSearch,
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
            ),
            icon: Text(
              'View all hospitals',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.primary,
              ),
            ),
            label: const Icon(Icons.arrow_right_alt_outlined),
          ),
        ),
      ],
    );
  }
}
