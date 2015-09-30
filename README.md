# epoch-converter package

This package converts any selected Unix timestamp text into UTC, ISO and Time String human readable format.

It can display the date converted as a notification or replace the text in-place.

Currently, there are three supported formats: UTC, Time String and ISO.

The prefix for this command is `ctrl-alt-e`. This can be used in combination with the letters `i`, `u` and  `d` for displaying the time and combining `ctrl` with those letters for replacing text.

  For ISO format:
  - `ctrl-alt-e i`: Display date in ISO format.
  - `ctrl-alt-e ctrl-i`: Replace selection with date in ISO format.

For UTC format:
  - `ctrl-alt-e u`: Display date in UTC format.
  - `ctrl-alt-e ctrl-u`: Replace selection with date in UTC format.

For Date String format:
  - `ctrl-alt-e d`: Display date in Date String format.
  - `ctrl-alt-e ctrl-d`: Replace selection with date in Date String format.
