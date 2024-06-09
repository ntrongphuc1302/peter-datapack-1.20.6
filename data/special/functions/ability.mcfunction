# Helmet Glass Sneak
scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time

# execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run execute as @e[scores={sneak=1..}] run effect give @s minecraft:invisibility 1 0 true
execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]}] run execute as @e[scores={sneak=1..}] run effect give @s minecraft:invisibility 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]}] run execute as @e[scores={sneak=1..}] run effect give @s minecraft:regeneration 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]}] run execute as @e[scores={sneak=1..}] run effect give @s minecraft:saturation 1 255 true

execute as @a[nbt={Inventory:[{Slot:8b,id:"minecraft:glass"}]}] run execute as @e[scores={sneak=1..}] run effect give @s minecraft:speed 1 1 true

execute as @e[scores={sneak=1..}] run scoreboard players set @s sneak 0