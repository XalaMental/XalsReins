# Xal's Reins

A mount tracker that shows every mount in the game and how to get it.

The mount journal tells you what you own. It's far less helpful when what you
actually want to know is what you're *missing*, and what you'd have to do to
get it. Xal's Reins puts the whole roster in one place — collected and
uncollected together — with the real source for each one.

## Features

- Every mount in the game in one list, collected and missing side by side.
- The real source per mount: drop and boss name, vendor and location, quest,
  achievement, or cost.
- Collection summary and a breakdown of how many mounts come from each source.
- Name search that tells you where the mount comes from.
- Faction-locked and not-usable-on-this-character mounts flagged rather than
  hidden.

No external database ships with the addon — everything is read live from the
game's own mount journal, so it can't go out of date.

## Commands

| Command | What it does |
|---|---|
| `/xro` | Collection summary |
| `/xro sources` | Mounts grouped by how they're obtained |
| `/xro find <name>` | Look up a mount and how to get it |
| `/xro dump [n]` | Full detail for the first n mounts (default 5) |
| `/xro options` | Open the settings window |

## Installing

Install from CurseForge, or drop the `XalsReins` folder into
`World of Warcraft\_retail_\Interface\AddOns\`.

## License

All Rights Reserved — see [LICENSE.md](LICENSE.md). The two bundled fonts are
SIL Open Font License.
