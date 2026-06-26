<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta name="theme-color" content="#ffe5f0" />
    <title>Fit Agent</title>
    <link rel="manifest" href="./manifest.webmanifest" />
    <link rel="stylesheet" href="./styles.css" />
  </head>
  <body>
    <main class="app-shell">
      <header class="topbar">
        <div>
          <p class="eyebrow">Today</p>
          <h1 id="todayLabel">Fit Agent</h1>
        </div>
        <button class="icon-button" id="settingsButton" aria-label="Open settings" title="Settings">
          <span aria-hidden="true">⚙</span>
        </button>
      </header>

      <section class="agent-strip" id="agentMessage" aria-live="polite"></section>

      <section class="date-picker-panel" aria-label="Choose day to edit">
        <button class="icon-button" id="previousDayButton" aria-label="Previous day" title="Previous day">
          <span aria-hidden="true">‹</span>
        </button>
        <label class="date-field">
          <span>Edit day</span>
          <input id="dateInput" type="date" />
        </label>
        <button class="icon-button" id="nextDayButton" aria-label="Next day" title="Next day">
          <span aria-hidden="true">›</span>
        </button>
        <button class="ghost-button" id="todayButton">Today</button>
      </section>

      <section class="summary-grid" aria-label="Selected day summary">
        <article class="metric">
          <span class="metric-label">Calories</span>
          <strong id="calorieOutcome">Not set</strong>
          <span id="calorieStatus">Choose today's result</span>
        </article>
        <article class="metric">
          <span class="metric-label">Walk</span>
          <strong id="walkStatus">Not yet</strong>
          <span>Once per day</span>
        </article>
        <article class="metric">
          <span class="metric-label">Workouts</span>
          <strong id="weeklyWorkoutCount">0 / 5</strong>
          <span>This week</span>
        </article>
        <article class="metric">
          <span class="metric-label">Protein</span>
          <strong id="proteinStatus">Not yet</strong>
          <span>Every day</span>
        </article>
        <article class="metric">
          <span class="metric-label">Gratitude</span>
          <strong id="gratitudeStatus">Not yet</strong>
          <span>Every day</span>
        </article>
        <article class="metric">
          <span class="metric-label">Plate</span>
          <strong id="plateStatus">0 / 4</strong>
          <span>This week</span>
        </article>
      </section>

      <section class="pet-panel" aria-label="Pet progress">
        <div class="pet-stage">
          <img class="pet-image" id="petMood" src="./assets/ravioli-reference.png" alt="Ravioli, a cute white and brown Shih Tzu puppy" />
        </div>
        <div class="pet-copy">
          <p class="eyebrow">Ravioli</p>
          <h2 id="petTitle">Ravioli is waiting</h2>
          <p id="petMessage">Food, water, treats, showers, and walks come from your daily checkoffs.</p>
          <div class="pet-needs" aria-label="Today's pet care">
            <span id="foodNeed">Food</span>
            <span id="waterNeed">Water</span>
            <span id="treatNeed">Treat</span>
            <span id="showerNeed">Shower</span>
            <span id="ravioliWalkNeed">Puppy walk</span>
            <span id="playNeed">Play</span>
          </div>
          <div class="progress-track pet-life-track" aria-label="Pet life">
            <span id="petLifeProgress"></span>
          </div>
          <strong class="pet-life-label" id="petLifeLabel">Life 20%</strong>
        </div>
      </section>

      <section class="panel tracker-panel" aria-label="Daily tracker">
        <div class="section-heading">
          <div>
            <p class="eyebrow">Daily tracker</p>
            <h2 id="trackerTitle">Log today</h2>
          </div>
          <button class="ghost-button" id="clearTodayButton">Clear day</button>
        </div>

        <div class="choice-group" aria-label="Calorie result">
          <label class="toggle-card">
            <input id="calorieMetCheckbox" name="calorieResult" type="radio" value="met" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Met calorie limit</strong>
              <small>Your pet gets food.</small>
            </span>
          </label>
          <label class="toggle-card penalty-card">
            <input id="calorieOverCheckbox" name="calorieResult" type="radio" value="over" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Went over</strong>
              <small>Counts as a -5 point penalty.</small>
            </span>
          </label>
        </div>

        <div class="check-row">
          <label class="toggle-card">
            <input id="walkCheckbox" type="checkbox" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Walk completed</strong>
              <small>Any intentional walk counts.</small>
            </span>
          </label>
          <label class="toggle-card">
            <input id="workoutCheckbox" type="checkbox" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Workout completed</strong>
              <small>Goal is 5 days per week.</small>
            </span>
          </label>
          <label class="toggle-card">
            <input id="proteinCheckbox" type="checkbox" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Met protein goal</strong>
              <small>Ravioli gets a shower.</small>
            </span>
          </label>
          <label class="toggle-card">
            <input id="gratitudeCheckbox" type="checkbox" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Practiced gratitude</strong>
              <small>Ravioli gets a happy puppy walk.</small>
            </span>
          </label>
          <label class="toggle-card">
            <input id="plateCheckbox" type="checkbox" />
            <span class="fake-check" aria-hidden="true"></span>
            <span>
              <strong>Vibration plate</strong>
              <small>Goal is 4 times per week.</small>
            </span>
          </label>
        </div>

        <label class="field weigh-in-field" id="weighInField" hidden>
          <span>Tuesday weigh-in</span>
          <input id="weightInput" type="number" inputmode="decimal" min="0" step="0.1" placeholder="Weight in lbs" />
          <small class="field-hint" id="weightHint">This saves only for the Tuesday you are viewing.</small>
        </label>

        <label class="field">
          <span>Notes</span>
          <textarea id="notesInput" rows="3" placeholder="Meals, workout type, how you felt..."></textarea>
        </label>
      </section>

      <section class="panel" aria-label="Weekly progress">
        <div class="section-heading">
          <div>
            <p class="eyebrow">Weekly progress</p>
            <h2>This week</h2>
          </div>
          <span class="week-range" id="weekRange"></span>
        </div>

        <div class="progress-block reward-points-block">
          <div class="progress-copy">
            <span>Reward points</span>
            <strong id="rewardPointsCount">0 / 30</strong>
          </div>
          <div class="progress-track reward-points-track"><span id="rewardPointsProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Calories met</span>
            <strong id="calorieDaysCount">0 / 7</strong>
          </div>
          <div class="progress-track"><span id="calorieProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Penalties</span>
            <strong id="penaltyDaysCount">0 pts</strong>
          </div>
          <div class="progress-track penalty-track"><span id="penaltyProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Walks</span>
            <strong id="walkDaysCount">0 / 7</strong>
          </div>
          <div class="progress-track"><span id="walkProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Workouts</span>
            <strong id="workoutDaysCount">0 / 5</strong>
          </div>
          <div class="progress-track"><span id="workoutProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Protein</span>
            <strong id="proteinDaysCount">0 / 7</strong>
          </div>
          <div class="progress-track"><span id="proteinProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Gratitude</span>
            <strong id="gratitudeDaysCount">0 / 7</strong>
          </div>
          <div class="progress-track"><span id="gratitudeProgress"></span></div>
        </div>

        <div class="progress-block">
          <div class="progress-copy">
            <span>Vibration plate</span>
            <strong id="plateDaysCount">0 / 4</strong>
          </div>
          <div class="progress-track"><span id="plateProgress"></span></div>
        </div>

        <div class="progress-block bonus-block">
          <div class="progress-copy">
            <span>Weight bonus</span>
            <strong id="weightBonusCount">0 pts</strong>
          </div>
          <div class="progress-track bonus-track"><span id="weightBonusProgress"></span></div>
        </div>

        <div class="week-grid" id="weekGrid" aria-label="Day-by-day progress"></div>
      </section>

      <section class="reward-panel locked" id="rewardPanel" aria-live="polite">
        <p class="eyebrow">Hidden reward</p>
        <h2 id="rewardTitle">Locked surprise</h2>
        <p id="rewardText">Earn 30 points this week to reveal your reward.</p>
      </section>
    </main>

    <dialog class="settings-dialog" id="settingsDialog">
      <form method="dialog" class="settings-card">
        <div class="section-heading">
          <div>
            <p class="eyebrow">Setup</p>
            <h2>Your goals</h2>
          </div>
          <button class="icon-button" value="close" aria-label="Close settings" title="Close">×</button>
        </div>

        <label class="field">
          <span>Weekly reward</span>
          <select id="rewardSelect">
            <option value="Dunkin">Dunkin</option>
            <option value="Starbucks">Starbucks</option>
            <option value="Marshalls">Marshalls</option>
            <option value="Target run">Target run</option>
            <option value="Manicure fund">Manicure fund</option>
            <option value="Cozy night in">Cozy night in</option>
          </select>
        </label>

        <label class="field">
          <span>Custom reward</span>
          <input id="rewardInput" type="text" placeholder="Or type your own..." />
        </label>

        <button class="primary-button" id="saveSettingsButton" value="close">Save goals</button>
      </form>
    </dialog>

    <script src="./app.js"></script>
  </body>
</html>