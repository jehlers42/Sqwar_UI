# Sqwarlock’s World of Warcraft UI
## Installation Instructions
1. Backup the folders: `%install_location%\World of Warcraft\interface` and `%install_location%\World of Warcraft\WTF`
2. Delete the `interface` folder
3. Navigate to: `%install_location%\World of Warcraft\WTF\Account\%wow_account_name%` and delete all folders<br />
_**IMPORTANT**: Do not delete any loose files, including those ending in: .old, .wtf, .md5, or .txt._
4. Extract the `interface` folder from `Final_SqwarUI.zip` to `%install_location%\World of Warcraft\`<br />
_**Note**: If prompted, overwrite any files that already exist_
5. Extract the `SavedVariables` and `SERVER_NAME` folders from the zip to `%install_location%\World of Warcraft\WTF\Account\%wow_account_name%`
6. Rename the `SERVER_NAME` folder with the correct server name<br />
_**Note**: If you play on multiple servers, duplicate this folder and rename it for each server_
7. In the server folder, rename `CHARACTER_NAME` to the name of your character<br />
_**Note**: If you play multiple characters, duplicate this folder and rename it for each character_
8. Launch World of Warcraft and log in to your character
9. After logging in:
   1. Press Enter and type `/dominos` in chat
   2. Select **Profiles** in the nav bar
   3. Click **Default**
   4. Click **Okay**
   5. Press **Enter** and type `/grid2` in chat
   6. Click **General Settings**, then select the **Profiles** tab
   7. Select **Default** from the **Existing Profiles** dropdown
   8. Click **Close**
   9. Press **Enter** and type `/raven` in chat
   10. Select the **Profiles** tab
   11. Select **Default** from the **Existing Profiles** dropdown
   12. Click **Close**
   13. (OPTIONAL) If your minimap is in the upper-right instead of the upper-left:
       1. Right-click your minimap
       2. Check **Use Global Profile**
       3. Click **Accept** on the popup to reload your UI
10. Unlock your chat window and drag it to the lower left corner to mirror the Skada panel<br />
_**Note**: While your chat window is unlocked, you can resize it using the windows edges. It is anchored to the panel at the bottom left corner, so use the top and right edges to resize it and keep it in the corner position._
11. Congrats, you is dun
 
## Installation and Mod Notes
Think of this UI as a base to build onto for your own needs. Below are some helpful tips for customizing or fixing various parts of the UI.
#### Dominos
* Left-clicking the Dominos map button will show all bars.
* Click and drag a bar to move its position. Bars snap together when moved close enough to another.
* Right-click a bar to view the various options for that bar.
#### eAlign
* Typing /align in chat will display a segmented grid overlay, helpful for placing UI elements in accurate positions.
#### Quartz
* Depending on your resolution, the player and enemy cast bars may be out of place. If they are, type `/quartz unlock` in chat to unlock the bars. From here, you can drag them to the correct position just above each healthbar.<br />
_**Tip**: Select yourself, then right click the Raven minimap button, to see the gap of space where the cast bars should reside._
#### Skada
* You may notice my character’s name already showing in Skada. Clear this by clicking the X in Skada’s title bar, then click the checkmark to clear its history.
#### Shadowed Unit Frames
* If you want to change the unit frame colors, type `/suf` in chat and select **General** > **Colors**.
  * For example, the main health bar color is named `Static`.
 


