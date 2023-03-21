# FlutterTsk
# Introduction:
In this document, we will explore how to create a to-do app using the Flutter framework and the BLoC pattern. We will also be incorporating the sqflite package to store and retrieve data from a local database. Additionally, we will be focusing on creating a user-friendly design and incorporating some animations to enhance the user experience.

This is a simple ToDo app built with the Flutter framework that uses the BLoC pattern and sqflite package to store and retrieve data from a local database. It also includes some cool animations to enhance the user experience.

### Features
* Add, edit, and delete tasks
* User-friendly design
* Animations

# Getting Started 
1- Clone Repository:
```ruby
git clone https://github.com/WosberbonDesu/FlutterTsk.git
```
2- Install dependencies:
```ruby
flutter pub get
```
3-Run the app:
```ruby
flutter run
```

# Dependencies
* **sqflite**: This package is used to store and retrieve data from a local database.
* **flutter_bloc**: This package is used to implement the BLoC pattern.
* **equatable**: This package is used to compare objects for equality.
* 
## Example Code Structure
The app is organized using the **BLoC** pattern. The lib directory contains the following directories:

* **bloc**: Contains the BLoC classes and events.
* **data**: Contains the data models and database provider.
* **ui**: Contains the UI components, screens, and widgets.

```python
lib/
  core/
      models/
        todo_item.dart
      bloc/
        todo_bloc.dart
        todo_event.dart
        todo_state.dart
  features/
      pages/
        home_page.dart
        add_item_page.dart
        edit_item_page.dart
      widgets/
        todo_item_widget.dart
        delete_confirmation_dialog.dart
      services/
        database_provider.dart
  main.dart
```
* **models** - contains the TodoItem model used to represent a to-do item
* **bloc** - contains the BLoC implementation for managing the state of the app
* **pages** - contains the pages of the app, including the home page, add item page, and edit item page
* **widgets** - contains the reusable widgets of the app, including the TodoItemWidget and DeleteConfirmationDialog
* **services** - contains the implementation for interacting with the local database
* **main.dart** - contains the entry point for the app


# Acknowledgements
This app was built using the Flutter framework and the **BLoC** pattern. The **sqflite** package was used to store and retrieve data from a local database. The app also incorporates some animations using the lottie package.
