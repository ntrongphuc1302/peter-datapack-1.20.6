execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run tag @e[type=arrow,distance=0..2] add tnt_arrow

execute as @e[type=arrow,tag=tnt_arrow] at @s run data merge entity @s {NoGravity:1b}

# execute at @e[tag=tnt_arrow,nbt={inGround:1b}] run fill ~ ~ ~ ~ ~ ~ tnt

# execute at @e[tag=tnt_arrow,nbt={inGround:1b}] run fill ~ ~1 ~ ~ ~1 ~ fire

execute at @e[tag=tnt_arrow,nbt={inGround:1b}] run summon minecraft:tnt ~ ~ ~ {Fuse:0, ExplosionRadius:5}

kill @e[tag=tnt_arrow,nbt={inGround:1b}]

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:arrow"}]}] run give @s minecraft:arrow 1