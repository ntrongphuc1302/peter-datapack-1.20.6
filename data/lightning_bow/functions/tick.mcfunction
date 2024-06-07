# This functions run every tick

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":1}}}] run tag @e[type=arrow,distance=0..2] add lightning_arrow

execute at @e[tag=lightning_arrow,nbt={inGround:1b}] run summon minecraft:lightning_bolt ~ ~ ~

kill @e[tag=lightning_arrow,nbt={inGround:1b}]

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":1}}}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:arrow"}]}] run give @s minecraft:arrow 1