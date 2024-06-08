# Lightning Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":1}}}] run tag @e[type=arrow,distance=0..2] add lightning_arrow

execute at @e[tag=lightning_arrow,nbt={inGround:1b}] run summon minecraft:lightning_bolt ~ ~ ~

# execute at @e[type=arrow,nbt={inGround:1b}] run summon minecraft:lightning_bolt ~ ~ ~
# kill @e[type=arrow,nbt={inGround:1b}]

# execute as @e[type=arrow,tag=lightning_arrow] at @s run data merge entity @s {NoGravity:1b}

kill @e[tag=lightning_arrow,nbt={inGround:1b}]

# ----------------------------------------------

# Teleport Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run tag @e[type=arrow,distance=0..2] add teleport_arrow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run tag @e[type=player,distance=0..1,limit=1] add teleporter

execute as @e[type=player,tag=teleporter,limit=1] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run teleport @e[type=player,tag=teleporter,limit=1] @e[type=arrow,tag=teleport_arrow,limit=1]

# execute as @e[type=arrow,tag=teleport_arrow] at @s run data merge entity @s {NoGravity:1b}

execute at @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run playsound minecraft:entity.enderman.teleport hostile @e[type=player,distance=0..10] ~ ~ ~ 100

execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run kill @e[tag=teleport_arrow]

execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run kill @e[type=arrow]

kill @e[tag=teleport_arrow,nbt={inGround:1b}]

tag @a remove teleporter

# ----------------------------------------------


# Explosive Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run tag @e[type=arrow,distance=0..2] add explosive_arrow

# execute as @e[type=arrow,tag=explosive_arrow] at @s run data merge entity @s {NoGravity:1b}

# execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run fill ~ ~ ~ ~ ~ ~ tnt

# execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run fill ~ ~1 ~ ~ ~1 ~ fire

execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run summon minecraft:tnt ~ ~ ~ {Fuse:0, ExplosionRadius:5}

kill @e[tag=explosive_arrow,nbt={inGround:1b}]

# ----------------------------------------------
