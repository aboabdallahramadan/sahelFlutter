import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/category.dart';

final categoriesProvider = Provider<List<Category>>((ref) {
  return [
    Category(
      id: 'real-estate',
      title: 'Real Estate',
      adsCount: 1250,
      subcategories: [
        const SubCategory(
          id: 'properties-for-rent',
          title: 'Properties for Rent',
          image:
              'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'lands',
          title: 'Lands',
          image:
              'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'properties-for-sale',
          title: 'Properties for Sale',
          image:
              'https://images.unsplash.com/photo-1571939228382-b2f2b585ce15?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'furniture',
          title: 'Furniture',
          image:
              'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'vehicles',
      title: 'Vehicles',
      adsCount: 890,
      subcategories: [
        const SubCategory(
          id: 'cars',
          title: 'Cars',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'car-showrooms',
          title: 'Car Showrooms',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'motorcycles',
          title: 'Motorcycles',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'car-rentals',
          title: 'Car Rentals',
          image:
              'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'offshore-tools',
          title: 'Offshore Tools',
          image:
              'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'spare-parts',
          title: 'Spare Parts',
          image:
              'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'heavy-equipment',
          title: 'Heavy Equipment',
          image:
              'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'mzad-yard',
          title: 'Mzad Yard',
          image:
              'https://images.unsplash.com/photo-1587293852726-70cdb56c2866?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'services',
      title: 'Services',
      adsCount: 675,
      subcategories: [
        const SubCategory(
          id: 'pest-control',
          title: 'Pest Control',
          image:
              'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'air-conditioner',
          title: 'Air Conditioner',
          image:
              'https://images.unsplash.com/photo-1554995207-c18c203602cb?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'cleaning-services',
          title: 'Cleaning Services',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'occasions',
          title: 'Occasions',
          image:
              'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'construction',
          title: 'Construction',
          image:
              'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'furniture-moving',
          title: 'Furniture Moving',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'transport-services',
          title: 'Transport Services',
          image:
              'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'decor-design',
          title: 'Decor & Design',
          image:
              'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'landscaping',
          title: 'Landscaping',
          image:
              'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'education',
          title: 'Education',
          image:
              'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'selling-projects',
          title: 'Selling Projects',
          image:
              'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'business-services',
          title: 'Business Services',
          image:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'maintenance-services',
          title: 'Maintenance Services',
          image:
              'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'family-needs',
      title: 'Family Needs',
      adsCount: 445,
      subcategories: [
        const SubCategory(
          id: 'men-fashion',
          title: 'Men Fashion',
          image:
              'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'women-fashion',
          title: 'Women Fashion',
          image:
              'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'kids-products',
          title: 'Kids Products',
          image:
              'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'gifts',
          title: 'Gifts',
          image:
              'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'food',
          title: 'Food',
          image:
              'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'jobs',
      title: 'Jobs',
      adsCount: 320,
      subcategories: [
        const SubCategory(
          id: 'job-vacancies',
          title: 'Job Vacancies',
          image:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'job-seekers',
          title: 'Job Seekers',
          image:
              'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'freelancers',
          title: 'Freelancers',
          image:
              'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'electronics',
      title: 'Electronics',
      adsCount: 780,
      subcategories: [
        const SubCategory(
          id: 'mobiles',
          title: 'Mobiles',
          image:
              'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'electronics',
          title: 'Electronics',
          image:
              'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'home-appliances',
          title: 'Home Appliances',
          image:
              'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'cameras',
          title: 'Cameras',
          image:
              'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'electronic-games',
          title: 'Electronic Games',
          image:
              'https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'sport',
      title: 'Sport & Health',
      adsCount: 234,
      subcategories: [
        const SubCategory(
          id: 'health',
          title: 'Health',
          image:
              'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'sports',
          title: 'Sports',
          image:
              'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'scooter',
          title: 'Scooter',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'travel',
      title: 'Travel',
      adsCount: 156,
      subcategories: [
        const SubCategory(
          id: 'tourism',
          title: 'Tourism',
          image:
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'trips',
          title: 'Trips',
          image:
              'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'numbers',
      title: 'Numbers',
      adsCount: 89,
      subcategories: [
        const SubCategory(
          id: 'mobile-numbers',
          title: 'Mobile Numbers',
          image:
              'https://images.unsplash.com/photo-1596727147705-61a532a659bd?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'mobile-numbers-auction',
          title: 'Mobile Numbers Auction',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'car-plates',
          title: 'Car Plates',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'car-plates-auction',
          title: 'Car Plates Auction',
          image:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'animals',
      title: 'Animals',
      adsCount: 167,
      subcategories: [
        const SubCategory(
          id: 'horses',
          title: 'Horses',
          image:
              'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'camel-auctions',
          title: 'Camel Auctions',
          image:
              'https://images.unsplash.com/photo-1514316454349-750a7fd3da3a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'birds',
          title: 'Birds',
          image:
              'https://images.unsplash.com/photo-1444464666168-49d633b86797?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'other-animals',
          title: 'Other Animals',
          image:
              'https://images.unsplash.com/photo-1425082661705-1834bfd09dca?w=400&h=400&fit=crop',
        ),
      ],
    ),
    Category(
      id: 'others',
      title: 'Others',
      adsCount: 298,
      subcategories: [
        const SubCategory(
          id: 'special-coins',
          title: 'Special Coins',
          image:
              'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'antiques',
          title: 'Antiques',
          image:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'charity',
          title: 'Charity',
          image:
              'https://images.unsplash.com/photo-1469571486292-0ba58a3f068b?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'others',
          title: 'Others',
          image:
              'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        ),
        const SubCategory(
          id: 'inquires',
          title: 'Inquires',
          image:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop',
        ),
      ],
    ),
  ];
});
