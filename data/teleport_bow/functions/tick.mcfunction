execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run tag @e[type=arrow,distance=0..2] add teleport_arrow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run tag @e[type=player,distance=0..1,limit=1] add teleporter

execute as @e[type=player,tag=teleporter,limit=1] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run teleport @e[type=player,tag=teleporter,limit=1] @e[type=arrow,tag=teleport_arrow,limit=1]

execute as @e[type=arrow,tag=teleport_arrow] at @s run data merge entity @s {NoGravity:1b}

execute at @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run playsound minecraft:entity.enderman.teleport hostile @e[type=player,distance=0..10] ~ ~ ~ 100

execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run kill @e[tag=teleport_arrow]

kill @e[tag=teleport_arrow,nbt={inGround:1b}]

tag @a remove teleporter

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:arrow"}]}] run give @s minecraft:arrow 1