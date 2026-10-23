# License

This project uses different license terms for different parts of it. Read
the section that applies to the part you're interested in.

---

## 1. Addon Code and Custom Art (All Rights Reserved)

Applies to all `.lua`, `.toc`, `.xml` files and custom artwork, except the
bundled fonts covered in section 2 below.

Copyright (c) 2026 Xal. All rights reserved.

This code and artwork may not be copied, redistributed, modified, or reused
in another project, in whole or in part, without explicit permission from
the author. If you'd like to use, adapt, or build on any of it, ask first.

---

## 2. Bundled Fonts

`Fonts/Cinzel-Bold.ttf` (Cinzel Bold), `Fonts/Inter-Regular.ttf` and
`Fonts/Inter-SemiBold.ttf` (Inter) are licensed under the SIL Open Font
License, not the terms above — see `Fonts/Cinzel-LICENSE.txt` and
`Fonts/Inter-LICENSE.txt` for the full text. They're redistributed here
exactly as their own licenses permit.

`Fonts/CustomFont.ttf` (Simply Sans Bold) and `Fonts/FiraSans-Medium.ttf`
(Fira Sans Medium) are also SIL Open Font License fonts — see
`Fonts/SimplySans-LICENSE.txt` and `Fonts/FiraSans-LICENSE.txt`. They're no
longer used by any code in this addon (superseded by the Cinzel/Inter pair
above) but remain bundled and covered by the same terms.

---

## 3. Bundled Vendor Location Data

`VendorLocations.lua` is third-party data, not this addon's own work — extracted
from VendorMap (Andrew Defee), MIT licensed. Only the factual coordinate data
(npcID/mapID/x/y/type) is reused, not VendorMap's own code or UI. The
required copyright/license notice is carried in the file's own header.
Shared verbatim across Xal's addons that need vendor coordinates (also used
by Xal's Armoire) rather than re-researched per addon.

---

## 4. Bundled Mount Rarity Library

`libs/MountsRarity` is MountsRarity by Sören Gade (sgade), licensed under the
GNU General Public License v3 — see `libs/MountsRarity/LICENSE` for the full
text. Its rarity data comes from Data for Azeroth. It's bundled as the author
invites other addons to do, and stays under its own license, not the terms in
section 1.

---

## Summary

| Content | License | Can I fork/reuse it? |
|---|---|---|
| Addon code and custom art | All Rights Reserved | No — ask the author first |
| `Fonts/Cinzel-Bold.ttf` | SIL Open Font License | Yes — under the OFL's terms |
| `Fonts/Inter-Regular.ttf` | SIL Open Font License | Yes — under the OFL's terms |
| `Fonts/Inter-SemiBold.ttf` | SIL Open Font License | Yes — under the OFL's terms |
| `Fonts/CustomFont.ttf` | SIL Open Font License | Yes — under the OFL's terms |
| `Fonts/FiraSans-Medium.ttf` | SIL Open Font License | Yes — under the OFL's terms |
| `VendorLocations.lua` | MIT License (VendorMap) | Yes — under the MIT terms |
| `libs/MountsRarity` | GNU GPL v3 (MountsRarity) | Yes — under the GPL's terms |
