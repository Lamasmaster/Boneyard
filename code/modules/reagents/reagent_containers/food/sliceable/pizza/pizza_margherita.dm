/obj/item/chems/food/sliceable/pizza/margherita
	name = "margherita"
	desc = "The golden standard of pizzas."
	slice_path = /obj/item/chems/food/slice/pizza/margherita
	icon = 'icons/obj/food/pizzas/pizza_margherita.dmi'

/obj/item/chems/food/sliceable/pizza/margherita/populate_reagents()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/protein,  5)
	reagents.add_reagent(/decl/material/liquid/drink/juice/tomato, 6)

/obj/item/chems/food/slice/pizza/margherita
	name = "margherita slice"
	desc = "A slice of the classic pizza."
	icon_state = "pizzamargheritaslice"
	whole_path = /obj/item/chems/food/sliceable/pizza/margherita

/obj/item/chems/food/slice/pizza/margherita/filled
	filled = TRUE
