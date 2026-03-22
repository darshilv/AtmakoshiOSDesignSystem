# Findings

## Button Comparison: PrimaryButton vs LoadingButton

### Source Files
- **PrimaryButton**: `AtmakoshiOSDesignSystem/Sources/AtmakoshDesignSystem/Components/Buttons/PrimaryButton.swift`
- **LoadingButton**: `Yogakosh_native/YogaKosh/UI/Components/LoadingButton.swift` (note: has a TODO comment to port back to design system)

---

### What PrimaryButton has
- `title: String` parameter
- `action: () -> Void` parameter
- `@Environment(\.theme)` support
- `Text(title)` with `.font(.headline)` and `.foregroundColor(theme.textPrimaryButton)`
- `.frame(maxWidth: .infinity)` and `.frame(height: 50)`
- Rounded rectangle background with `theme.primaryButton` fill
- `public` visibility (design system component)

### What LoadingButton adds (feature gaps)
1. **`isLoading: Bool = false` parameter** — controls the loading state
2. **Action guard**: `if !isLoading { action() }` — prevents double-taps while loading
3. **`ZStack` layout** — wraps title + spinner so the button maintains its size during state changes
4. **Title hidden when loading**: `.opacity(isLoading ? 0 : 1)` — preserves layout, hides text
5. **`ProgressView()` spinner** when loading, tinted with `theme.textPrimaryButton`
6. **Dimmed background when loading**: `theme.primaryButton.opacity(0.7)` vs full opacity
7. **`.disabled(isLoading)`** — SwiftUI disabled modifier when loading

### Minor structural differences
- `foregroundColor` is on the `ZStack` in LoadingButton (not on `Text` directly) — needed because `ZStack` contains both `Text` and `ProgressView`
- `LoadingButton` is `internal` (app-level); `PrimaryButton` is `public` (design system)

---

### Summary of required changes to PrimaryButton
| Change | Why |
|--------|-----|
| Add `isLoading: Bool = false` param | Expose loading state to callers |
| Update `init` to accept `isLoading` | API update |
| Guard action with `if !isLoading` | Prevent actions firing while loading |
| Wrap content in `ZStack` | Stable sizing during loading/idle transition |
| Hide title with `.opacity()` when loading | Keep layout, show spinner |
| Add `ProgressView()` tinted to text color | Visual loading indicator |
| Move `.foregroundColor` to `ZStack` level | Applies to both Text and ProgressView |
| Reduce background opacity to 0.7 when loading | Visual feedback that button is inactive |
| Add `.disabled(isLoading)` | Proper SwiftUI accessibility/interaction state |
