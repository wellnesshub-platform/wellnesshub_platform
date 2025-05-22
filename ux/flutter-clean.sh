#!/bin/bash

echo "⚙️  Resetting Flutter iOS Build Environment..."

# Navigate to project root
cd "$(dirname "$0")"

echo "📂 Navigating to: $(pwd)"

# Step 1: Full clean
echo "🧹 Cleaning project..."
flutter clean
rm -rf ios/Pods ios/Podfile.lock ios/.symlinks ios/Flutter ios/Runner.xcworkspace
rm -rf build .dart_tool

# Step 2: Restore missing configs
echo "📦 Running flutter pub get..."
flutter pub get

echo "🔧 Recreating iOS folder structure (safe)..."
flutter create .

# Step 3: Install CocoaPods (run from Rosetta-enabled terminal)
echo "📦 Installing CocoaPods..."
cd ios
pod install
cd ..

# Step 4: Reminder
echo "✅ Done. Optional: open ios/Runner.xcworkspace in Xcode for indexing."
echo "🚀 Run 'flutter run' now or build from Xcode."
