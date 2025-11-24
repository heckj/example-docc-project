import { test, expect } from '@playwright/test';

test('Base directory has combined content', async ({ page }) => {
    await page.goto('/documentation');

    // Expect a title "to contain" a substring.
    await expect(page).toHaveTitle(/example-docc-project/);
});
