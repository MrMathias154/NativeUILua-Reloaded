ketchup = false
dish = "Banana"
quantity = 1
_menuPool = NativeUI.CreatePool()

mainMenu = NativeUI.CreateMenu("Native UI", "~b~NATIVEUI SHOWCASE", nil, nil, nil, nil, nil, 255, 255, 255, 210)
_menuPool:Add(mainMenu)


mainMenu:AddInstructionButton({
    [1] = GetControlInstructionalButton(2, 54, 0),
    [2] = "Wsh les ami",
})

function AddMenuKetchup(menu)
    local newitem = NativeUI.CreateCheckboxItem("Add ketchup?", ketchup, "Do you wish to add ketchup?")
    menu:AddItem(newitem)
    menu.OnCheckboxChange = function(sender, item, checked_)
        if item == newitem then
            ketchup = checked_
            ShowNotification("~r~Ketchup status: ~b~" .. tostring(ketchup))
        end
    end
end

function AddMenuFoods(menu)
    local foods = {
        "Banana",
        "Apple",
        "Pizza",
        "Quartilicious",
        "Steak",
        0xF00D,
    }
    local newitem = NativeUI.CreateListItem("Food", foods, 1)
    menu:AddItem(newitem)
    menu.OnListChange = function(sender, item, index)
        if item == newitem then
            dish = item:IndexToItem(index)
            ShowNotification("Preparing ~b~" .. dish .. "~w~...")
        end
    end
end

function AddMenuFoodCount(menu)
    local amount = {}
    for i = 1, 100 do
        amount[i] = i
    end
    local newitem = NativeUI.CreateSliderItem("Quantity", amount, 1, false)
    menu:AddItem(newitem)
    menu.OnSliderChange = function(sender, item, index)
        if item == newitem then
            quantity = item:IndexToItem(index)
            ShowNotification("Preparing ~r~" .. quantity .. " ~b~" .. dish .. "(s)~w~...")
        end
    end
end

function AddMenuCook(menu)
    local badge = 1
    local newitem = NativeUI.CreateItem("Cook!", "Cook the dish with the appropriate ingredients and ketchup.")
    newitem:SetLeftBadge(BadgeStyle.Star)
    newitem:SetRightBadge(BadgeStyle.Tick)
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, index)
        if item == newitem then
            local string = "You have ordered ~r~" .. quantity .. " ~b~" .. dish .. "(s)~w~ ~r~with~w~ ketchup."
            if not ketchup then
                string = "You have ordered ~r~" .. quantity .. " ~b~" .. dish .. "(s)~w~ ~r~without~w~ ketchup."
            end
            ShowNotification(string)
            badge = badge + 1
            if (badge == 23) then
                badge = 0
            end
            if (badge == 22) then
                newitem:RightLabel('Reset badge to ~r~0')
            else
                newitem:RightLabel(nil)
            end
            newitem:SetRightBadge(badge)
        end
    end
    menu.OnIndexChange = function(sender, index)
        if sender.Items[index] == newitem then
            newitem:SetLeftBadge(BadgeStyle.None)
        end
    end
end

function AddMenuAnotherMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Another Menu")

    --submenu.SubMenu:SetMenuWidthOffset(60)
    submenu.Item:RightLabel('>>>')
    for i = 1, 69, 1 do
        submenu.SubMenu:AddItem(NativeUI.CreateItem("PageFiller - " .. i, "Sample description that takes more than one line. Moreso, it takes way more t"))
    end
end

AddMenuKetchup(mainMenu)
AddMenuFoods(mainMenu)
AddMenuFoodCount(mainMenu)
AddMenuCook(mainMenu)
AddMenuAnotherMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 51) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)
