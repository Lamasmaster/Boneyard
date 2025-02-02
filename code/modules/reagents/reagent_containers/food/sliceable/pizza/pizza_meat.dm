/obj/item/chems/food/sliceable/pizza/meatpizza
	name = "meatpizza"
	desc = "A pizza with meat topping."
	slice_path = /obj/item/chems/food/slice/pizza/meat
	nutriment_amt = 10
	icon = 'icons/obj/food/pizzas/pizza_meat.dmi'

/obj/item/chems/food/sliceable/pizza/meatpizza/populate_reagents()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/protein,  34)
	reagents.add_reagent(/decl/material/liquid/nutriment/barbecue, 6)

/obj/item/chems/food/slice/pizza/meat
	name = "meatpizza slice"
	desc = "A slice of a meaty pizza."
	icon_state = "meatpizzaslice"
	whole_path = /obj/item/chems/food/sliceable/pizza/meatpizza

/obj/item/chems/food/slice/pizza/meat/filled
	filled = TRUE
