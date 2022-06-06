# Comic Vine App

Responsive App with display of latest issues fetched from ComicVine API.  
Using BLoC library as State Managment and BLoC Design Architecture.

## Local Web Deployment - Chrome Navigator - CORS

Fetching from Flutter's local Chrome emulator raises an XMLHTTPRequest error.  
To bypass this, see this [thread](https://stackoverflow.com/questions/71157863/dart-flutter-http-request-raises-xmlhttprequest-error).

### Future ToDos

- Unit Testing
- Use Client and Repository as packages.
- UI Tuning (Themes, Fonts, etc)
- Add publisher filter functionality for last issues.

#### Security

APIKey is hardcoded just for the sake of simplicity to the ones checking the App.  
Should be placed inside asset folder as JSON file and git ignored when uploaded to repo.  
If anyone decides to check the App, they should generate their own APIKey and modify said JSON file.
