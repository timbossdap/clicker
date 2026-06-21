# Button Game - Customization Guide

## Easy Tweaks

### Game Balance

Edit these values in `index.html` (search for the number):

```javascript
// Upgrade costs
state.score >= 20       // First upgrade cost
state.score >= 200      // Second upgrade cost
state.score >= 2000     // Third upgrade cost
state.score >= 20000    // Fourth upgrade cost

// Multiplier increments
state.multiplier1 += 1.0   // Change to 2.0 for +2x, 0.5 for +0.5x, etc

// Rebirth cost formula
return Math.pow(1e6, Math.pow(1.5, state.rebirthTokens))
// e.g., change 1e6 to 1e7 for higher first rebirth cost
// or change 1.5 to 2.0 for steeper scaling

// Rebirth multiplier gain
state.rebirthMultiplier *= 2.0  // Change to *= 3.0 for 3x per rebirth

// Gacha pack values
state.rebirthMultiplier += 0.1  // Common pack bonus
state.rebirthMultiplier += 0.3  // Rare pack bonus
state.rebirthMultiplier += 0.8  // Epic pack bonus
state.rebirthMultiplier += 2.0  // Legendary pack bonus
```

### Colors

Search for color hex codes in `<style>` section:

```css
#14a085  /* Teal - main theme */
#ffd700  /* Gold - multiplier display */
#ff69b4  /* Pink - rebirth */
#9932cc  /* Purple - gacha shop */
#ffa500  /* Orange - upgrades */

/* Change any to customize the theme */
```

### Text & Labels

In the HTML section:

```html
<button>2x Multiplier<br>(20)</button>  <!-- Change to "Upgrade" or anything -->
<div class="score" id="score">Score: 0</div>  <!-- Change label -->
```

### Button Sizes

```css
.click-btn {
    width: 280px;      /* Change to make click button bigger/smaller */
    height: 280px;
}

.multiplier-btn {
    width: 160px;      /* Upgrade button size */
    height: 120px;
}
```

## Adding Features

### New Upgrade Tier

1. Add HTML button:
```html
<button class="multiplier-btn" id="btn5">2x Multiplier<br>(200000)</button>
```

2. Add JavaScript state:
```javascript
const state = {
    // ... existing code
    multiplier5: 1.0,  // ADD THIS
};
```

3. Add click handler:
```javascript
document.getElementById('btn5').addEventListener('click', () => {
    if (state.score >= 200000) {
        state.score -= 200000;
        state.multiplier5 += 1.0;
        updateDisplay();
    }
});
```

4. Add to click calculation:
```javascript
state.score += state.rebirthMultiplier * state.multiplier1 * state.multiplier2 * state.multiplier3 * state.multiplier4 * state.multiplier5;
```

5. Update display function:
```javascript
// In updateDisplay() function, add:
if (state.multiplier5 > 1.0) {
    const div = document.createElement('div');
    div.className = 'multiplier-text';
    div.textContent = `${state.multiplier5.toFixed(1)}x`;
    multiplierDisplay.appendChild(div);
}
```

### New Gacha Pack

1. Add HTML button:
```html
<button class="gacha-pack super-pack" id="superPack">Super Pack<br>(10 tokens)<br>+5.0x</button>
```

2. Add CSS styling:
```css
.super-pack {
    background-color: #ff00ff;
    border-color: #cc00cc;
}
.super-pack:hover:not(:disabled) {
    background-color: #ff33ff;
}
```

3. Add click handler:
```javascript
document.getElementById('superPack').addEventListener('click', () => {
    if (state.rebirthTokens >= 10) {
        state.rebirthTokens -= 10;
        state.rebirthMultiplier += 5.0;
        updateDisplay();
    }
});
```

4. Add button update in updateDisplay():
```javascript
document.getElementById('superPack').disabled = state.rebirthTokens < 10;
```

## Mobile Optimization

Already included! The CSS has responsive breakpoints. To adjust:

```css
@media (max-width: 1200px) {
    .click-btn {
        width: 200px;  /* Smaller on mobile */
        height: 200px;
    }
}
```

## Troubleshooting

**Game won't load?**
- Open browser console (F12)
- Check for JavaScript errors
- Make sure all closing braces } are present

**Progress not saving?**
- Check if localStorage is enabled
- Try private browsing (different storage)

**Colors look weird?**
- Clear browser cache (Ctrl+Shift+Del)
- Hard refresh (Ctrl+Shift+R)

## Tips for Publishing

1. Test all features before deploying
2. Check on mobile devices
3. Ensure all buttons are clickable
4. Test save/load cycle
5. Check number formatting for very large numbers

---

Happy customizing! 🎨
