# Task Plan: Add Loading State to PrimaryButton

## Goal
Port `LoadingButton` from `Yogakosh_native` into `AtmakoshiOSDesignSystem` by updating `PrimaryButton` to include full loading state support. After this, `LoadingButton` in the native app can be deleted and replaced with `PrimaryButton`.

## Status: PLANNING

---

## Phase 1: Update PrimaryButton in Design System
**File**: `Sources/AtmakoshDesignSystem/Components/Buttons/PrimaryButton.swift`

- [ ] Add `isLoading: Bool = false` property
- [ ] Update `init(title:action:)` to accept `isLoading` parameter
- [ ] Guard action call with `if !isLoading { action() }`
- [ ] Wrap button label content in `ZStack`
- [ ] Apply `.opacity(isLoading ? 0 : 1)` to `Text`
- [ ] Add `ProgressView()` with `.tint(theme.textPrimaryButton)` inside `ZStack`
- [ ] Move `.foregroundColor(theme.textPrimaryButton)` to `ZStack` level
- [ ] Update background fill to use `theme.primaryButton.opacity(isLoading ? 0.7 : 1)`
- [ ] Add `.disabled(isLoading)` modifier
- [ ] Update `PreviewProvider` to show both idle and loading states

## Phase 2: Migrate Yogakosh_native app
**File**: `Yogakosh_native/YogaKosh/UI/Components/LoadingButton.swift`

- [ ] Find all usages of `LoadingButton` in the native app
- [ ] Replace each usage with `PrimaryButton(title:isLoading:action:)`
- [ ] Delete `LoadingButton.swift`

---

## Decisions
- `isLoading` defaults to `false` so existing callers of `PrimaryButton` require no changes (backward compatible)
- The design system change should be published/tagged before migrating the native app

## Open Questions
- Should the loading state animation be customizable (spinner style/color), or is `theme.textPrimaryButton` sufficient?
- Should we bump the design system version after this change?
