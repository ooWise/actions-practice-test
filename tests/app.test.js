const { add } = require('../app');

// A simple script-based test that exits with code 1 if it fails
if (add(2, 3) !== 5) {
    console.error("❌ Test Failed!");
    process.exit(1);
} else {
    console.log("✅ Test Passed!");
    process.exit(0);
}