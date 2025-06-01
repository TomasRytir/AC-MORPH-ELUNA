![image](https://github.com/user-attachments/assets/7bfca321-00a9-49d8-ba6e-dd0cb084fc49)

# Morph NPC System for Eluna (AzerothCore 3.3.5a)

This system allows players to:
- **Spawn a temporary Morph NPC** (`999000`) via chat command
- **Change their character appearance** via a gossip menu
- **Persist morph appearance** across relogs using the characters table

---

## 🧩 Files Included

- `morph_npc.lua` – Gossip menu for morph selection, permanent storage using DB
- `morphspawn.lua` – Chat-based command (`summon morph`) to spawn the NPC for 30s
- `sql.txt` – SQL setup for DB schema and creature_template entry

---

## 💾 Installation

1. **Place Lua scripts** in your Eluna scripts folder (e.g. `lua_scripts/Morphnpc/`):
   ```
   morph_npc.lua
   morphspawn.lua
   ```

2. **Enable Lua engine** in `worldserver.conf`:
   ```
   Scripts=lua_scripts
   ```

3. **Execute `sql.txt`** in your database:
   - Adds `custom_morph_displayid` column to `characters`
   - Adds creature_template for NPC `999000`

---

## 🧪 Usage

- In game, type:
  ```
  summon morph
  ```
  → Spawns the Morph NPC near the player for 30 seconds

- Talk to the NPC to:
  - Choose a race/gender display
  - Revert to original appearance

- Morph is saved and reapplied after relog automatically

---

## 🔄 Notes

- Uses `player:SetDisplayId(...)`, not full morph (gear is hidden)
- Only 1 morph is stored per character
- Easily extendable with new models

---

## 🧰 Requirements

- AzerothCore with Eluna enabled
- GM or player access to say chat (say: `summon morph`)
- DB access to apply `sql.txt`

---

## 🔗 GitHub Usage

To add this to your GitHub project:
1. Create a folder (e.g. `Morphnpc/`)
2. Add:
   - `morph_npc.lua`
   - `morphspawn.lua`
   - `sql.txt`
   - `README.md` (this file)
3. Commit & push:
   ```bash
   git add Morphnpc/
   git commit -m "Add Morph NPC Eluna module"
   git push
   ```

---

Created by: ChatGPT & Tomas Rytíř
