-- HEADER FILES...
import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.EwmhDesktops

--layouts.
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns
import XMonad.Layout.OneBig
import XMonad.Layout.Spacing

--xmobar.
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.ClickableWorkspaces


  

-- MAIN CONFIGURATION...
main :: IO ()
main = xmonad 
      . ewmhFullscreen 
      . ewmh 
      . withEasySB (statusBarProp "xmobar" (clickablePP myXmobarPP)) defToggleStrutsKey 
      $ myConfig
     
myConfig = do 
  def
     {    
         terminal	= "terminator"
       , modMask = mod4Mask
       , borderWidth = 3
       , normalBorderColor = "#282a36"
       , focusedBorderColor = "#00ffff"

       , layoutHook = mySpacing $ myLayouts   

       , logHook = fadeWindowsLogHook myFadeHook
       , handleEventHook = fadeWindowsEventHook
     } 
      
      
  
     
-- KEY BINDINGS...    
   `additionalKeysP`
     [ 
         ("M-r", spawn "rofi -Show drun")
       , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
       , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
       , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
       , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
       , ("<XF86AudioMute>", spawn "amixer set Master toggle")
     ]




-- SETTINGS AND VARIABLES...

--transparency.
myFadeHook = composeAll  [                 opaque
                        , isUnfocused --> transparency 0.3
                        ,transparency 0.3
                        ]

--layouts settings.
myLayouts =  Tall 1 (3/100) (1/2) ||| Mirror (OneBig (2/3) (3/4)) ||| Grid ||| ThreeColMid 1 (3/100) (1/2) ||| Full

--spacing between edges and apps.
mySpacing = spacingRaw False (Border 10 0 10 10) True (Border 10 10 10 10) True

--xmobar settings.
myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = xmobarColor "#44475a" ""  " • "
    , ppCurrent         = xmobarColor "#00ffff" "" . wrap " " "" . xmobarBorder "Top" "#00ffff" 2
    , ppHidden          = xmobarColor "#bbbbbb" "" . wrap " " ""
    , ppHiddenNoWindows = xmobarColor "#bbbbbb" "" . wrap " " ""
    , ppTitle           = xmobarColor "#bd93f9" "" 
    , ppLayout          = xmobarColor "#8be9fd" ""
    }


