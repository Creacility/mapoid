
mapoid = {};

mapoid.onNewGame = function(playerObj, square)

	playerObj:getInventory():AddItem("Mapoid.PlayerMap");
	playerObj:getInventory():AddItem("Base.Pen");
	playerObj:getInventory():AddItem("Base.SheetPaper2");

end

mapoid.doBuildMenu = function(player, context, items)

	local playermap = nil;
	local mapCopy = nil;

	for i,v in ipairs(items) do
        testItem = v;
        if not instanceof(v, "InventoryItem") then
            --print(#v.items);
            if #v.items == 2 then
                editItem = v.items[1];
            end
            testItem = v.items[1];
        else
            editItem = v
        end
		if testItem:getType() == "PlayerMap" then
			playermap = testItem;
        end
        if testItem:getType() == "MapCopy" then
            mapCopy = testItem;
        end
	end

    if playermap then
        context:addOption("Look at map", playermap, mapoid.onCheckMap, player);
    end
	
    if mapCopy then
        context:addOption("Look at map", mapCopy, mapoid.onCheckCopiedMap, player);
		context:addOption("Copy to own map", mapCopy, mapoid.onCopyToOwnMap, player);
    end	

end

mapoid.onCheckMap = function(map, player)

end;

mapoid.onCheckCopiedMap = function(map, player)

end;

mapoid.onCopyToOwnMap = function(map, player)

end;

Events.OnNewGame.Add(mapoid.onNewGame);
Events.OnFillInventoryObjectContextMenu.Add(mapoid.doBuildMenu);