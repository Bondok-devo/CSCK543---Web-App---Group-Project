# 🍳 Savory Spoon - QA/Validation findings / fixes.

TODO (optional). Update css to increase space between search bar on results.php and tiles. (scoped css?)


Savoury spoon site validation

1.	Recipe tiles are touching the search box. When hovered, part of the recipe tile covers a portion of the search box.
Informational/minor
Category: UI-Visual
Action required: Optional
 

2.	Sign in and register does not return an error if a non-email input is submitted.
Severity: Informational/minor
Category: Input Validation (Client side)
Action required: Optional
Fix:
Disable HTML5 validation to allow PHP to handle error checking
 

3.	Favicon.ico is not present
Severity: Informational/minor
Category: UI / Cosmetic
Action required: Optional
Fix: Add favicon.ico file

4.	Login.php Line 35 appears to contain a troubleshooting note
Severity: Informational/minor
Category: Code Quality / Documentation
Fix: Removed note
 

5.	Register.php Line 29 uses the American spelling of ‘sanitise’
Fix: changed to English/GB spelling







Checks passed:
XSS/SQLi & directory traversal in Search box, login & registration fields
Viewport and zoom

