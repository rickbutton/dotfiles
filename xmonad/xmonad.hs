import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import Control.Monad
import XMonad.Actions.CycleWS
import XMonad.Hooks.SetWMName
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO

myTerminal = "urxvt"

myWorkspaces = ["main", "web", "tunes", "mail"]

myManageHook = composeAll . concat $
  [
    [ className =? b --> viewShift "web" | b <- myClassWebShifts ]
  , [ className =? b --> viewShift "tunes" | b <- myClassTunesShifts ]
  , [ className =? b --> doFloat | b <- myClassFloatShifts ]
  ]
  where
    viewShift = doF . liftM2 (.) W.greedyView W.shift
    myClassWebShifts = ["Google-chrome"]
    myClassTunesShifts = ["Spotify"]
    myClassFloatShifts = ["emulator64-x86"]

addKeys x = [
              ((modMask x, xK_c), kill)
            , (((modMask x .|. controlMask), xK_Left), prevWS)
            , (((modMask x .|. controlMask), xK_Right), nextWS)
            , (((modMask x .|. shiftMask), xK_Left), shiftToPrev)
            , (((modMask x .|. shiftMask), xK_Right), shiftToNext)
            ]

removeKeys x  = [ 
                  (modMask x .|. shiftMask, xK_c)
                ]

strippedKeys x = foldr M.delete (keys defaultConfig x) (removeKeys x)

myKeys x = M.union (strippedKeys x) (M.fromList (addKeys x))

myFocusedBorderColor = "#1793d0"
myNormalBorderColor = "#1f1f20"

main = do
xmproc <- spawnPipe "xmobar"
xmonad $ defaultConfig
  { manageHook = myManageHook
  , layoutHook = avoidStruts  $  layoutHook defaultConfig
  , startupHook = setWMName "LG3D"
  , logHook = dynamicLogWithPP xmobarPP
              { ppOutput     = hPutStrLn xmproc
              , ppVisible      = xmobarColor "#ffffff" "" . shorten 50
              , ppCurrent      = xmobarColor "#1793d0" "" . shorten 50
              , ppTitle      = xmobarColor "#1793d0" "" . shorten 50
              }
  , terminal = myTerminal
  , workspaces = myWorkspaces
  , keys = myKeys
  , modMask = mod4Mask 
  , focusedBorderColor = myFocusedBorderColor
  , normalBorderColor = myNormalBorderColor
  } `additionalKeys`
  [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
  , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
  , ((0, xK_Print), spawn "scrot")
  , ((0, xF86XK_AudioLowerVolume), spawn "vol_down")
  , ((0, xF86XK_AudioRaiseVolume), spawn "vol_up")
  , ((0, xF86XK_AudioMute), spawn "mute_toggle")
  ]
