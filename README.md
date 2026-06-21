# Button Game 🎮

An incremental clicker game with rebirth mechanics and a gacha shop. Click your way to trillions and collect rebirth tokens to unlock permanent multipliers!

## Features

- **Incremental Gameplay**: Click to earn score, upgrade multipliers to earn more
- **4 Upgrade Tiers**: Each costs more but doubles your clicks
- **Rebirth System**: Reset progress to gain permanent multipliers (exponentially scaling costs)
- **Gacha Shop**: Spend rebirth tokens on rare multiplier upgrades
  - Common Pack (1 token): +0.1x
  - Rare Pack (2 tokens): +0.3x
  - Epic Pack (3 tokens): +0.8x
  - Legendary Pack (5 tokens): +2.0x
- **Auto-Save**: Game progress is saved to browser localStorage
- **Responsive Design**: Works on desktop and mobile

## Play Online

Deploy to Vercel with one click:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fyourusername%2Fbutton-game)

Or try it locally:

## Local Setup

1. Clone the repository
2. Open `index.html` in your browser or run:
   ```bash
   python -m http.server 8000
   ```
3. Visit `http://localhost:8000`

## How to Play

1. **Click the big button** in the center to earn score
2. **Buy upgrades** on the left to multiply your earnings:
   - 2x Multiplier (20) - first tier
   - 2x Multiplier (200) - second tier
   - 2x Multiplier (2000) - third tier
   - 2x Multiplier (20000) - fourth tier
3. **Rebirth** when you have enough score for exponential growth in power:
   - Costs: 1M → 31.6M → 1B → 8B+ (each rebirth costs ~1.5^n times more)
   - Gain: 1 rebirth token + permanent 2x multiplier
4. **Use the Gacha Shop** to spend tokens on rare multiplier boosts for even more power

## Strategy Tips

- Balance upgrading multipliers with saving for rebirths
- Early rebirths help you progress faster
- Gacha packs provide alternative ways to boost your multiplier without rebirths

## Tech Stack

- Pure HTML5 + CSS3 + Vanilla JavaScript
- No dependencies
- localStorage for persistent storage
- Static site, easily deployable anywhere

## Deployment Options

### Vercel (Recommended)

1. Push code to GitHub
2. Go to [vercel.com](https://vercel.com)
3. Import the repository
4. Deploy automatically

### Other Options

- **Netlify**: Drag and drop `index.html` or connect GitHub
- **GitHub Pages**: Push to gh-pages branch
- **Any static host**: Just serve the files

## License

ISC
