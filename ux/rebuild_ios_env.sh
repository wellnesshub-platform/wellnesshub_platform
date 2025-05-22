#!/bin/bash

echo "🧹 Cleaning Flutter build..."
flutter clean
rm -rf ios/Pods ios/Podfile.lock ios/Flutter ios/Runner.xcworkspace ios/.symlinks build .dart_tool

echo "📦 Getting Flutter dependencies..."
flutter pub get

echo "🔧 Recreating missing iOS configs..."
flutter create .

echo "📂 Reinstalling CocoaPods..."
cd ios
rm -rf Podfile.lock Pods .symlinks
pod install
cd ..

echo "✅ Rebuild ready. Now open Runner.xcworkspace in Xcode if needed."
echo "▶️  Run: flutter run"
