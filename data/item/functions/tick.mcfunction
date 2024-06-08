# Elytra
execute as @a[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra",components:{"minecraft:custom_model_data":1}}]}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:firework_rocket"}]}] run give @s firework_rocket[fireworks={flight_duration:3}] 1

# Lightning Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":1}}}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:arrow"}]}] run give @s minecraft:arrow 1

# Teleport Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":3}}}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:arrow"}]}] run give @s minecraft:arrow 1

#  TNT Bow
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",count:1,components:{"minecraft:custom_model_data":2}}}] run execute as @a[nbt=!{Inventory:[{id:"minecraft:arrow"}]}] run give @s minecraft:arrow 1