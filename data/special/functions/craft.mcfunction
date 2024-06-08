# Lightning Bow
execute as @e[type=item,nbt={Item:{id:"minecraft:bow",Count:1b}}] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}},limit=1,sort=nearest,distance=0..1] at @s run summon item ~ ~0.1 ~ {Tags:["lightning_bow"],Item:{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"bold":true,"color":"dark_red","text":"LightningStrike"}',Lore:['{"color":"dark_purple","text":"Peter\'s Bow"}'],Enchantments:[{id:"minecraft:infinity",lvl:1}],Unbreakable:1,CustomModelData:1}}}}

# Teleport Bow
# Explosive Bow