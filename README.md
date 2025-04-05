# choreShellScripts

A collection of helpful and reusable shell scripts for everyday automation and file management tasks on Unix-like systems (macOS, Linux, WSL).

## 📚 Available Scripts

- [Episode Renamer Script (`rename_episodes.sh`)](#-episode-renamer-script)  
  Rename TV show episode files to a clean `Show.Name.SxxExx.ext` format.

*(More scripts coming soon...)*

---

## 📄 Episode Renamer Script (`rename_episodes.sh`)

This script helps you **batch rename TV show episode files** into a clean, consistent format:

```
Show.Name.SxxExx.ext
```

For example:
```
Rick And Morty S06E01 - Solaricks.mp4   →   Rick.And.Morty.S06E01.mp4
The.Office.US.S03E14.HDTV.avi           →   The.Office.US.S03E14.avi
```

---

### ✅ What It Does

- Automatically detects the show name from the original filename.
- Finds the episode code in the format `SxxExx` (case-insensitive).
- Renames each file to:  
  `Show.Name.SxxExx.ext` (replacing spaces, underscores, and extra dots with a single dot).
- Keeps the original file extension (`.mp4`, `.mkv`, `.avi`, etc.).

---

### 🛠 Requirements

- Mac or Linux (or WSL on Windows)
- Bash (default on macOS/Linux)
- Basic permissions to read/write files in the directory

---

### 🚀 How to Use

1. **Clone this repo** or copy the script to your local machine.

2. **Make the script executable** (only once):
   ```bash
   chmod +x rename_episodes.sh
   ```

3. **Run the script with the target folder as argument**:
   ```bash
   ./rename_episodes.sh /path/to/your/episodes
   ```

   Example:
   ```bash
   ./rename_episodes.sh ~/Downloads/TV_Shows/RickAndMorty
   ```

4. All matching video files will be renamed in-place.

---

### 💡 Tips

- The script supports any show name as long as the filename contains an `SxxExx` pattern.
- Only filenames with a valid season/episode pattern will be renamed.
- It works with common video formats like `.mp4`, `.mkv`, `.avi`, etc.
- Original filenames are not backed up—run with caution or on copies first if needed.

---

### 📂 Recommended Folder Structure

For best results, store each show in its own folder:
```
📁 TV_Shows/
   └── 📁 RickAndMorty/
       ├── Rick And Morty S07E01 - Some Title.mkv
       ├── Rick.And.Morty.S07E02.1080p.mkv
       └── ...
```

---

### 🧪 Sample Output

After running the script:
```
📁 RickAndMorty/
   ├── Rick.And.Morty.S07E01.mkv
   ├── Rick.And.Morty.S07E02.mkv
   └── ...
```

---

### 📬 Questions or Contributions?

If you have other naming styles or improvements, feel free to open an issue or PR. Contributions are welcome!