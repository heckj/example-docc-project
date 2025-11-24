import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
    testDir: './playwright-tests',
    fullyParallel: true,
    forbidOnly: !!process.env.CI,
    retries: process.env.CI ? 2 : 0,
    workers: process.env.CI ? 1 : undefined,
    reporter: 'html',
    use: {
        baseURL: 'http://localhost:4000/documentation',
        trace: 'on-first-retry',
    },
    projects: [
        {
            name: 'webkit',
            use: { browserName: 'webkit' },
        },
    ],
    webServer: {
        command: './scripts/build-and-serve.sh',
        url: 'http://localhost:4000/documentation',
        reuseExistingServer: true,
        stdout: 'pipe',
        stderr: 'pipe',
        timeout: 120 * 1000,
    },
});
