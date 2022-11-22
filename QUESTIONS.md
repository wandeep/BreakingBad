#  Questions

## 1. What (if any) further additions would you like to make to your submission if you had more time?

## 2. Is there anything you would change about your current implementation?


# Answers

## 1. If I had more time I would like to add the following:

- Add more error handling - for example, when there is no network connectivity, or if the API request fails etc. Currently there is only basic logging in place for most errors. It would be better to handle these types of errors with appropriate feedback to the user.

- Improve the UI/UX design - due to time constraints, the UI is very basic with a Characters List view and Character Detail view. The UX to like/un-like characters in the list view could be improved - currently it is using a swipe gesture on the character row cell to reveal the `heart` button to toggle liking/un-liking the character. The detail view could be improved to include more information for the selected character, presented in a more visually pleasing manner.

- Improve performance  - introduce pagination support for the API requests, currently all the characters are requested in a single request. This could be improved by only requesting a subset of characters (i.e. enough to populate the current screen) and then fetching more characters as needed, as the user scrolls down the list.
 
 - Replace current local persistence - instead of using UserDefaults to store the favourited character ids, a more suitable persistence mechanism could be used (e.g. Core Data)
 
 - Add search functionality to the characters list view - this could be a search text field at the top of the list which would automatically filter the list depending on the search term entered.

- Add localisation - replace hardcoded strings with localised strings to support multiple languages/locales.

- Add more tests (both Unit and UI) - add tests around the WebService, using stubbed JSON responses to test different scenarios (e.g. invalid JSON responses). Add UI tests, potentially Snapshot Tests which could help detect regressions in the UI. 

## 2. Is there anything you would change about your current implementation?

- Consider switching to a Clean Architecture approach to improve separation of concerns, de-coupling and testability. Introduce Presentation, Domain and Data layers with appropriate interfaces (protocols) to help with SOLID principles.

- Introduce design language to ensure the UI is consistent, for example a colour palette, font sizes and styles etc.
