# Changelog

## [2.0.5] - 2026-07-21

### Fixed

- Correct some item prperties for Class-Based Properties which were miscalculated and did not have the intended effect.

## [2.0.4] - 2026-07-11

### Fixed

- Correct script error which prevented player from attuning crystal with Class-Based Properties.

# Changelog

## [2.0.3] - 2026-07-09

### Changed

- Adjust installation instructions for Class-Based Properties to prevent adding redundant rows to upgrade.2da if the mod is installed more than once.

## [2.0.2] - 2026-07-04

### Fixed

- Add some item properties which were missing for Class-Based Properties; a bug caused some values to always be 0 instead of incrementing by level.

## [2.0.1] - 2026-07-04

### Fixed

- Correct scripts for Class-Based Properties, which were missing the class-based code (whoops). One of the files was accidentally overwritten with the one for the regular properties.

## [2.0.0] - 2026-06-22

### Changed

- Adjust the condition for allowing the player to attune the crystal. The player will be able to attune the crystal in the final act of the game, or earlier by passing a Wisdom check after crafting a lightsaber and observing Kreia attune the crystal.
- Change the way the Workbench dialogue is installed. This will simplify compatibility in some respects, although there are tradeoffs.

### Fixed

- Make it so only the player can examine the player's crystal (duh).

## [1.1.0] - 2025-02-12

### Fixed

- Fix a bug with the non-class-based installation options that prevented the crystal from spawning.