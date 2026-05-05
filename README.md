# Health Data Logger (iOS)

A SwiftUI-based mobile app for logging health, activity, and sleep data, with support for structured export and AI-style insights.

## Features

- Log health, activity, and sleep entries
- Categorized data input (Health / Activity / Sleep)
- Dynamic list of entries
- JSON export using native iOS ShareLink
- Rule-based AI insight generation based on user data patterns

## AI Insight Feature (v2)

This app includes a rule-based insight system that analyzes logged data and generates feedback.

Examples:
- If sleep logs are low → prompts user to track sleep more
- If activity is high → suggests increasing intensity
- Balanced logs → encourages consistency

This is designed as a foundation for future integration with generative AI models.

## Example Entry Format


[Sleep] - slept 8 hours
[Activity] - ran 3 miles
[Health] - headache level 2


## Tech Stack

- Swift
- SwiftUI
- Xcode

## Next Steps

- Add persistent storage
- Add trend-based analysis
- Integrate generative AI via backend
- Improve UI/UX

## Author

Abdallah El Hamawi
