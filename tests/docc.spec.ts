// @ts-check
import { test, expect } from '@playwright/test';

test('Base directory has combined content', async ({ page }) => {
    await page.goto('/documentation');

    // Expect a title "to contain" a substring.
    await expect(page).toHaveTitle(/example-docc-project/);

    // Expect the sidebar navigation to be available
    const sidebar = page.locator('.navigator-card');
    await expect(sidebar).toBeVisible();
    await expect(sidebar).toHaveText(/ExampleDocs/);
    await expect(sidebar).toHaveText(/SampleLibrary/);
});
    