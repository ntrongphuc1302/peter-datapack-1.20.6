# Glass of the Gods

scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time

# execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]},scores={sneak=1..}] run effect give @s minecraft:invisibility 1 0 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:hero_of_the_village 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:conduit_power 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:fire_resistance 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:invisibility 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:regeneration 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:night_vision 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:saturation 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:resistance 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..}] run effect give @s minecraft:speed 1 2 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]},scores={sneak=1..},nbt={FallFlying:1b}] run execute as @e[scores={sneak=1..}] run execute at @s run particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0.1 10

execute as @e[scores={sneak=1..}] run scoreboard players set @s sneak 0

# execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run effect give @s minecraft:water_breathing 1 255 true

# execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run effect give @s minecraft:saturation 1 255 true

# execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run effect give @s minecraft:resistance 1 255 true

# execute at @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run particle minecraft:enchant ~ ~1 ~ 0.25 0.25 0.25 1 1

execute at @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run particle minecraft:enchant ~ ~1.25 ~ 0.5 0.5 0.5 0.1 1 normal

execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass"}]}] at @s run execute at @e[distance=1..6,nbt={HurtTime:1s}] run summon minecraft:lightning_bolt ~ ~ ~


# Excalibur

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:hero_of_the_village 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:resistance 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:regeneration 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:saturation 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:conduit_power 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:night_vision 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:luck 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:fire_resistance 1 255 true

execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s minecraft:speed 1 1 true
