---
layout: default
title: "Appendix C: Comparison Chart"
parent: "Part VIII: Appendices"
nav_order: 3
permalink: /chapters/appendix-c-comparison-chart.html
---

# Appendix C: 10-Year Size & Budding Comparison Chart

This chart visualizes the approximate 10-year sizes and budding times of the Japanese Maples in our library. The colors represent their typical summer/fall foliage hues.

<style>
.chart-wrapper {
  position: relative;
  width: 100%;
  font-family: sans-serif;
  margin-top: 20px;
}
.chart-header {
  display: flex;
  margin-bottom: 10px;
}
.chart-group-title {
  flex: 1;
  text-align: center;
  font-weight: bold;
  color: #666;
  padding: 5px;
}
.chart-scroll-area {
  overflow-x: auto;
  width: 100%;
  padding-bottom: 20px;
}
.chart-body {
  display: flex;
  position: relative;
  min-width: 1200px; /* ensure enough width to avoid squishing */
}
.chart-y-axis {
  position: absolute;
  right: 0;
  top: 0;
  height: 400px;
  width: 40px;
  border-left: 1px solid #ccc;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background: white; /* overlay on top if scrolled */
  z-index: 10;
}
.y-tick {
  position: relative;
  width: 100%;
  border-top: 1px solid #ccc;
  height: 0;
}
.y-tick span {
  position: absolute;
  right: -25px;
  top: -8px;
  font-size: 12px;
  color: #666;
  background: white;
  padding-left: 5px;
}
.chart-grid {
  display: flex;
  flex: 1;
  margin-right: 40px; /* space for fixed y-axis */
}
.chart-section {
  flex: 1;
  position: relative;
  display: flex;
  align-items: flex-end;
  justify-content: space-evenly;
  border-right: 1px dashed #ccc;
  border-bottom: 2px solid #ccc;
  padding: 0 10px;
  height: 400px;
}
.chart-section:last-child {
  border-right: none;
}
.plant-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 5px;
}
a.plant-link {
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.plant-shape {
  border-radius: 40% 40% 15% 15%;
  box-shadow: inset -5px -5px 10px rgba(0,0,0,0.2);
  transition: transform 0.2s;
  margin-bottom: 0;
}
.plant-shape:hover {
  transform: scale(1.1);
}
.plant-label-container {
  height: 120px;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  margin-top: 10px;
}
.plant-label {
  font-size: 11px;
  writing-mode: vertical-rl;
  text-orientation: mixed;
  transform: rotate(180deg);
  color: #555;
  white-space: nowrap;
}
</style>

<div class="chart-wrapper">
  <div class="chart-scroll-area">
    <div class="chart-header" style="min-width: 1200px; margin-right: 40px;">
      <div class="chart-group-title">EARLY SEASON</div>
      <div class="chart-group-title">MID SEASON</div>
      <div class="chart-group-title">LATE SEASON</div>
    </div>
    
    <div class="chart-body">
      <div class="chart-grid">
        <div class="chart-section">
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/coonara-pygmy" class="plant-link" title="Coonara Pygmy (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Coonara Pygmy</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/deshojo" class="plant-link" title="Deshojo (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Deshojo</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/pixie" class="plant-link" title="Pixie (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Pixie</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/first-ghost" class="plant-link" title="First Ghost (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">First Ghost</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/murasaki-kiyohime" class="plant-link" title="Murasaki Kiyohime (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Murasaki Kiyohime</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/hime-shojo" class="plant-link" title="Hime-shojo (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Hime-shojo</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/peve-starfish" class="plant-link" title="Peve Starfish (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Peve Starfish</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/beni-chidori" class="plant-link" title="Beni Chidori (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Beni Chidori</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/beni-maiko" class="plant-link" title="Beni maiko (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Beni maiko</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/mikazuki" class="plant-link" title="Mikazuki (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Mikazuki</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/shaina" class="plant-link" title="Shaina (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Shaina</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/aoyagi" class="plant-link" title="Aoyagi (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #f1c40f;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Aoyagi</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/sango-kaku" class="plant-link" title="Sango kaku (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #f1c40f;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Sango kaku</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/skeeters-broom" class="plant-link" title="Skeeters Broom (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Skeeters Broom</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/bihou" class="plant-link" title="Bihou (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Bihou</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/higasayama" class="plant-link" title="Higasayama (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #f1c40f;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Higasayama</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/trompenburg" class="plant-link" title="Trompenburg (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Trompenburg</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/orange-dream" class="plant-link" title="Orange Dream (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Orange Dream</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/katsura" class="plant-link" title="Katsura (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Katsura</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/osakazuki" class="plant-link" title="Osakazuki (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #2ecc71;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Osakazuki</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/baton-rouge" class="plant-link" title="Baton Rouge (10-yr size: 15.0')">
              <div class="plant-shape" style="height: 356.25px; width: 160.3125px; background: #f1c40f;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Baton Rouge</div>
              </div>
            </a>
          </div>
        </div>
        <div class="chart-section">
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/sharps-pygmy" class="plant-link" title="Sharp’s Pygmy (10-yr size: 1.7')">
              <div class="plant-shape" style="height: 39.583333333333336px; width: 20px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Sharp’s Pygmy</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/abbys-weeping" class="plant-link" title="Abby's Weeping (10-yr size: 2.5')">
              <div class="plant-shape" style="height: 59.375px; width: 26.71875px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Abby's Weeping</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/kuro-hime" class="plant-link" title="Kuro hime (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Kuro hime</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/olsens-frosted-strawberry" class="plant-link" title="Olsen’s Frosted Strawberry (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Olsen’s Frosted Strawberry</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/tiny-stars" class="plant-link" title="Tiny Stars (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Tiny Stars</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/sekka-yatsubusa" class="plant-link" title="Sekka Yatsubusa (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Sekka Yatsubusa</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/rhode-island-red" class="plant-link" title="Rhode Island Red (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Rhode Island Red</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/bonfire" class="plant-link" title="Bonfire (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Bonfire</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/mikawa-yatsubusa" class="plant-link" title="Mikawa Yatsubusa (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Mikawa Yatsubusa</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/aureum" class="plant-link" title="Aureum (10-yr size: 3.8')">
              <div class="plant-shape" style="height: 89.0625px; width: 40.078125px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Aureum</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/tsuri-no-mai" class="plant-link" title="Tsuri-no-mai (10-yr size: 5.0')">
              <div class="plant-shape" style="height: 118.75px; width: 53.4375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Tsuri-no-mai</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/aconitifolium" class="plant-link" title="Aconitifolium (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Aconitifolium</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/amber-ghost" class="plant-link" title="Amber Ghost (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Amber Ghost</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/viridis" class="plant-link" title="Viridis (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Viridis</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/baby-ghost" class="plant-link" title="Baby Ghost (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Baby Ghost</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/peaches-and-cream" class="plant-link" title="Peaches and Cream (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Peaches and Cream</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/ukigumo" class="plant-link" title="Ukigumo (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Ukigumo</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/sister-ghost" class="plant-link" title="Sister Ghost (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #f1c40f;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Sister Ghost</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/geisha-gone-wild" class="plant-link" title="Geisha Gone Wild (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Geisha Gone Wild</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/twomblys-red-sentinel" class="plant-link" title="Twombly's Red Sentinel (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Twombly's Red Sentinel</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/firefly" class="plant-link" title="Firefly (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Firefly</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/butterfly" class="plant-link" title="Butterfly (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Butterfly</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/purple-ghost" class="plant-link" title="Purple Ghost (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Purple Ghost</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/fireglow" class="plant-link" title="Fireglow (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Fireglow</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/tamukeyama" class="plant-link" title="Tamukeyama (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Tamukeyama</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/baldsmith" class="plant-link" title="Baldsmith (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Baldsmith</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/villa-taranto" class="plant-link" title="Villa Taranto (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Villa Taranto</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/koto-no-ito" class="plant-link" title="Koto no ito (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Koto no ito</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/grandma-ghost" class="plant-link" title="Grandma Ghost (10-yr size: 7.5')">
              <div class="plant-shape" style="height: 178.125px; width: 80.15625px; background: #f5f5dc;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Grandma Ghost</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/celebration" class="plant-link" title="Celebration (10-yr size: 8.3')">
              <div class="plant-shape" style="height: 197.91666666666669px; width: 89.06250000000001px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Celebration</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/waveleaf" class="plant-link" title="Waveleaf (10-yr size: 8.3')">
              <div class="plant-shape" style="height: 197.91666666666669px; width: 89.06250000000001px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Waveleaf</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/mila" class="plant-link" title="Mila (10-yr size: 10.8')">
              <div class="plant-shape" style="height: 257.2916666666667px; width: 115.78125000000001px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Mila</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/sensu" class="plant-link" title="Sensu (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Sensu</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/ryusen" class="plant-link" title="Ryusen (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Ryusen</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/inaba-shidare" class="plant-link" title="Inaba shidare (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Inaba shidare</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/summer-gold" class="plant-link" title="Summer Gold (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Summer Gold</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/beni-otake" class="plant-link" title="Beni otake (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Beni otake</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/omure-yama" class="plant-link" title="Omure yama (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Omure yama</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/orangeola" class="plant-link" title="Orangeola (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Orangeola</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/arakawa" class="plant-link" title="Arakawa (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Arakawa</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/scolopendrifolium" class="plant-link" title="Scolopendrifolium (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #e67e22;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Scolopendrifolium</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/seiryu" class="plant-link" title="Seiryu (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Seiryu</div>
              </div>
            </a>
          </div>
        </div>
        <div class="chart-section">
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/shishigashira" class="plant-link" title="Shishigashira (10-yr size: 3.3')">
              <div class="plant-shape" style="height: 79.16666666666667px; width: 35.625px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Shishigashira</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/crimson-queen" class="plant-link" title="Crimson Queen (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Crimson Queen</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/jordan" class="plant-link" title="Jordan (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Jordan</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/moonrise" class="plant-link" title="Moonrise (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Moonrise</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/autumn-moon" class="plant-link" title="Autumn Moon (10-yr size: 6.7')">
              <div class="plant-shape" style="height: 158.33333333333334px; width: 71.25px; background: #cc3333;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Autumn Moon</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/bloodgood" class="plant-link" title="Bloodgood (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Bloodgood</div>
              </div>
            </a>
          </div>
          <div class="plant-item">
            <a href="/japanese-maple-book/cultivars/emperor-1" class="plant-link" title="Emperor 1 (10-yr size: 12.5')">
              <div class="plant-shape" style="height: 296.875px; width: 133.59375px; background: #800020;"></div>
              <div class="plant-label-container">
                <div class="plant-label">Emperor 1</div>
              </div>
            </a>
          </div>
        </div>
      </div>
      <div class="chart-y-axis">
        <div class="y-tick"><span>16'</span></div>
        <div class="y-tick"><span>14'</span></div>
        <div class="y-tick"><span>12'</span></div>
        <div class="y-tick"><span>10'</span></div>
        <div class="y-tick"><span>8'</span></div>
        <div class="y-tick"><span>6'</span></div>
        <div class="y-tick"><span>4'</span></div>
        <div class="y-tick"><span>2'</span></div>
        <div class="y-tick"><span>0'</span></div>
      </div>
    </div>
  </div>
</div>


> **Note:** Sizes are estimates based on average growth rates. Actual sizes will vary depending on climate, soil, and care.

---

[← Previous: Appendix B]({{ site.baseurl }}/chapters/appendix-b-kit.html)
