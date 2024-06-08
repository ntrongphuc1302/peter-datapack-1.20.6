# Glass

execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run effect give @s minecraft:water_breathing 1 255 true

execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run effect give @s minecraft:saturation 1 255 true

execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run effect give @s minecraft:resistance 1 255 true

execute at @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run particle minecraft:enchant ~ ~1 ~ 0.25 0.25 0.25 1 1

# ----------------------------------------------