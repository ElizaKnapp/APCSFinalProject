# APCSFinalProject

<b>Project:</b> Space Invaders <br>
<b>Group Name:</b> Space Dolphins <br>
<b>Group Members:</b> Rachel Xiao, Eliza Knapp 

## Project Description
This project is a version of the game Space Invaders done in processing. It is an interactive game where the player controls the shooter by moving it left and right with the arrow keys. When the spacebar is clicked, a bullet is shot upwards towards a group of aliens. The goal of the game is to shoot all of the aliens before they get to the player or before the player loses all three of its lives. Aliens can also shoot bullets to kill the player. A player can hide behind barriers to avoid these bullets, but barriers slowly disappear when bullets hit them. When you shoot aliens, you get points, so another goal of the game is to get as many points as possible. There are also additional features like gifts to the game which can give the player a fast bullet or a bomb bullet. One specific gift allows the game to regenerate the barriers.

Prototype: https://docs.google.com/document/d/1mjWuRU64XitgxhKxo5nE0pvTtIN6Cw9Z8P2SdfM3YEw/edit?usp=sharing

## Compile/Run Instructions
1. Clone the repository.
2. Open SpaceInvaders.pde in Processing. 
3. Click the "run" button in Processing.

## Development Log
### DAY 1: May 24
- **Eliza** <br>
  Set up the general layout and display of the game. Created Player class and started Alien class.
- **Rachel** <br>
  Created a Character abstract class for all of the moving objects. Started Bullet class and its subclasses.
### DAY 2: May 25
- **Eliza** <br>
  Got the aliens to move in domino[edit: non-succesfully] and all move down together when the top one hits a wall.
### DAY 3: May 26
- **Eliza** <br>
  Made bullets disappear when they hit aliens and experimented with millis() to create the domino movement effect.
- **Rachel** <br>
  Made bad bullets disappear when they hit the player and created an outline of the start screen of the game.
### DAY 4: May 27
- **Rachel** <br>
  Fixed how alien bullets are shot. Started to work on the win screen of the game.
### DAY 5: May 28
- **Eliza** <br>
  Added a play again button for the win and the lose screens, added the block and barrier classes and implemented them in the main file.
- **Rachel** <br>
  Kept track of the number of lives of the player. Started the lose screen.
### DAY 6: May 30
- **Eliza** <br>
  Created the UFO that is faster and worth a lot of points. Polished up changes to the display screen.
- **Rachel** <br>
  Created different types of aliens and kept track of the score based on which aliens are hit. Checked if aliens reached the player.
### DAY 7: June 1
- **Rachel** <br>
  Kept track of the last alive alien on the left and right sides so that the aliens move across the screen correctly.
### DAY 8: June 2
- **Eliza** <br>
  Fixed the pixelation of the barriers when you destroy them so the configuration patterns form on setup and are less busy to look at. Cropped images and displayed them for aliens.
- **Rachel** <br>
  Canceled out bullets if they hit each other. Started experimenting with images.
### DAY 9: June 3
- **Eliza & Rachel** <br>
  Fixed the sizes of aliens. Created a better start screen and player by loading images.
### DAY 10: June 6
- **Eliza**<br>
  A gift object flies through the sky now. The intention is that when you shoot it, you add special bullets to your inventory (perhaps with speed, more power...).
### DAY 11: June 7
- **Eliza**<br>
  Created the speed bullets and made it so that a gift randomly gives you either 5 speed bullets or 1 bomb bullet.
- **Rachel** <br>
  Made the aliens look animated with flapping. Created the explosion of the bomb bullet.
### DAY 12: June 8
- **Eliza**<br>
  Made Player splat when they lose all three of their lives. Modified transition to next round.
- **Rachel** <br>
  Fixed small things that relate to handling the special bullets.
### DAY 13: June 10
- **Eliza**<br>
  Created another type of gift called barrier gift that regenerates the barriers when you hit it.
- **Rachel** <br>
  Finished UML Diagram and did last minute edits.
