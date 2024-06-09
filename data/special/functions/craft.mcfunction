# Lightning Bow

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["lightning_bow"],Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"LightningStrike"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Bow"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":1,"minecraft:enchantments":{levels:{"minecraft:infinity":1}}}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}},distance=..1] run playsound minecraft:entity.lightning_bolt.thunder player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=lightning_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:lightning_rod"}},sort=nearest,limit=1]

execute as @e[type=item,tag=lightning_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}},sort=nearest,limit=1]

tag @e[tag=lightning_bow,type=item] remove lightning_bow

# Teleport Bow

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["teleport_bow"],Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Dimensional Arrowcaster"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Bow"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":2,"minecraft:enchantments":{levels:{"minecraft:infinity":1}}}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},distance=..1] run playsound minecraft:entity.enderman.teleport player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=teleport_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"}},sort=nearest,limit=1]

execute as @e[type=item,tag=teleport_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}},sort=nearest,limit=1]

tag @e[tag=teleport_bow,type=item] remove teleport_bow

# Explosive Bow

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:tnt"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["explosive_bow"],Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Blastcaster"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Bow"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":3,"minecraft:enchantments":{levels:{"minecraft:infinity":1}}}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:tnt"}},distance=..1] run playsound minecraft:entity.generic.explode player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=explosive_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:tnt"}},sort=nearest,limit=1]

execute as @e[type=item,tag=explosive_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}},sort=nearest,limit=1]

tag @e[tag=explosive_bow,type=item] remove explosive_bow

# Glass

execute as @e[type=item,nbt={Item:{id:"minecraft:glass"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["crystal_glass"],Item:{id:"minecraft:glass",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Crystal Crown"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Glass"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":1}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:glass"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:diamond"}},distance=..1] run playsound minecraft:block.glass.break player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=crystal_glass,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:glass"}},sort=nearest,limit=1]

execute as @e[type=item,tag=crystal_glass,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:diamond"}},sort=nearest,limit=1]

tag @e[tag=crystal_glass,type=item] remove crystal_glass

# Elytra

execute as @e[type=item,nbt={Item:{id:"minecraft:elytra"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:firework_rocket"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["tempest_talons"],Item:{id:"minecraft:elytra",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Tempest Talons"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Elytra"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":1}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:elytra"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:firework_rocket"}},distance=..1] run playsound minecraft:entity.firework_rocket.launch player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=tempest_talons,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:elytra"}},sort=nearest,limit=1]

execute as @e[type=item,tag=tempest_talons,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:firework_rocket"}},sort=nearest,limit=1]

tag @e[tag=tempest_talons,type=item] remove tempest_talons

# Cobweb Bow

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["cobweb_bow"],Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Spider\'s Grasp"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Bow"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":4,"minecraft:enchantments":{levels:{"minecraft:infinity":1}}}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1] run playsound minecraft:entity.parrot.imitate.spider player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=cobweb_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:string"}},sort=nearest,limit=1]

execute as @e[type=item,tag=cobweb_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}},sort=nearest,limit=1]

tag @e[tag=cobweb_bow,type=item] remove cobweb_bow

# Cobweb Tunnel Bow

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:iron_shovel"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["cobweb_tunnel_bow"],Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Tunnel Buster"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Bow"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":5,"minecraft:enchantments":{levels:{"minecraft:infinity":1}}}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:iron_shovel"}},distance=..1] run playsound minecraft:entity.parrot.imitate.spider player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=cobweb_tunnel_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_shovel"}},sort=nearest,limit=1]

execute as @e[type=item,tag=cobweb_tunnel_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}},sort=nearest,limit=1]

tag @e[tag=cobweb_tunnel_bow,type=item] remove cobweb_tunnel_bow

# Calamity Bow

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..1] run summon item ~ ~0.1 ~ {Tags:["calamity_bow"],Item:{id:"minecraft:bow",count:1,components:{"minecraft:custom_name":'{"bold":true,"color":"dark_red","text":"Calamity\'s Call"}',"minecraft:lore":['{"color":"dark_purple","text":"Peter\'s Bow"}'],"minecraft:unbreakable":{},"minecraft:custom_model_data":6,"minecraft:enchantments":{levels:{"minecraft:infinity":1}}}}}

execute as @e[type=item,nbt={Item:{id:"minecraft:bow"}}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..1] run playsound minecraft:entity.generic.explode player @e[type=player,distance=0..10] ~ ~ ~ 50

execute as @e[type=item,tag=calamity_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},sort=nearest,limit=1]

execute as @e[type=item,tag=calamity_bow,nbt={Item:{}}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}},sort=nearest,limit=1]

tag @e[tag=calamity_bow,type=item] remove calamity_bow
