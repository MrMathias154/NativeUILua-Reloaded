--[[
  _   _       _   _           _   _ ___ _
 | \ | | __ _| |_(_)_   _____| | | |_ _| |   _   _  __ _
 |  \| |/ _` | __| \ \ / / _ \ | | || || |  | | | |/ _` |
 | |\  | (_| | |_| |\ V /  __/ |_| || || |__| |_| | (_| |
 |_| \_|\__,_|\__|_| \_/ \___|\___/|___|_____\__,_|\__,_|~GTA:O UI Menu

 Owner : Frazzle

 Git : iTexZoz/NativeUILua

 =Releases history 2018 - 2019

 [1.0]
 -Initial comit

 [1.0.1]
 -Fixed __resource.lua

 [1.0.2]
 -Fixed the NativeUI.* functions not working as intended

 [1.0.3]
 -Fixed a typo that prevented safezone scaling

 [1.0.4]
 -Fixed mouse tracking that broke after fixing my safezone type..

 [1.0.5 ]
 -Added support for all resolutions!

 [1.0.6]
 -Fixed item events
 -Added a Colours table filled with the HUD colours
 -Fixed mouse on resolutions below 1280x720
 -Added text colour and highlight colour options to the :RightLabel() on UIMenuItem

 [1.0.7]
 -Conflicting function name

 [1.0.8]
 -Fixed resolution scaling on resolutions > 1920x1080

 [1.0.9]
 -Removed all mentions of a function that is no longer used and breaks the script

 [1.1.0]
 -Fixed scaling on 3840x1080

 [2.0.0]
 -Lots of bug fixes
 -Panels
 -Windows

 [2.1.0]
 -More bug fixes related to resolution and positioning.
 -Added UIMenuProgressItem item

 [2.1.1]
 -Diverses résolutions de bugs (comme les UIMenuColouredItem)
 -Divers ajouts tel que le UIMenuSliderHeritageItem et bien d'autres...
 -Quelques résolutions de problèmes mineurs au niveau de l'interface tel que les "arrowleft" / "arrowright" de UIMenuListItem.
 -Quelques ajouts de configurations supplémentaires pour certains éléments.
 -Un exemple complet de toutes les features disponibles dans cette version.
 -Modifications de certains bruits sonores du menu lors de l'utilisation des sliders.
 -Modification possible de la couleur/opacité de la banière du menu et des sliders.
 -Possibilité d'ajouter des badges et des labels sur les submenus.
 -Possibilité de modifier la couleur/opacité du background et de la barre de progression.

 [2.1.2]
 ...

 --TODO Ajout d'un systeme d'actualisation de badge dynamique, (comme warmenu)
 --TODO Ajout de badge custome possible.
 --TODO Resoudre des problémes mineurs sur l'interface.
 --TODO ...
]]--



NativeUI = {}

---CreatePool
function NativeUI.CreatePool()
    return MenuPool.New()
end

---CreateMenu
---@param Title string
---@param Subtitle string
---@param X number
---@param Y number
---@param TxtDictionary string
---@param TxtName string
---@param Heading number
---@param R number
---@param G number
---@param B number
---@param A number
function NativeUI.CreateMenu(Title, Subtitle, X, Y, TxtDictionary, TxtName, Heading, R, G, B, A)
    return UIMenu.New(Title, Subtitle, X, Y, TxtDictionary, TxtName, Heading, R, G, B, A)
end

---CreateItem
---@param Text string
---@param Description string
function NativeUI.CreateItem(Text, Description)
    return UIMenuItem.New(Text, Description)
end

---CreateColouredItem
---@param Text string
---@param Description string
---@param MainColour table
---@param HighlightColour table
function NativeUI.CreateColouredItem(Text, Description, MainColour, HighlightColour)
    return UIMenuColouredItem.New(Text, Description, MainColour, HighlightColour)
end

---CreateCheckboxItem
---@param Text string
---@param Check boolean
---@param Description string
function NativeUI.CreateCheckboxItem(Text, Check, Description)
    return UIMenuCheckboxItem.New(Text, Check, Description)
end

---CreateListItem
---@param Text string
---@param Items number
---@param Index table
---@param Description string
function NativeUI.CreateListItem(Text, Items, Index, Description)
    return UIMenuListItem.New(Text, Items, Index, Description)
end

---CreateSliderItem
---@param Text string
---@param Items number
---@param Index table
---@param Description string
---@param Divider boolean
---@param SliderColors table
---@param BackgroundSliderColors table
function NativeUI.CreateSliderItem(Text, Items, Index, Description, Divider, SliderColors, BackgroundSliderColors)
    return UIMenuSliderItem.New(Text, Items, Index, Description, Divider, SliderColors, BackgroundSliderColors)
end
---CreateSliderHeritageItem
---@param Text string
---@param Items number
---@param Index table
---@param Description string
---@param SliderColors table
---@param BackgroundSliderColors table
function NativeUI.CreateSliderHeritageItem(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
    return UIMenuSliderHeritageItem.New(Text, Items, Index, Description, SliderColors, BackgroundSliderColors)
end

---CreateProgressItem
---@param Text string
---@param Items number
---@param Index table
---@param Description number
---@param Counter boolean
function NativeUI.CreateProgressItem(Text, Items, Index, Description, Counter)
    return UIMenuProgressItem.New(Text, Items, Index, Description, Counter)
end

---CreateHeritageWindow
---@param Mum number
---@param Dad number
function NativeUI.CreateHeritageWindow(Mum, Dad)
    return UIMenuHeritageWindow.New(Mum, Dad)
end

---CreateGridPanel
---@param TopText string
---@param LeftText string
---@param RightText string
---@param BottomText string
function NativeUI.CreateGridPanel(TopText, LeftText, RightText, BottomText)
    return UIMenuGridPanel.New(TopText, LeftText, RightText, BottomText)
end

---CreateColourPanel
---@param Title string
---@param Colours table
function NativeUI.CreateColourPanel(Title, Colours)
    return UIMenuColourPanel.New(Title, Colours)
end

---CreatePercentagePanel
---@param MinText string
---@param MaxText string
function NativeUI.CreatePercentagePanel(MinText, MaxText)
    return UIMenuPercentagePanel.New(MinText, MaxText)
end

---CreateSprite
---@param TxtDictionary string
---@param TxtName string
---@param X number
---@param Y number
---@param Width number
---@param Height number
---@param Heading number
---@param R number
---@param G number
---@param B number
---@param A number
function NativeUI.CreateSprite(TxtDictionary, TxtName, X, Y, Width, Height, Heading, R, G, B, A)
    return Sprite.New(TxtDictionary, TxtName, X, Y, Width, Height, Heading, R, G, B, A)
end

---CreateRectangle
---@param X number
---@param Y number
---@param Width number
---@param Height number
---@param R number
---@param G number
---@param B number
---@param A number
function NativeUI.CreateRectangle(X, Y, Width, Height, R, G, B, A)
    return UIResRectangle.New(X, Y, Width, Height, R, G, B, A)
end

---CreateText
---@param Text string
---@param X number
---@param Y number
---@param Scale number
---@param R number
---@param G number
---@param B number
---@param A number
---@param Font number
---@param Alignment number
---@param DropShadow number
---@param Outline number
---@param WordWrap number
function NativeUI.CreateText(Text, X, Y, Scale, R, G, B, A, Font, Alignment, DropShadow, Outline, WordWrap)
    return UIResText.New(Text, X, Y, Scale, R, G, B, A, Font, Alignment, DropShadow, Outline, WordWrap)
end