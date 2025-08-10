# Core Widgets

This directory contains reusable UI components that follow clean architecture principles.

## Components

### DrawerMenuItem
A reusable component for drawer menu items with consistent styling and behavior.

**Features:**
- Consistent selected/unselected states
- Customizable colors and icons
- Built-in tap handling

**Usage:**
```dart
DrawerMenuItem(
  icon: Icons.home,
  title: "Home",
  isSelected: currentPage == 'home',
  onTap: () {
    // Handle tap
  },
)
```

### AppDrawerHeader
A standardized drawer header component with logo, title, and description.

**Features:**
- Network image with error fallback
- Consistent theming
- Responsive text overflow handling

### ThemeToggleItem
A theme toggle component integrated with ThemeCubit.

**Features:**
- Automatic theme state listening
- Switch and tap handling
- Localized text support

### LogoutMenuItem
A logout menu item with confirmation dialog.

**Features:**
- Built-in confirmation dialog
- Customizable callback
- Localized text support

## Navigation Service

Located in `core/services/navigation_service.dart`, provides utility methods for:
- Route-based navigation
- Page name extraction from routes
- Consistent navigation patterns

## Benefits

1. **DRY Principle**: Eliminates code duplication
2. **Consistency**: Ensures uniform UI across the app
3. **Maintainability**: Changes in one place affect all instances
4. **Testability**: Individual components can be tested independently
5. **Clean Architecture**: Proper separation of concerns
