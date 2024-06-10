# Lightning Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":1}}}] run tag @e[type=arrow,distance=0..2] add lightning_arrow

# execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run execute at @e[type=!player,distance=1..5] run summon minecraft:lightning_bolt ~ ~ ~

# execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run particle sonic_boom ~ ~ ~

execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run particle minecraft:electric_spark ~ ~ ~ 0.25 0.25 0.25 1 50

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":1}}}] run tag @e[type=player,distance=0..1,limit=1] add lightning_caster

execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!lightning_caster] run summon minecraft:lightning_bolt ~ ~ ~
execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!lightning_caster] run summon minecraft:lightning_bolt ~ ~ ~
execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!lightning_caster] run summon minecraft:lightning_bolt ~ ~ ~
execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!lightning_caster] run summon minecraft:lightning_bolt ~ ~ ~
execute at @e[tag=lightning_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!lightning_caster] run summon minecraft:lightning_bolt ~ ~ ~

execute at @e[type=minecraft:lightning_bolt] run kill @e[type=minecraft:arrow,tag=lightning_arrow,distance=..5]

tag @a[tag=shooter] remove lightning_caster

# execute as @e[type=arrow,tag=lightning_arrow] at @s run data merge entity @s {NoGravity:1b}

kill @e[tag=lightning_arrow,nbt={inGround:1b}]


# Teleport Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run tag @e[type=arrow,distance=0..2] add teleport_arrow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run tag @e[type=player,distance=0..1,limit=1] add teleporter

execute as @e[type=player,tag=teleporter,limit=1] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run teleport @e[type=player,tag=teleporter,limit=1] @e[type=arrow,tag=teleport_arrow,limit=1]

# execute as @e[type=arrow,tag=teleport_arrow] at @s run data merge entity @s {NoGravity:1b}

# execute at @e[tag=teleport_arrow,nbt={inGround:0b}] run particle minecraft:portal ~ ~ ~ 0.25 0.25 0.25 5 50

execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run particle minecraft:portal ~ ~1 ~ 0.25 0.25 0.25 1 200

execute at @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run playsound minecraft:entity.enderman.teleport master @e[type=player,distance=0..10] ~ ~ ~ 100

execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run kill @e[tag=teleport_arrow]

execute as @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] at @s if entity @e[type=arrow,tag=teleport_arrow,nbt={inGround:1b}] run kill @e[type=arrow]

kill @e[tag=teleport_arrow,nbt={inGround:1b}]

tag @a remove teleporter


# Explosive Bow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run tag @e[type=arrow,distance=0..2] add explosive_arrow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run execute as @a[nbt=!{Inventory:[{Slot:-106b}]}] run item replace entity @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] weapon.offhand with minecraft:totem_of_undying
# execute as @e[type=arrow,tag=explosive_arrow] at @s run data merge entity @s {NoGravity:1b}

# execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run fill ~ ~ ~ ~ ~ ~ tnt

# execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run fill ~ ~1 ~ ~ ~1 ~ fire

execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}


execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run setblock ~ ~1 ~ tnt

execute at @e[tag=explosive_arrow,nbt={inGround:1b}] run summon minecraft:tnt ~ ~ ~ {Fuse:0, ExplosionRadius:5}

kill @e[tag=explosive_arrow,nbt={inGround:1b}]


# Cobweb Bow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":4}}}] run tag @e[type=arrow,distance=0..2] add cobweb_arrow

# execute at @e[tag=cobweb_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5] run fill ~1 ~2 ~1 ~-1 ~ ~-1 minecraft:cobweb replace air

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":4}}}] run tag @e[type=player,distance=0..1,limit=1] add web_shooter

execute at @e[tag=cobweb_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!web_shooter] run fill ~1 ~2 ~1 ~-1 ~ ~-1 minecraft:cobweb replace air

tag @a[tag=shooter] remove web_shooter

execute at @e[type=arrow,tag=cobweb_arrow,nbt={inGround:1b}] run playsound minecraft:entity.parrot.imitate.spider master @e[type=player,distance=0..10] ~ ~ ~ 100

kill @e[tag=cobweb_arrow,nbt={inGround:1b}]

# Cobweb Tunnel Bow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":5}}}] run tag @e[type=arrow,distance=0..2] add cobweb_tunnel_arrow

# execute at @e[tag=cobweb_tunnel_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5] run fill ~ ~ ~ ~ ~ ~ minecraft:cobweb replace air

# execute at @e[tag=cobweb_tunnel_arrow,nbt={inGround:0b}] run execute at @e[distance=1..3] run fill ~3 ~-1 ~3 ~-3 -63 ~-3 minecraft:air

# execute at @e[tag=cobweb_tunnel_arrow,nbt={inGround:0b}] run execute at @e[distance=1..3] run fill ~3 -64 ~3 ~-3 -64 ~-3 minecraft:cobweb

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":5}}}] run tag @e[type=player,distance=0..1,limit=1] add web_tunnel_digger

execute at @e[tag=cobweb_tunnel_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!web_tunnel_digger] run fill ~3 ~-1 ~3 ~-3 -63 ~-3 minecraft:air

execute at @e[tag=cobweb_tunnel_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!web_tunnel_digger] run fill ~ ~ ~ ~ ~ ~ minecraft:cobweb replace air

execute at @e[tag=cobweb_tunnel_arrow,nbt={inGround:0b}] run execute at @e[distance=1..5,tag=!web_tunnel_digger] run fill ~3 -64 ~3 ~-3 -64 ~-3 minecraft:cobweb

tag @a[tag=shooter] remove web_tunnel_digger

execute at @e[type=arrow,tag=cobweb_tunnel_arrow,nbt={inGround:1b}] run playsound minecraft:entity.parrot.imitate.spider master @e[type=player,distance=0..10] ~ ~ ~ 100

execute at @e[type=arrow,tag=cobweb_tunnel_arrow,nbt={inGround:1b}] run playsound minecraft:block.stone.break master @e[type=player,distance=0..10] ~ ~ ~ 100

kill @e[tag=cobweb_tunnel_arrow,nbt={inGround:1b}]

# Calamity's Call Bow

execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":6}}}] run tag @e[type=arrow,distance=0..2] add calamity_arrow

execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~ ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~ ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~ ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~ ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~ ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~ ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~ ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~ ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~ ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~ ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~ ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~ ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~ ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~ ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~ ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~ ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~ ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~ ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~ ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~ ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~ ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~ ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~ ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~ ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~ ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~ ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~ ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~ ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~ ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~ ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~ ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~ ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~ ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~ ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~ ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~ ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~ ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~ ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~ ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~ ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~ ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~ ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~ ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~ ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~ ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~ ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~ ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~ ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~ ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~ ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~ ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~ ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~ ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~ ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~ ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~ ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~ ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~ ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~ ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~ ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~ ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~ ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~ ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~ ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~ ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~ ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~ ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~ ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~ ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~ ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~ ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~ ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~ ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~ ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~ ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~ ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~ ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~ ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~ ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~ ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~ ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~ ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~ ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~ ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~ ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~ ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~ ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~ ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~ ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~ ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~ ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~ ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~ ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~ ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~ ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~ ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~ ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~ ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~ ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~ ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~ ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~ ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~ ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~ ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~ ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~ ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~ ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~ ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~ ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~ ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~ ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~ ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~ ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~ ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~ ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~ ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~ ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~ ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~ ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~ ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~ ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~ ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~ ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~ ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~ ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~ ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~ ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~ ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~ ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~ ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~ ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~ ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~ ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~ ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~ ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~ ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~ ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~ ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~ ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~ ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~ ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~ ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~ ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~ ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~ ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~ ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~ ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~ ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~ ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~ ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~ ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~ ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~ ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~ ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~ ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~ ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~ ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~ ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~ ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~ ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~ ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~ ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~ ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~ ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~ ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~ ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~ ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~ ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~ ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~ ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~ ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~ ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~ ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~ ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~ ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~ ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~ ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~ ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~ ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~ ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~ ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~ ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~ ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~ ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~ ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~ ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~ ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~ ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~ ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~ ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~ ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~ ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~ ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~ ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~ ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~ ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~ ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~ ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~ ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~ ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~ ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~ ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-20 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-20 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-20 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-20 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-20 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-20 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-20 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-20 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-20 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-20 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-20 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-20 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-20 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-20 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-20 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-20 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-20 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-20 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-20 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-20 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-20 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-20 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-20 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-20 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-20 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-20 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-20 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-20 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-20 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-20 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-20 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-20 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-20 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-20 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-20 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-20 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-20 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-20 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-20 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-20 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-20 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-20 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-20 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-20 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-20 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-20 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-20 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-20 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-20 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-20 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-20 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-20 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-20 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-20 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-20 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-20 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-20 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-20 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-20 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-20 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-20 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-20 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-20 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-20 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-20 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-20 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-20 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-20 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-20 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-20 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-20 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-20 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-20 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-20 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-20 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-20 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-20 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-20 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-20 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-20 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-20 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-20 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-20 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-20 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-20 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-20 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-20 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-20 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-20 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-20 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-20 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-20 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-20 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-20 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-20 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-20 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-20 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-20 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-20 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-20 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-20 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-20 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-20 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-20 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-20 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-20 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-20 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-20 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-20 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-20 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-20 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-20 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-20 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-20 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-20 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-20 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-20 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-20 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-20 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-20 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-20 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-20 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-20 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-20 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-20 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-20 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-20 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-20 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-20 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-20 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-20 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-20 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-20 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-20 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-20 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-20 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-20 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-20 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-20 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-20 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-20 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-20 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-20 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-20 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-20 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-20 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-20 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-20 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-20 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-20 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-20 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-20 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-20 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-20 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-20 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-20 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}} 
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-20 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-20 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-20 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-20 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-20 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-20 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-20 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-20 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-20 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-20 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-20 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-20 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-20 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-20 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-20 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-20 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-20 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-20 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-20 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-20 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-20 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-20 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-20 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-20 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-20 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-20 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-20 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-20 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-20 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-20 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-20 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-20 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-20 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-20 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-20 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-20 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-20 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-20 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-20 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-20 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-20 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-20 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-20 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-20 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-20 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-20 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-40 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-40 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-40 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-40 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-40 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-40 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-40 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-40 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-40 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-40 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-40 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-40 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-40 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-40 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-40 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-40 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-40 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-40 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-40 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-40 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-40 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-40 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-40 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-40 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-40 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-40 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-40 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-40 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-40 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-40 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-40 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-40 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-40 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-40 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-40 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-40 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-40 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-40 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-40 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-40 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-40 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-40 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-40 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-40 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-40 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-40 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-40 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-40 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-40 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-40 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-40 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-40 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-40 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-40 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-40 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-40 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-40 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-40 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-40 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-40 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-40 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-40 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-40 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-40 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-40 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-40 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-40 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-40 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-40 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-40 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-40 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-40 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-40 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-40 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-40 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-40 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-40 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-40 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-40 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-40 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-40 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-40 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-40 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-40 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-40 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-40 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-40 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-40 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-40 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-40 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-40 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-40 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-40 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-40 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-40 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-40 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-40 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-40 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-40 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-40 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-40 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-40 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-40 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-40 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-40 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-40 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-40 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-40 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-40 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-40 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-40 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-40 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-40 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-40 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-40 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-40 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-40 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-40 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-40 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-40 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-40 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-40 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-40 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-40 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-40 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-40 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-40 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-40 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-40 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-40 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-40 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-40 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-40 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-40 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-40 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-40 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-40 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-40 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-40 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-40 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-40 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-40 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-40 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-40 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-40 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-40 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-40 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-40 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-40 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-40 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-40 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-40 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-40 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-40 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-40 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-40 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}} 
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-40 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-40 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-40 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-40 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-40 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-40 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-40 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-40 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-40 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-40 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-40 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-40 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-40 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-40 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-40 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-40 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-40 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-40 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-40 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-40 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-40 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-40 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-40 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-40 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-40 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-40 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-40 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-40 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-40 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-40 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-40 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-40 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-40 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-40 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-40 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-40 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-40 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-40 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-40 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-40 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-40 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-40 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-40 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-40 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-40 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-40 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-60 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-60 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-60 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-60 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-60 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-60 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-60 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-60 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-60 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-60 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-60 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-60 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-60 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-60 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-60 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-60 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-60 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-60 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-60 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-60 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-60 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-60 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-60 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-60 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-60 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-60 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-60 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-60 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-60 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-60 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-60 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-60 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-60 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-60 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-60 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-60 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-60 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-60 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-60 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-60 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-60 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-60 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-60 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-60 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-60 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-60 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-60 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-60 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-60 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-60 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-60 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-60 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-60 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-60 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-60 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-60 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-60 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-60 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-60 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-60 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-60 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-60 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-60 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-60 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-60 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-60 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-60 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-60 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-60 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-60 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-60 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-60 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-60 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-60 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-60 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-60 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-60 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-60 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-60 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-60 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-60 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-60 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-60 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-60 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-60 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-60 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-60 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-60 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-60 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-60 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-60 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-60 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-60 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-60 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-60 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-60 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-60 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-60 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-60 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-60 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-60 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-60 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-60 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-60 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-60 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-60 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-60 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-60 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-60 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-60 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-60 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-60 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-60 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-60 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-60 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-60 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-60 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-60 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-60 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-60 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-60 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-60 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-60 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-60 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-60 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-60 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-60 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-60 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-60 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-60 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-60 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-60 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-60 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-60 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-60 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-60 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-60 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-60 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-60 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-60 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-60 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-60 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-60 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-60 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-60 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-60 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-60 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-60 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-60 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-60 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-60 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-60 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-60 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-60 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-60 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-60 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}} 
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-60 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-60 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-60 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-60 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-60 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-60 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-60 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-60 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-60 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-60 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-60 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-60 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-60 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-60 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-60 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-60 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-60 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-60 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-60 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-60 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-60 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-60 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-60 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-60 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-60 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-60 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-60 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-60 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-60 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-60 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-60 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-60 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-60 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-60 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-60 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-60 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-60 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-60 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-60 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-60 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-60 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-60 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-60 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-60 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-60 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-60 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-80 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-80 ~1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~1 ~-80 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-1 ~-80 ~-1 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-80 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-80 ~2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~2 ~-80 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-2 ~-80 ~-2 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-80 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-80 ~3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~3 ~-80 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-3 ~-80 ~-3 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-80 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-80 ~4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~4 ~-80 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-4 ~-80 ~-4 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-80 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-80 ~5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~5 ~-80 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-5 ~-80 ~-5 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-80 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-80 ~6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~6 ~-80 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-6 ~-80 ~-6 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-80 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-80 ~7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~7 ~-80 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-7 ~-80 ~-7 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-80 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-80 ~8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~8 ~-80 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-8 ~-80 ~-8 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-80 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-80 ~9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~9 ~-80 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-9 ~-80 ~-9 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-80 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-80 ~10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~10 ~-80 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-10 ~-80 ~-10 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-80 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-80 ~11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~11 ~-80 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-11 ~-80 ~-11 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-80 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-80 ~12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~12 ~-80 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-12 ~-80 ~-12 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-80 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-80 ~13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~13 ~-80 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-13 ~-80 ~-13 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-80 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-80 ~14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~14 ~-80 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-14 ~-80 ~-14 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-80 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-80 ~15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~15 ~-80 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-15 ~-80 ~-15 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-80 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-80 ~16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~16 ~-80 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-16 ~-80 ~-16 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-80 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-80 ~17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~17 ~-80 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-17 ~-80 ~-17 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-80 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-80 ~18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~18 ~-80 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-18 ~-80 ~-18 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-80 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-80 ~19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~19 ~-80 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-19 ~-80 ~-19 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-80 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-80 ~20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~20 ~-80 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-20 ~-80 ~-20 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-80 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-80 ~21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~21 ~-80 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-21 ~-80 ~-21 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-80 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-80 ~22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~22 ~-80 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-22 ~-80 ~-22 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-80 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-80 ~23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~23 ~-80 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-23 ~-80 ~-23 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-80 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-80 ~24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~24 ~-80 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-24 ~-80 ~-24 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-80 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-80 ~25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~25 ~-80 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-25 ~-80 ~-25 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-80 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-80 ~26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~26 ~-80 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-26 ~-80 ~-26 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-80 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-80 ~27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~27 ~-80 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-27 ~-80 ~-27 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-80 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-80 ~28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~28 ~-80 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-28 ~-80 ~-28 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-80 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-80 ~29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~29 ~-80 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-29 ~-80 ~-29 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-80 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-80 ~30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~30 ~-80 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-30 ~-80 ~-30 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-80 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-80 ~31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~31 ~-80 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-31 ~-80 ~-31 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-80 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-80 ~32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~32 ~-80 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-32 ~-80 ~-32 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-80 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-80 ~33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~33 ~-80 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-33 ~-80 ~-33 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-80 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-80 ~34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~34 ~-80 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-34 ~-80 ~-34 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-80 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-80 ~35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~35 ~-80 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-35 ~-80 ~-35 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-80 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-80 ~36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~36 ~-80 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-36 ~-80 ~-36 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-80 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-80 ~37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~37 ~-80 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-37 ~-80 ~-37 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-80 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-80 ~38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~38 ~-80 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-38 ~-80 ~-38 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-80 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-80 ~39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~39 ~-80 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-39 ~-80 ~-39 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}} 
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-80 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-80 ~40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~40 ~-80 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-40 ~-80 ~-40 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-80 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-80 ~41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~41 ~-80 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-41 ~-80 ~-41 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-80 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-80 ~42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~42 ~-80 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-42 ~-80 ~-42 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-80 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-80 ~43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~43 ~-80 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-43 ~-80 ~-43 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-80 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-80 ~44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~44 ~-80 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-44 ~-80 ~-44 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-80 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-80 ~45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~45 ~-80 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-45 ~-80 ~-45 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-80 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-80 ~46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~46 ~-80 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-46 ~-80 ~-46 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-80 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-80 ~47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~47 ~-80 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-47 ~-80 ~-47 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-80 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-80 ~48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~48 ~-80 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-48 ~-80 ~-48 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-80 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-80 ~49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~49 ~-80 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-49 ~-80 ~-49 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-80 ~ {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~ ~-80 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-80 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-80 ~50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~50 ~-80 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}
# execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon fireball ~-50 ~-80 ~-50 {ExplosionPower:127b,direction:[0.0,0.0,0.0],Item:{id:"minecraft:tnt",count:1}}

execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run setblock ~ ~1 ~ tnt

execute at @e[tag=calamity_arrow,nbt={inGround:1b}] run summon minecraft:tnt ~ ~ ~ {Fuse:0, ExplosionRadius:5}

kill @e[tag=calamity_arrow,nbt={inGround:1b}]
