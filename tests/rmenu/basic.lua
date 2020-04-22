---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Malandain.
--- DateTime: 20/12/2019 19:07
---

RMenu.Add('showcase', 'main', RageUI.CreateMenu("RageUI", "Undefined for using SetSubtitle"))
RMenu:Get('showcase', 'main'):SetSubtitle("~b~RAGEUI SHOWCASE")
RMenu:Get('showcase', 'main').EnableMouse = false
RMenu:Get('showcase', 'main').Closed = function()
    -- TODO Perform action
end;

RMenu.Add('showcase', 'submenu', RageUI.CreateSubMenu(RMenu:Get('showcase', 'main'), "RageUI", "~b~RAGEUI SHOWCASE", nil, nil, "root_cause", "shopui_title_dynasty8"))
RMenu:Get('showcase', 'submenu').EnableMouse = true
RMenu:Get('showcase', 'submenu').Closed = function()
    -- TODO Perform action
end;

RMenu.Add('submenu', 'badges', RageUI.CreateSubMenu(RMenu:Get('showcase', 'main'), "RageUI", "~b~RageUI.BadgeStyle"))
---@type table
local foods = {
    "Banana",
    "Apple",
    "Pizza",
    "Quartilicious",
    "Steak",
    0xF00D,
}

local index = {
    ketchup = false;
    dish = 1;
    quantity = 0;
    panel = {
        percentage = 0.5
    },
    colored = { [1] = 1, [2] = 1 }
}

local HeritageShape = {
    h = 0.5,
    i = 5
}

---@type string
local description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

RageUI.CreateWhile(1.0, RMenu:Get('showcase', 'main'), 51, function()

    RageUI.IsVisible(RMenu:Get('showcase', 'main'), true, true, true, function()
        --- Items
        RageUI.Checkbox("Add ketchup ?", "Do you wish to add ketchup ?", index.ketchup, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
            if (Selected) then
                RageUI.Text({
                    message = string.format("~r~Ketchup status: ~b~%s", tostring(index.ketchup))
                })
            end
            index.ketchup = Checked;
        end)

        RageUI.List("Food", foods, index.dish, "Select the type of food you want to eat.", {}, true, function(Hovered, Active, Selected, Index)
            if (Active) then
                RageUI.Text({
                    message = string.format("Preparing ~b~%s~w~...", foods[index.dish])
                })
            end
            index.dish = Index;
        end, function(Index, CurrentItems)
            print(Index, CurrentItems)
        end, {
            RMenu:Get('showcase', 'main'),
            RMenu:Get('showcase', 'submenu'),
            RMenu:Get('submenu', 'badges'),
            RMenu:Get('showcase', 'submenu'),
            RMenu:Get('submenu', 'badges'),
            RMenu:Get('showcase', 'submenu')
        })

        RageUI.Slider("Quantity", index.quantity, 10, "Select the amount of food you want to eat.", false, { }, true, function(Hovered, Selected, Active, Index)
            if (Selected) then
                RageUI.Text({
                    message = string.format("Preparing ~r~%s ~b~%s(s)~w~...", index.quantity, foods[index.dish])
                })
            end
            index.quantity = Index;
        end)

        RageUI.Button("Cook !", "Cook the dish with the appropriate ingredients and ketchup.", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
            if (Selected) then
                local string = string.format("You have ordered ~r~%s ~b~%s(s)~w~ ~r~with~w~ ketchup.", index.quantity, foods[index.dish])
                if not (index.ketchup) then
                    string = string.format("You have ordered ~r~%s ~b~%s(s)~w~ ~r~without~w~ ketchup.", index.quantity, foods[index.dish])
                end
                RageUI.Text({
                    message = string;
                })
            end
        end)

        RageUI.Button("Another Menu", description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            if (Selected) then

            end
        end, RMenu:Get('showcase', 'submenu'))

        RageUI.Button("RageUI.BadgeStyle", description, { RightLabel = "→→→" }, true, function()
        end, RMenu:Get('submenu', 'badges'))
                
        RageUI.UISliderHeritage("Ressemblance", HeritageShape.i, "Déterminez de quel parent vous tenez le plus.", function(Hovered, Selected, Active, Heritage, Index)
            if (Selected) then
                if (HeritageShape.h ~= Heritage) then
                    HeritageShape.h = Heritage
                    HeritageShape.i = Index
                end
            end
        end, 0.01) -- Default 0.1 / Can be nil

    end, function()
        ---Panels

    end)

    RageUI.IsVisible(RMenu:Get('showcase', 'submenu'), false, false, true, function()
        --- Items
        for i = 1, 100 do
            RageUI.Button(string.format("Items - %s", i), description, {}, true, function(Hovered, Active, Selected)
                if (Selected) then

                end
            end)
        end
    end, function()
        ---Panels
        RageUI.GridPanelHorizontal(0.5, "Ouverts", "Plissés", function(Hovered, Active, X)
            -- TODO Implemented working
        end, 1)

        RageUI.GridPanel(0.5, 0.5, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
            -- TODO Implemented working
        end, 2)

        RageUI.GridPanelVertical(0.5, "Ouverts", "Plissés", function(Hovered, Active, Y)
            -- TODO Implemented working
        end, 4)

        RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, index.colored[1], index.colored[2] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
            -- TODO Implemented working
            if (Active) then
                index.colored[2] = CurrentIndex - 1
                index.colored[1] = MinimumIndex
            end
        end, 5)

        RageUI.PercentagePanel(index.panel.percentage, "Percentage", nil, nil, function(Hovered, Active, Percent)
            if (Active) then

            end
            index.panel.percentage = Percent
        end, 7)

        RageUI.StatisticPanel(0.9, "Weapon MK2", 7)
        RageUI.StatisticPanel(0.6, "Weapon", 7)
    end)

    RageUI.IsVisible(RMenu:Get('submenu', 'badges'), true, true, true, function()
        --- Items
        for BadgeName, Badge in pairs(RageUI.BadgeStyle) do
            RageUI.Button(string.format("RageUI.BadgeStyle.%s", BadgeName), nil, { RightBadge = Badge, LeftBadge = Badge }, true, function(Hovered, Active, Selected)
            end)
        end
    end, function()
    end)
end)
