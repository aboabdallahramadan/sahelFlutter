import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @navCategories.
  ///
  /// In en, this message translates to:
  /// **'Ads Categories'**
  String get navCategories;

  /// No description provided for @navLiveAuction.
  ///
  /// In en, this message translates to:
  /// **'Sahal Live Auction'**
  String get navLiveAuction;

  /// No description provided for @navLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in to see more features'**
  String get navLogin;

  /// No description provided for @navLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get navLanguage;

  /// No description provided for @navAllCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get navAllCategories;

  /// No description provided for @navDownloadApp.
  ///
  /// In en, this message translates to:
  /// **'Download Sahal App free'**
  String get navDownloadApp;

  /// No description provided for @navHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get navHelp;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @navPostAd.
  ///
  /// In en, this message translates to:
  /// **'Post Ad'**
  String get navPostAd;

  /// No description provided for @categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesTitle;

  /// No description provided for @categoriesDescription.
  ///
  /// In en, this message translates to:
  /// **'Browse through our wide range of categories to find the perfect ad for your needs'**
  String get categoriesDescription;

  /// No description provided for @categoriesRealEstate.
  ///
  /// In en, this message translates to:
  /// **'Real estate'**
  String get categoriesRealEstate;

  /// No description provided for @categoriesVehicles.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get categoriesVehicles;

  /// No description provided for @categoriesServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get categoriesServices;

  /// No description provided for @categoriesFamilyNeeds.
  ///
  /// In en, this message translates to:
  /// **'Family needs'**
  String get categoriesFamilyNeeds;

  /// No description provided for @categoriesJobs.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get categoriesJobs;

  /// No description provided for @categoriesElectronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get categoriesElectronics;

  /// No description provided for @categoriesSport.
  ///
  /// In en, this message translates to:
  /// **'Sport & Fitness'**
  String get categoriesSport;

  /// No description provided for @categoriesTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel & Trips'**
  String get categoriesTravel;

  /// No description provided for @categoriesNumbers.
  ///
  /// In en, this message translates to:
  /// **'Numbers & Plates'**
  String get categoriesNumbers;

  /// No description provided for @categoriesAnimals.
  ///
  /// In en, this message translates to:
  /// **'Animals & Birds'**
  String get categoriesAnimals;

  /// No description provided for @categoriesOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get categoriesOthers;

  /// No description provided for @categoriesSubcategories.
  ///
  /// In en, this message translates to:
  /// **'subcategories'**
  String get categoriesSubcategories;

  /// No description provided for @categoriesViewSubcategories.
  ///
  /// In en, this message translates to:
  /// **'View Subcategories'**
  String get categoriesViewSubcategories;

  /// No description provided for @subcategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Subcategories'**
  String get subcategoriesTitle;

  /// No description provided for @categoryDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover the latest ads in this category'**
  String get categoryDiscover;

  /// No description provided for @categoryFilterResults.
  ///
  /// In en, this message translates to:
  /// **'Filter Results'**
  String get categoryFilterResults;

  /// No description provided for @categoryAllTypes.
  ///
  /// In en, this message translates to:
  /// **'All Types'**
  String get categoryAllTypes;

  /// No description provided for @categoryType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get categoryType;

  /// No description provided for @categoryAllLocations.
  ///
  /// In en, this message translates to:
  /// **'All Locations'**
  String get categoryAllLocations;

  /// No description provided for @categoryLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get categoryLocation;

  /// No description provided for @categoryNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get categoryNewest;

  /// No description provided for @categoryOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get categoryOldest;

  /// No description provided for @categoryPriceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: Low to High'**
  String get categoryPriceLowToHigh;

  /// No description provided for @categoryPriceHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Price: High to Low'**
  String get categoryPriceHighToLow;

  /// No description provided for @categoryShowingResultsFor.
  ///
  /// In en, this message translates to:
  /// **'Showing results for'**
  String get categoryShowingResultsFor;

  /// No description provided for @categoryComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get categoryComingSoon;

  /// No description provided for @categoryComingSoonDescription.
  ///
  /// In en, this message translates to:
  /// **'Listings for this category will be added soon'**
  String get categoryComingSoonDescription;

  /// No description provided for @commonAds.
  ///
  /// In en, this message translates to:
  /// **'ads'**
  String get commonAds;

  /// No description provided for @commonSale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get commonSale;

  /// No description provided for @commonRent.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get commonRent;

  /// No description provided for @commonServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get commonServices;

  /// No description provided for @commonSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search for anything...'**
  String get commonSearchPlaceholder;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get commonLoading;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Error occurred'**
  String get commonError;

  /// No description provided for @commonHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get commonHome;

  /// No description provided for @commonViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get commonViewAll;

  /// No description provided for @commonLatestAds.
  ///
  /// In en, this message translates to:
  /// **'Latest Ads'**
  String get commonLatestAds;

  /// No description provided for @commonTotalAds.
  ///
  /// In en, this message translates to:
  /// **'Total Ads'**
  String get commonTotalAds;

  /// No description provided for @commonSAR.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get commonSAR;

  /// No description provided for @commonSeeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get commonSeeMore;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get commonJustNow;

  /// No description provided for @commonMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'Minutes ago'**
  String get commonMinutesAgo;

  /// No description provided for @commonHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'Hours ago'**
  String get commonHoursAgo;

  /// No description provided for @commonYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get commonYesterday;

  /// No description provided for @commonDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'Days ago'**
  String get commonDaysAgo;

  /// No description provided for @commonSearchAds.
  ///
  /// In en, this message translates to:
  /// **'Search Ads'**
  String get commonSearchAds;

  /// No description provided for @commonStartTypingToSearch.
  ///
  /// In en, this message translates to:
  /// **'Start typing to search'**
  String get commonStartTypingToSearch;

  /// No description provided for @commonErrorLoadingSearchResults.
  ///
  /// In en, this message translates to:
  /// **'Error loading search results'**
  String get commonErrorLoadingSearchResults;

  /// No description provided for @commonNoResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get commonNoResultsFound;

  /// No description provided for @commonTrySearchingForSomethingElse.
  ///
  /// In en, this message translates to:
  /// **'Try searching for something else'**
  String get commonTrySearchingForSomethingElse;

  /// No description provided for @commonResultsFound.
  ///
  /// In en, this message translates to:
  /// **'Results found'**
  String get commonResultsFound;

  /// No description provided for @commonSecureLogin.
  ///
  /// In en, this message translates to:
  /// **'Secure Login'**
  String get commonSecureLogin;

  /// No description provided for @commonFastEasy.
  ///
  /// In en, this message translates to:
  /// **'Fast And Easy'**
  String get commonFastEasy;

  /// No description provided for @commonByContinuingYouAgreeToOurTermsOfServiceAndPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'By Continuing You Agree To Our Terms Of Service And Privacy Policy'**
  String get commonByContinuingYouAgreeToOurTermsOfServiceAndPrivacyPolicy;

  /// No description provided for @commonFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get commonFullName;

  /// No description provided for @commonEnterYourFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get commonEnterYourFullName;

  /// No description provided for @commonEnterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get commonEnterYourPhoneNumber;

  /// No description provided for @commonByCreatingAnAccountYouAgreeToOurTermsOfServiceAndPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'By Creating An Account You Agree To Our Terms Of Service And Privacy Policy'**
  String
      get commonByCreatingAnAccountYouAgreeToOurTermsOfServiceAndPrivacyPolicy;

  /// No description provided for @commonPostNewAd.
  ///
  /// In en, this message translates to:
  /// **'Post New Ad'**
  String get commonPostNewAd;

  /// No description provided for @commonPhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get commonPhotos;

  /// No description provided for @commonAddUpTo10Photos.
  ///
  /// In en, this message translates to:
  /// **'Add up to 10 photos'**
  String get commonAddUpTo10Photos;

  /// No description provided for @commonAddPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get commonAddPhoto;

  /// No description provided for @commonCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get commonCategory;

  /// No description provided for @commonEnterYourCategory.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get commonEnterYourCategory;

  /// No description provided for @commonRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get commonRegion;

  /// No description provided for @commonEnterYourRegion.
  ///
  /// In en, this message translates to:
  /// **'Select a region'**
  String get commonEnterYourRegion;

  /// No description provided for @commonTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get commonTitle;

  /// No description provided for @commonEnterYourTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter ad title'**
  String get commonEnterYourTitle;

  /// No description provided for @commonPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get commonPrice;

  /// No description provided for @commonEnterYourPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter price'**
  String get commonEnterYourPrice;

  /// No description provided for @commonDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get commonDescription;

  /// No description provided for @commonEnterYourDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter ad description'**
  String get commonEnterYourDescription;

  /// No description provided for @commonClearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get commonClearFilters;

  /// No description provided for @commonFilters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get commonFilters;

  /// No description provided for @commonSelectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get commonSelectRegion;

  /// No description provided for @commonAllRegions.
  ///
  /// In en, this message translates to:
  /// **'All Regions'**
  String get commonAllRegions;

  /// No description provided for @commonPriceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get commonPriceRange;

  /// No description provided for @commonMin.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get commonMin;

  /// No description provided for @commonMax.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get commonMax;

  /// No description provided for @commonApplyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get commonApplyFilters;

  /// No description provided for @commonAdNotFound.
  ///
  /// In en, this message translates to:
  /// **'Ad not found'**
  String get commonAdNotFound;

  /// No description provided for @commonErrorLoadingAd.
  ///
  /// In en, this message translates to:
  /// **'Error loading ad details'**
  String get commonErrorLoadingAd;

  /// No description provided for @commonCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get commonCall;

  /// No description provided for @commonChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get commonChat;

  /// No description provided for @commonMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get commonMemberSince;

  /// No description provided for @commonViewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get commonViewProfile;

  /// No description provided for @commonReply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get commonReply;

  /// No description provided for @commonReplies.
  ///
  /// In en, this message translates to:
  /// **'Replies'**
  String get commonReplies;

  /// No description provided for @commonAddReply.
  ///
  /// In en, this message translates to:
  /// **'Add Reply'**
  String get commonAddReply;

  /// No description provided for @commonFailedToLoadReplies.
  ///
  /// In en, this message translates to:
  /// **'Failed to load replies'**
  String get commonFailedToLoadReplies;

  /// No description provided for @commonLoadMoreReplies.
  ///
  /// In en, this message translates to:
  /// **'Load more replies'**
  String get commonLoadMoreReplies;

  /// No description provided for @commonItems.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get commonItems;

  /// No description provided for @commonYear.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get commonYear;

  /// No description provided for @commonYears.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get commonYears;

  /// No description provided for @commonAgo.
  ///
  /// In en, this message translates to:
  /// **'ago'**
  String get commonAgo;

  /// No description provided for @commonMonth.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get commonMonth;

  /// No description provided for @commonMonths.
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get commonMonths;

  /// No description provided for @commonWeek.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get commonWeek;

  /// No description provided for @commonWeeks.
  ///
  /// In en, this message translates to:
  /// **'weeks'**
  String get commonWeeks;

  /// No description provided for @commonDay.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get commonDay;

  /// No description provided for @commonDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get commonDays;

  /// No description provided for @commonHour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get commonHour;

  /// No description provided for @commonHours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get commonHours;

  /// No description provided for @commonMinute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get commonMinute;

  /// No description provided for @commonMinutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get commonMinutes;

  /// No description provided for @commonRecently.
  ///
  /// In en, this message translates to:
  /// **'Recently'**
  String get commonRecently;

  /// No description provided for @commonMain.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get commonMain;

  /// No description provided for @commonAdDetails.
  ///
  /// In en, this message translates to:
  /// **'Ad Details'**
  String get commonAdDetails;

  /// No description provided for @commonPostAd.
  ///
  /// In en, this message translates to:
  /// **'Post Ad'**
  String get commonPostAd;

  /// No description provided for @commonErrorLoadingFollowedUsers.
  ///
  /// In en, this message translates to:
  /// **'Error loading followed users'**
  String get commonErrorLoadingFollowedUsers;

  /// No description provided for @commonTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get commonTryAgain;

  /// No description provided for @commonNotFollowingAnyone.
  ///
  /// In en, this message translates to:
  /// **'Not following anyone'**
  String get commonNotFollowingAnyone;

  /// No description provided for @commonStartFollowingOtherUsers.
  ///
  /// In en, this message translates to:
  /// **'Start following other users'**
  String get commonStartFollowingOtherUsers;

  /// No description provided for @commonUnfollowUser.
  ///
  /// In en, this message translates to:
  /// **'Unfollow User'**
  String get commonUnfollowUser;

  /// No description provided for @commonAreYouSureYouWantToUnfollowThisUser.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unfollow this user?'**
  String get commonAreYouSureYouWantToUnfollowThisUser;

  /// No description provided for @commonUnfollow.
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get commonUnfollow;

  /// No description provided for @footerDescription.
  ///
  /// In en, this message translates to:
  /// **'Top Classified Site in Gulf. Post free ads. Buy and sell used cars, apartment for rent, search jobs and more cheap quality items in Gulf'**
  String get footerDescription;

  /// No description provided for @footerSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get footerSupport;

  /// No description provided for @footerHelp.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get footerHelp;

  /// No description provided for @footerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get footerAbout;

  /// No description provided for @footerContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get footerContact;

  /// No description provided for @footerPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get footerPrivacy;

  /// No description provided for @footerTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get footerTerms;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'Copyright © 2025 Sahal. All rights reserved.'**
  String get footerCopyright;

  /// No description provided for @footerDownloadApp.
  ///
  /// In en, this message translates to:
  /// **'Download Sahal App free'**
  String get footerDownloadApp;

  /// No description provided for @footerQuickLinks.
  ///
  /// In en, this message translates to:
  /// **'Quick Links'**
  String get footerQuickLinks;

  /// No description provided for @authSignInTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get authSignInTitle;

  /// No description provided for @authSignUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authSignUpTitle;

  /// No description provided for @authDontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get authDontHaveAccount;

  /// No description provided for @authAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authAlreadyHaveAccount;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authSignIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUp;

  /// No description provided for @authPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get authPhoneNumber;

  /// No description provided for @authContinueWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone'**
  String get authContinueWithPhone;

  /// No description provided for @authEnterOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get authEnterOTP;

  /// No description provided for @authOTPSentTo.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit code to'**
  String get authOTPSentTo;

  /// No description provided for @authResendOTP.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get authResendOTP;

  /// No description provided for @authVerifyOTP.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get authVerifyOTP;

  /// No description provided for @authResendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String authResendIn(int seconds);

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get chatTitle;

  /// No description provided for @chatNewMessage.
  ///
  /// In en, this message translates to:
  /// **'new message(s)'**
  String get chatNewMessage;

  /// No description provided for @chatNoChats.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet'**
  String get chatNoChats;

  /// No description provided for @chatNoChatsDesc.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation by contacting a seller'**
  String get chatNoChatsDesc;

  /// No description provided for @chatSearchChats.
  ///
  /// In en, this message translates to:
  /// **'Search conversations'**
  String get chatSearchChats;

  /// No description provided for @chatLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading conversations...'**
  String get chatLoading;

  /// No description provided for @chatNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get chatNow;

  /// No description provided for @chatNoMessages.
  ///
  /// In en, this message translates to:
  /// **'No Messages'**
  String get chatNoMessages;

  /// No description provided for @chatStartConversation.
  ///
  /// In en, this message translates to:
  /// **'Start Conversation'**
  String get chatStartConversation;

  /// No description provided for @chatTypeToStart.
  ///
  /// In en, this message translates to:
  /// **'Type To Start'**
  String get chatTypeToStart;

  /// No description provided for @chatMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String chatMinutesAgo(int minutes);

  /// No description provided for @chatHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String chatHoursAgo(int hours);

  /// No description provided for @chatYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get chatYesterday;

  /// No description provided for @chatDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String chatDaysAgo(int days);

  /// No description provided for @chatTyping.
  ///
  /// In en, this message translates to:
  /// **'typing...'**
  String get chatTyping;

  /// No description provided for @chatTypeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get chatTypeMessage;

  /// No description provided for @chatTapToStartConversation.
  ///
  /// In en, this message translates to:
  /// **'Tap to start conversation'**
  String get chatTapToStartConversation;

  /// No description provided for @adPostTitle.
  ///
  /// In en, this message translates to:
  /// **'Post Your Ad'**
  String get adPostTitle;

  /// No description provided for @adTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get adTitle;

  /// No description provided for @adDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get adDescription;

  /// No description provided for @adCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get adCategory;

  /// No description provided for @adSubcategory.
  ///
  /// In en, this message translates to:
  /// **'Subcategory'**
  String get adSubcategory;

  /// No description provided for @adPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get adPrice;

  /// No description provided for @adLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get adLocation;

  /// No description provided for @adImages.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get adImages;

  /// No description provided for @adAddImages.
  ///
  /// In en, this message translates to:
  /// **'Add Images'**
  String get adAddImages;

  /// No description provided for @adDragDropImages.
  ///
  /// In en, this message translates to:
  /// **'Drag & drop images here or click to browse'**
  String get adDragDropImages;

  /// No description provided for @adMaxImages.
  ///
  /// In en, this message translates to:
  /// **'Maximum 10 images allowed'**
  String get adMaxImages;

  /// No description provided for @adSubmit.
  ///
  /// In en, this message translates to:
  /// **'Post Ad'**
  String get adSubmit;

  /// No description provided for @adEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Ad'**
  String get adEdit;

  /// No description provided for @adUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update Ad'**
  String get adUpdate;

  /// No description provided for @adDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Ad'**
  String get adDelete;

  /// No description provided for @adViews.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get adViews;

  /// No description provided for @adLikes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get adLikes;

  /// No description provided for @adPostedBy.
  ///
  /// In en, this message translates to:
  /// **'Posted by'**
  String get adPostedBy;

  /// No description provided for @adMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get adMemberSince;

  /// No description provided for @adSimilarAds.
  ///
  /// In en, this message translates to:
  /// **'Similar Ads'**
  String get adSimilarAds;

  /// No description provided for @adComments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get adComments;

  /// No description provided for @adAddComment.
  ///
  /// In en, this message translates to:
  /// **'Add a comment'**
  String get adAddComment;

  /// No description provided for @adContactSeller.
  ///
  /// In en, this message translates to:
  /// **'Contact Seller'**
  String get adContactSeller;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileTitle;

  /// No description provided for @profileMyAds.
  ///
  /// In en, this message translates to:
  /// **'My Ads'**
  String get profileMyAds;

  /// No description provided for @profileFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get profileFavorites;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @profileEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditProfile;

  /// No description provided for @profileName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileName;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// No description provided for @profilePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profilePhone;

  /// No description provided for @profileSave.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get profileSave;

  /// No description provided for @profileChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get profileChangeLanguage;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotifications;

  /// No description provided for @profilePrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get profilePrivacy;

  /// No description provided for @profileAbout.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get profileAbout;

  /// No description provided for @profileTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get profileTerms;

  /// No description provided for @profileMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get profileMarkAllRead;

  /// No description provided for @profileNoNotifications.
  ///
  /// In en, this message translates to:
  /// **'NO Notifications'**
  String get profileNoNotifications;

  /// No description provided for @profileYoullSeeNotificationsHereWhenYouGetThem.
  ///
  /// In en, this message translates to:
  /// **'You\'ll see Notifications here when you get them'**
  String get profileYoullSeeNotificationsHereWhenYouGetThem;

  /// No description provided for @profileHelp.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileHelp;

  /// No description provided for @profileFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get profileFollowing;

  /// No description provided for @profileUserProfile.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get profileUserProfile;

  /// No description provided for @profileUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get profileUserNotFound;

  /// No description provided for @profileErrorLoadingProfile.
  ///
  /// In en, this message translates to:
  /// **'Error loading profile'**
  String get profileErrorLoadingProfile;

  /// No description provided for @profileUnfollowUser.
  ///
  /// In en, this message translates to:
  /// **'Unfollow User'**
  String get profileUnfollowUser;

  /// No description provided for @profileAreYouSureYouWantToUnfollow.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to unfollow this user?'**
  String get profileAreYouSureYouWantToUnfollow;

  /// No description provided for @profileUnfollow.
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get profileUnfollow;

  /// No description provided for @profileFollowers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get profileFollowers;

  /// No description provided for @profileUserAds.
  ///
  /// In en, this message translates to:
  /// **'User Ads'**
  String get profileUserAds;

  /// No description provided for @profileNoAdsPostedYet.
  ///
  /// In en, this message translates to:
  /// **'No ads posted yet'**
  String get profileNoAdsPostedYet;

  /// No description provided for @profileFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get profileFollow;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
