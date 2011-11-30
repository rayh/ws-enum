# WSEnum

This project aims to provide a rich, class-based enum for Objective-C.  This allows you to implement polymorphic behaviour per-state and apply categories to the enum type.

## Example

Given we have a defined enum, we can perform things like this:

### Enumerate all enum values

	for(id enumValue in [ActivityEnum enumValues]) {
		NSLog(@"enum name %@", [enumValue name]);
	}

### Find enum by name:

	ActivityEnum *e = [ActivityEnum enumForName:@"CYCLING"];

### Find enum by ordinal: 	

	ActivtyEnum *e = [ActivityEnum enumForOrdinal:0];

	// Note that this is not necessarily the order in which the enum values are defined!

### Call polymorphic methods on the enum

	[ActivtyEnum.CYCLING numberOfCaloriesAfterTime:125];


## Defining Enums

Please take a look at ActivityEnum.h and ActivityEnum.m in the example project.
