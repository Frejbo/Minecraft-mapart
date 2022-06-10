extends Node
var minecraft_map_colors = [
	[Color(127, 178, 56), "Grass Block, Slime Block"],
	[Color(247, 233, 163), "Sand, Birch Planks, Birch Log (vertical), Stripped Birch Log, Birch Wood, Stripped Birch Wood, Birch Sign, Birch Pressure Plate, Birch Trapdoor, Birch Stairs, Birch Slab, Birch Fence Gate, Birch Fence, Birch Door, Sandstone (All variants; all slabs; all stairs; all walls), Glowstone, End Stone, End Stone Bricks (slab; stairs; wall), Bone Block, Turtle Egg, Scaffolding, Candle, Ochre Froglight"],
	[Color(199, 199, 199), "Cobweb, Mushroom Stem, Bed (head), White Candle"],
	[Color(255, 0, 0), "Lava, TNT, Fire, Redstone Block"],
	[Color(160, 160, 255), "Ice, Frosted Ice, Packed Ice, Blue Ice"],
	[Color(167, 167, 167), "Block of Iron, Iron Door, Brewing Stand, Heavy Weighted Pressure Plate, Iron Trapdoor, Lantern, Anvil, Grindstone, Soul Fire Lantern, Lodestone"],
	[Color(0, 124, 0), "Sapling, Flowers, Wheat, Sugar Cane, Pumpkin Stem, Melon Stem, Lily Pad, Cocoa, Carrots, Potatoes, Beetroots, Sweet Berry Bush, Grass, Fern, Vines, Leaves, Cactus, Bamboo, Cave Vines, Spore Blossom, (Flowering) Azalea, Dripleaf (big and small)"],
	[Color(255, 255, 255), "Snow, Snow Block, White Bed (foot), White Wool, White Stained Glass, White Carpet, White Shulker Box, White Glazed Terracotta, White Concrete, White Concrete Powder, Powder Snow"],
	[Color(164, 168, 184), "Clay, Infested Block (not including infested Deepslate)"],
	[Color(151, 109, 77), "Dirt, Coarse Dirt, Farmland, Dirt Path, Granite (slab; stairs; wall), Polished Granite (slab; stairs), Jungle Planks, Jungle Log (vertical), Stripped Jungle Log, Jungle Wood, Stripped Jungle Wood, Jungle Sign, Jungle Pressure Plate, Jungle Trapdoor, Jungle Stairs, Jungle Slab, Jungle Fence Gate, Jungle Fence, Jungle Door, Jukebox, Brown Mushroom Block, Rooted Dirt, Hanging Roots, Packed Mud"],
	[Color(112, 112, 112), "Stone (slab; stairs), Andesite (slab; stairs; wall), Polished Andesite (slab; stairs), Cobblestone (slab; stairs; wall), Bedrock, Gold Ore, Iron Ore, Coal Ore, Lapis Lazuli Ore, Dispenser, Mossy Cobblestone (slab; stairs; wall), Spawner, Diamond Ore, Furnace, Stone Pressure Plate, Redstone Ore, Stone Bricks (all variants; all slabs; all stairs; all walls), Emerald Ore, Ender Chest, Dropper, Smooth Stone (slab), Observer, Smoker, Blast Furnace, Stonecutter, Sticky Piston, Piston, Piston Head, Gravel, Acacia Log, Cauldron (including cauldrons with water; lava; or powdered snow), Hopper, Copper Ore"],
	[Color(64, 64, 255), "Kelp, Seagrass, Water, Bubble Column, Waterlogged Leaves"],
	[Color(143, 119, 72), "Oak Planks, Oak Log (vertical), Stripped Oak Log, Oak Wood, Stripped Oak Wood, Oak Sign, Oak Door, Oak Pressure Plate, Oak Fence, Oak Trapdoor, Oak Fence Gate, Oak Slab, Oak Stairs, Note Block, Bookshelf, Chest, Crafting Table, Trapped Chest, Daylight Detector, Loom, Barrel, Cartography Table, Fletching Table, Lectern, Smithing Table, Composter, Bamboo Sapling, Dead Bush, Petrified Oak Slab, Beehive, Banners (all colors; when not as markers)"],
	[Color(255, 252, 245), "Diorite (stairs; slab; wall), Polished Diorite (stairs; slab), Birch Log, Quartz Block (all variants; all slabs; all stairs), Sea Lantern, Target"],
	[Color(216, 127, 51), "Acacia Planks, Acacia Log (vertical), Stripped Acacia Log, Stripped Acacia Wood, Acacia Sign, Acacia Trapdoor, Acacia Slab, Acacia Stairs, Acacia Pressure Plate, Acacia Fence Gate, Acacia Fence, Acacia Door, Red Sand, Orange Wool, Orange Carpet, Orange Shulker Box, Orange Bed (foot), Orange Stained Glass, Orange Glazed Terracotta, Orange Concrete, Orange Concrete Powder, Orange Candle, Pumpkin, Carved Pumpkin, Jack o'Lantern, Terracotta, Red Sandstone (all variants; all stairs; all slabs; all walls), Honey Block, Honeycomb Block, Block of Copper (including all cut; waxed; stair; and slab variants), Lightning Rod, Block of Raw Copper"],
	[Color(178, 76, 216), "Magenta Wool, Magenta Carpet, Magenta Shulker Box, Magenta Bed (foot), Magenta Stained Glass, Magenta Glazed Terracotta, Magenta Concrete, Magenta Concrete Powder, Magenta Candle, Purpur (all variants; slab; stairs)"],
	[Color(102, 153, 216), "Light Blue Wool, Light Blue Carpet, Light Blue Shulker Box, Light Blue Bed (foot), Light Blue Stained Glass, Light Blue Glazed Terracotta, Light Blue Concrete, Light Blue Concrete Powder, Light Blue Candle, Soul Fire"],
	[Color(229, 229, 51), "Sponge, Wet Sponge, Yellow Wool, Yellow Carpet, Yellow Shulker Box, Yellow Bed (foot), Yellow Stained Glass, Yellow Glazed Terracotta, Yellow Concrete, Yellow Concrete Powder, Yellow Candle, Hay Bale, Horn Coral (Coral Block; Coral; Coral Fan), Bee Nest"],
	[Color(127, 204, 25), "Lime Wool, Lime Carpet, Lime Shulker Box, Lime Bed (foot), Lime Stained Glass, Lime Glazed Terracotta, Lime Concrete, Lime Concrete Powder, Lime Candle, Melon"],
	[Color(242, 127, 165), "Pink Wool, Pink Carpet, Pink Shulker Box, Pink Bed (foot), Pink Stained Glass, Pink Glazed Terracotta, Pink Concrete, Pink Concrete Powder, Pink Candle, Brain Coral (Coral Block; Coral; Coral Fan), Pearlescent Froglight"],
	[Color(76, 76, 76), "Acacia Wood, Gray Wool, Gray Carpet, Gray Shulker Box, Gray Bed (foot), Gray Stained Glass, Gray Glazed Terracotta, Gray Concrete, Gray Concrete Powder, Gray Candle, Dead Coral (Coral Block; Coral; Coral Fan), Tinted Glass"],
	[Color(153, 153, 153), "Light Gray Wool, Light Gray Carpet, Light Gray Shulker Box, Light Gray Bed (foot), Light Gray Stained Glass, Light Gray Banner, Light Gray Glazed Terracotta, Light Gray Concrete, Light Gray Concrete Powder, Light Gray Candle, Structure Block, Jigsaw Block"],
	[Color(76, 127, 153), "Cyan Wool, Cyan Carpet, Cyan Shulker Box, Cyan Bed (foot), Cyan Stained Glass, Cyan Glazed Terracotta, Cyan Concrete, Cyan Concrete Powder, Cyan Candle, Prismarine (slab; stairs; wall), Warped Roots, Warped Fungus, Twisting Vines, Nether Sprouts, Sculk Sensor"],
	[Color(127, 63, 178), "Shulker Box, Purple Wool, Purple Carpet, Purple Bed (foot), Purple Stained Glass, Purple Glazed Terracotta, Purple Concrete, Purple Concrete Powder, Purple Candle, Mycelium, Chorus Plant, Chorus Flower, Repeating Command Block, Bubble Coral (Coral Block; Coral; Coral Fan), Amethyst Block, Budding Amethyst, Amethyst Cluster, Amethyst Bud (all sizes)"],
	[Color(51, 76, 178), "Blue Wool, Blue Carpet, Blue Shulker Box, Blue Bed (foot), Blue Stained Glass, Blue Glazed Terracotta, Blue Concrete, Blue Concrete Powder, Blue Candle, Tube Coral (Coral Block; Coral; Coral Fan)"],
	[Color(102, 76, 51), "Dark Oak Planks, Dark Oak Log, Stripped Dark Oak Log, Dark Oak Wood, Stripped Dark Oak Wood, Dark Oak Sign, Dark Oak Pressure Plate, Dark Oak Trapdoor, Dark Oak Stairs, Dark Oak Slab, Dark Oak Fence Gate, Dark Oak Fence, Dark Oak Door, Spruce Log, Brown Wool, Brown Carpet, Brown Shulker Box, Brown Bed (foot), Brown Stained Glass, Brown Glazed Terracotta, Brown Concrete, Brown Concrete Powder, Brown Candle, Soul Sand, Command Block, Brown Mushroom, Soul Soil, Mud Brick Slab"],
	[Color(102, 127, 51), "Green Wool, Green Carpet, Green Shulker Box, Green Bed (foot), Green Stained Glass, Green Glazed Terracotta, Green Concrete, Green Concrete Powder, Green Candle, End Portal Frame, Chain Command Block, Sea Pickle, Moss Carpet, Moss Block, Dried Kelp Block"],
	[Color(153, 51, 51), "Red Wool, Red Carpet, Red Shulker Box, Red Bed (foot), Red Stained Glass, Red Glazed Terracotta, Red Concrete, Red Concrete Powder, Red Candle, Bricks (slab; stairs; wall), Red Mushroom Block, Nether Wart, Enchanting Table, Nether Wart Block, Fire Coral (Coral Block; Coral; Coral Fan), Red Mushroom, Shroomlight, Mangrove Planks, Mangrove Log (vertical), Mangrove Stripped Log, Mangrove Wood, Mangrove Stripped Wood, Mangrove Sign, Mangrove Door, Mangrove Pressure Plate, Mangrove Fence, Mangrove Trapdoor, Mangrove Fence Gate, Mangrove Slab, Mangrove Stairs"],
	[Color(25, 25, 25), "Black Wool, Black Carpet, Black Shulker Box, Black Bed (foot), Black Stained Glass, Black Glazed Terracotta, Black Concrete, Black Concrete Powder, Black Candle, Obsidian, Dragon Egg, Coal Block, Basalt, Polished Basalt, Smooth Basalt, Block of Netherite, Ancient Debris, Crying Obsidian, Respawn Anchor, Blackstone (all variants; all stairs; all slabs; all walls), Gilded Blackstone, Sculk, Sculk Vein, Sculk Catalyst, Sculk Shrieker"],
	[Color(250, 238, 77), "Block of Gold, Light Weighted Pressure Plate, Bell, Block of Raw Gold"],
	[Color(92, 219, 213), "Block of Diamond, Beacon, Prismarine Brick Slab, Prismarine Brick Stair, Dark Prismarine slab, Dark Prismarine stairs, Conduit"],
	[Color(74, 128, 255), "Block of Lapis Lazuli"],
	[Color(0, 217, 58), "Block of Emerald"],
	[Color(129, 86, 49), "Podzol, Spruce Planks, Spruce Log (vertical), Stripped Spruce Log, Spruce Wood, Stripped Spruce Wood, Spruce Sign, Spruce Pressure Plate, Spruce Trapdoor, Spruce Stairs, Spruce Slab, Spruce Fence Gate, Spruce Fence, Spruce Door, Oak Log, Jungle Log, Campfire, Soul Campfire, Mangrove Log, Mangrove Roots, Muddy Mangrove Roots"],
	[Color(112, 2, 0), "Netherrack, Nether Bricks (fence; slab; stairs; wall; chiseled; cracked), Nether Gold Ore, Nether Quartz Ore, Magma Block, Red Nether Bricks (slab; stairs; wall), Crimson Roots, Crimson Fungus), Weeping Vines"],
	[Color(209, 177, 161), "White Terracotta, Calcite"],
	[Color(159, 82, 36), "Orange Terracotta"],
	[Color(149, 87, 108), "Magenta Terracotta"],
	[Color(112, 108, 138), "Light Blue Terracotta"],
	[Color(186, 133, 36), "Yellow Terracotta"],
	[Color(103, 117, 53), "Lime Terracotta"],
	[Color(160, 77, 78), "Pink Terracotta"],
	[Color(57, 41, 35), "Gray Terracotta, Tuff"],
	[Color(135, 107, 98), "Light Gray Terracotta, Exposed Copper (including all cut; waxed; stair; and slab variants), Mud Bricks (stairs; wall)"],
	[Color(87, 92, 92), "Cyan Terracotta, Mud"],
	[Color(122, 73, 88), "Purple Terracotta, Purple Shulker Box)"],
	[Color(76, 62, 92), "Blue Terracotta"],
	[Color(76, 50, 35), "Brown Terracotta, Pointed Dripstone, Dripstone Block"],
	[Color(76, 82, 42), "Green Terracotta"],
	[Color(142, 60, 46), "Red Terracotta"],
	[Color(37, 22, 16), "Black Terracotta"],
	[Color(189, 48, 49), "Crimson Nylium"],
	[Color(148, 63, 97), "Crimson Fence, Crimson Fence Gate, Crimson Planks, Crimson Pressure Plate, Crimson Sign, Crimson Slab, Crimson Stairs, Crimson Stem, Crimson Stripped Stem, Crimson Trapdoor, Crimson Door)"],
	[Color(92, 25, 29), "Crimson Hyphae, Crimson Stripped Hyphae)"],
	[Color(22, 126, 134), "Warped Nylium, Oxidized Copper (including all cut; waxed; stair; and slab variants)"],
	[Color(58, 142, 140), "Warped Fence, Warped Fence Gate, Warped Planks, Warped Pressure Plate, Warped Sign, Warped Slab, Warped Stairs, Warped Stem, Warped Stripped Stem, Warped Trapdoor, Warped Door, Weathered Copper (including all cut; waxed; stair; and slab variants)"],
	[Color(86, 44, 62), "Warped Hyphae, Warped Stripped Hyphae)"],
	[Color(20, 180, 133), "Warped Wart Block"],
	[Color(100, 100, 100), "Deepslate Gold Ore, Deepslate Iron Ore, Deepslate Coal Ore, Deepslate Lapis Ore, Deepslate Diamond Ore, Deepslate Redstone Ore, Deepslate Emerald Ore, Deepslate Copper Ore, Deepslate (all variants; all stairs; all slabs; all walls), Infested Deepslate, Reinforced Deepslate"],
	[Color(216, 175, 147), "Block of Raw Iron"],
	[Color(127, 167, 150), "Glow Lichen, Verdant Froglight"]
]# ersätt ; med , efter separation i kod


func get_closest_color(rgb : Color):
	var r = rgb.r
	var g = rgb.g
	var b = rgb.b
	var minimum = [100, Color()]
	for color in Globals.minecraft_map_colors:
		var cr = color[0].r
		var cg = color[0].g
		var cb = color[0].b
		var color_diff = sqrt(abs(r - cr)*2 + abs(g - cg)*2 + abs(b - cb)*2)
		if color_diff < minimum[0]:
			minimum = [color_diff, Color(color[0][0], color[0][1], color[0][2], color[0][3]), color[1]]
	return [minimum[1], minimum[2]]
