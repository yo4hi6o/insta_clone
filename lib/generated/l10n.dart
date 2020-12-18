// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `activities`
  String get activities {
    return Intl.message(
      'activities',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment..`
  String get addComment {
    return Intl.message(
      'Add Comment..',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get appTitle {
    return Intl.message(
      'Instagram',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want cancel?`
  String get cancelConfirm {
    return Intl.message(
      'Are you sure to want cancel?',
      name: 'cancelConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Photo`
  String get changeProfilePhoto {
    return Intl.message(
      'Change Profile Photo',
      name: 'changeProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Change to Dart Theme`
  String get changeToDarkTheme {
    return Intl.message(
      'Change to Dart Theme',
      name: 'changeToDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Change to Light Theme`
  String get changeToLightTheme {
    return Intl.message(
      'Change to Light Theme',
      name: 'changeToLightTheme',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete Comment`
  String get deleteComment {
    return Intl.message(
      'Delete Comment',
      name: 'deleteComment',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to delete your comment?`
  String get deleteCommentConfirm {
    return Intl.message(
      'Are you sure to want to delete your comment?',
      name: 'deleteCommentConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePost {
    return Intl.message(
      'Delete Post',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to delete your post?`
  String get deletePostConfirm {
    return Intl.message(
      'Are you sure to want to delete your post?',
      name: 'deletePostConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Your post has been updated.`
  String get deletePostSucceeded {
    return Intl.message(
      'Your post has been updated.',
      name: 'deletePostSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to update your profile?`
  String get editProfileConfirm {
    return Intl.message(
      'Are you sure to want to update your profile?',
      name: 'editProfileConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Profile edit failed.`
  String get editProfileFailed {
    return Intl.message(
      'Profile edit failed.',
      name: 'editProfileFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated.`
  String get editProfileSucceeded {
    return Intl.message(
      'Your profile has been updated.',
      name: 'editProfileSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPost {
    return Intl.message(
      'Edit Post',
      name: 'editPost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to want to update your post?`
  String get editPostConfirm {
    return Intl.message(
      'Are you sure to want to update your post?',
      name: 'editPostConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Post edit failed.`
  String get editPostFailed {
    return Intl.message(
      'Post edit failed.',
      name: 'editPostFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your post has been updated.`
  String get editPostSucceeded {
    return Intl.message(
      'Your post has been updated.',
      name: 'editPostSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Followings`
  String get followings {
    return Intl.message(
      'Followings',
      name: 'followings',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Input caption...`
  String get inputCaption {
    return Intl.message(
      'Input caption...',
      name: 'inputCaption',
      desc: '',
      args: [],
    );
  }

  /// `Add place`
  String get inputPlace {
    return Intl.message(
      'Add place',
      name: 'inputPlace',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get likes {
    return Intl.message(
      'Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `LocationName`
  String get locationName {
    return Intl.message(
      'LocationName',
      name: 'locationName',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to post?`
  String get postConfirm {
    return Intl.message(
      'Are you sure you want to post?',
      name: 'postConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Post Failed!`
  String get postFailed {
    return Intl.message(
      'Post Failed!',
      name: 'postFailed',
      desc: '',
      args: [],
    );
  }

  /// `Post Succeeded!`
  String get postSucceeded {
    return Intl.message(
      'Post Succeeded!',
      name: 'postSucceeded',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Select location info from below..`
  String get selectLocation {
    return Intl.message(
      'Select location info from below..',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Place`
  String get selectPlace {
    return Intl.message(
      'Select Place',
      name: 'selectPlace',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Sing In`
  String get signIn {
    return Intl.message(
      'Sing In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed.`
  String get signInFailed {
    return Intl.message(
      'Sign in failed.',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get signOutConfirm {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'signOutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `UnFollow`
  String get unFollow {
    return Intl.message(
      'UnFollow',
      name: 'unFollow',
      desc: '',
      args: [],
    );
  }

  /// `Processing...`
  String get underProcessing {
    return Intl.message(
      'Processing...',
      name: 'underProcessing',
      desc: '',
      args: [],
    );
  }

  /// `user`
  String get user {
    return Intl.message(
      'user',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Canceled by user.`
  String get userCansel {
    return Intl.message(
      'Canceled by user.',
      name: 'userCansel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Edit Information`
  String get editInfo {
    return Intl.message(
      'Edit Information',
      name: 'editInfo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}