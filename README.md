# LivitaTestTask

iOS test task — SwiftUI app with two screens: **Home** (tool cards + tab bar) and **Result** (before/after slider).

## Requirements

- macOS with **Xcode 16+** (project targets iOS 26.2)
- iOS Simulator or a physical iPhone

## How to Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd LivitaTestTask
   ```

2. Open the project in Xcode:
   ```bash
   open LivitaTestTask.xcodeproj
   ```

3. **Signing (first launch only)**
   - Select the **LivitaTestTask** target → **Signing & Capabilities**
   - Enable **Automatically manage signing**
   - Choose your **Team** (Apple ID is enough for Simulator)

4. Select a simulator (e.g. **iPhone 16**) and press **⌘R** to build and run.

## Project Structure

```
LivitaTestTask/
├── Screens/
│   ├── Home/          Model, ViewModel, View
│   └── Result/        Model, View
├── Shared/            Theme, extensions, reusable components
└── Assets.xcassets/   Images and icons
```

## Screens

| Screen | Description |
|--------|-------------|
| **Home** | Scrollable tool cards, GET PRO header, floating tab bar |
| **Result** | Draggable before/after slider, Resize / Save / Regenerate buttons |

Navigation: tap any card on Home → Result screen.

Stub buttons (GET PRO, Profile, Gallery, Discover, action buttons) show a **Coming Later** alert.

## Notes

- UI-only prototype — no backend or persistence.
- If images are missing after clone, ensure all files inside `Assets.xcassets` are committed to git.
