#!/bin/bash
set -e

# Define colors for echo output
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m"  # No Color

##########################
# Usage and Argument Parsing
##########################
usage() {
  echo -e "${BLUE}Usage: $0 [--icon] [--splash] [--rename]${NC}"
  echo -e "${BLUE}  --icon    Run only the launcher icon generation process${NC}"
  echo -e "${BLUE}  --splash  Run only the native splash screen creation process${NC}"
  echo -e "${BLUE}  --rename  Run only the package renaming process${NC}"
  echo -e "${BLUE}If no flags are provided, all processes will be executed.${NC}"
}

# Default: run all processes if no flags are provided.
RUN_ICON=false
RUN_SPLASH=false
RUN_RENAME=false

if [ "$#" -eq 0 ]; then
  RUN_ICON=true
  RUN_SPLASH=true
  RUN_RENAME=true
else
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --icon)   RUN_ICON=true ;;
      --splash) RUN_SPLASH=true ;;
      --rename) RUN_RENAME=true ;;
      --help|-h)
        usage
        exit 0 ;;
      *)
        echo -e "${RED}Unknown option: $1${NC}"
        usage
        exit 1 ;;
    esac
    shift
  done
fi

##########################
# Preliminaries
##########################
if [ ! -f pubspec.yaml ]; then
  echo -e "${RED}Error: pubspec.yaml not found!${NC}"
  exit 1
fi

# Backup pubspec.yaml
cp pubspec.yaml pubspec.yaml.bak
echo -e "${YELLOW}📄 Backed up pubspec.yaml to pubspec.yaml.bak${NC}"

if [ ! -f setup.yaml ]; then
  echo -e "${RED}Error: setup.yaml not found!${NC}"
  exit 1
fi

##########################
# Reusable Function for 'flutter pub get'
##########################
run_pub_get() {
  echo -e "${YELLOW}⏳⏳ Running flutter pub get...${NC} ⏳⏳"
  flutter pub get
}

##########################
# Function Definitions
##########################

run_icon() {
  echo -e "${GREEN}🔧 [Icon Process] Start${NC}"
  local ICON_ADDED=false
  if ! grep -q "flutter_launcher_icons:" pubspec.yaml; then
    echo -e "${YELLOW}➕ Adding flutter_launcher_icons to dev_dependencies...${NC}"
    flutter pub add flutter_launcher_icons -d
    ICON_ADDED=true
  else
    echo -e "${BLUE}ℹ flutter_launcher_icons already present.${NC}"
  fi

  run_pub_get

  echo -e "${GREEN}🎨 Generating launcher icons...${NC}"
  dart run flutter_launcher_icons -f setup.yaml

  if [ "$ICON_ADDED" = true ]; then
    echo -e "${YELLOW}➖ Removing flutter_launcher_icons from dev_dependencies...${NC}"
    flutter pub remove flutter_launcher_icons
  fi
  echo -e "${GREEN}✅ [Icon Process] Complete${NC}"
}

run_splash() {
  echo -e "${GREEN}🚀 [Splash Process] Start${NC}"
  local SPLASH_ADDED=false
  if ! grep -q "flutter_native_splash:" pubspec.yaml; then
    echo -e "${YELLOW}➕ Adding flutter_native_splash to dependencies...${NC}"
    flutter pub add flutter_native_splash
    SPLASH_ADDED=true
  else
    echo -e "${BLUE}ℹ flutter_native_splash already present.${NC}"
  fi

  run_pub_get

  echo -e "${YELLOW}♻ Removing previous native splash screen...${NC}"
  dart run flutter_native_splash:remove --path=setup.yaml

  echo -e "${GREEN}🎨 Generating native splash screen...${NC}"
  dart run flutter_native_splash:create --path=setup.yaml

  echo -e "${GREEN}✅ [Splash Process] Complete${NC}"
}

run_rename() {
  echo -e "${GREEN}📦 [Rename Process] Start${NC}"
  local RENAME_ADDED=false
  if ! grep -q "package_rename:" pubspec.yaml; then
    echo -e "${YELLOW}➕ Adding package_rename to dev_dependencies...${NC}"
    flutter pub add package_rename -d
    RENAME_ADDED=true
  else
    echo -e "${BLUE}ℹ package_rename already present.${NC}"
  fi

  run_pub_get

  echo -e "${GREEN}📝 Renaming package...${NC}"
  dart run package_rename --path=setup.yaml

  if [ "$RENAME_ADDED" = true ]; then
    echo -e "${YELLOW}➖ Removing package_rename from dev_dependencies...${NC}"
    flutter pub remove package_rename
  fi
  echo -e "${GREEN}✅ [Rename Process] Complete${NC}"
}

cleanup() {
  echo -e "${YELLOW}🧹 Cleaning up...${NC}"
  if [ -f pubspec.yaml.bak ]; then
    rm pubspec.yaml.bak
    echo -e "${YELLOW}🗑️ Removed pubspec.yaml.bak${NC}"
  fi
}

##########################
# Main Execution
##########################

if [ "$RUN_ICON" = true ]; then
  run_icon
fi

if [ "$RUN_SPLASH" = true ]; then
  run_splash
fi

if [ "$RUN_RENAME" = true ]; then
  run_rename
fi

echo -e "${YELLOW}🧹🧹 Running flutter clean...${NC} 🧹🧹"
flutter clean

run_pub_get

cleanup

echo -e "${GREEN}🎉🎉🎉 All selected processes completed successfully!${NC} 🎉🎉🎉"
