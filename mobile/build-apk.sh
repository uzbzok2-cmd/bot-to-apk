#!/bin/bash
# ====================================================
# Ustoz AI - Android APK Build Script
# ====================================================
# Bu skriptni lokal kompyuteringizda ishga tushiring
# (Node.js 18+ va internet kerak)
# ====================================================

set -e

echo "🚀 Ustoz AI APK Build boshlanyapti..."

# Token tekshirish
if [ -z "$EXPO_TOKEN" ]; then
  echo "❌ EXPO_TOKEN o'rnatilmagan!"
  echo "   export EXPO_TOKEN=WujVkh3dmKk6mtPL3cZwhEQt2sOsA_QrEZaJlFiA"
  exit 1
fi

# EAS CLI o'rnatish
echo "📦 EAS CLI tekshirish..."
if ! command -v eas &> /dev/null; then
  echo "📥 EAS CLI o'rnatilmoqda..."
  npm install -g eas-cli
fi

# Dependencies
echo "📥 Dependencies o'rnatilmoqda..."
npm install --legacy-peer-deps

# Login tekshirish
echo "🔐 Expo akkauntga kirish..."
eas whoami

# Build boshlash
echo "🔨 Android APK build boshlanmoqda..."
echo "   (Build Expo serverlarida ishlaydi, kutib turing...)"
eas build --platform android --profile preview --non-interactive

echo ""
echo "✅ Build muvaffaqiyatli boshlandi!"
echo "📱 APK yuklab olish: https://expo.dev/accounts/alibek2000/projects/ustoz-ai/builds"
