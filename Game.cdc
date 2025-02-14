access(all) contract Game {

    // PokemonDetails
    // Description: Holds all of the static details
    // of the Pokemon. Useful as an easy container.
    access(all) struct PokemonDetails {
        access(all) let name: String
        access(all) let dateCreated: UFix64
        // fire, water, electric...
        access(all) let type: String

        init(name: String, dateCreated: UFix64, type: String) {
            self.name = name
            self.dateCreated = dateCreated
            self.type = type
        }
    }

    // Pokemon
    // Description: The actual Pokemon asset that will
    // get stored by the user and upgraded over time.
    access(all) resource Pokemon {
        access(all) let details: PokemonDetails
        access(all) var xp: Int

        init(name: String, type: String) {
            // gets the timestamp of the current block (in unix seconds)
            let currentTime: UFix64 = getCurrentBlock().timestamp
            self.details = PokemonDetails(
                name: name,
                dateCreated: currentTime,
                type: type
            )
            self.xp = 0
        }
    }

    // createPokemon
    // Description: Creates a new Pokemon using a name and type and returns
    // it back to the caller.
    // Returns: A new pokemon resource.
    access(all) fun createPokemon(name: String, type: String): @Pokemon {
        let newPokemon: @Game.Pokemon <- create Pokemon(name: name, type: type)
        return <- newPokemon
    }
}


//Resources in Cadence use the @ symbol in front of their type to say, “this is a resource.” For example: @Pokemon.
//You can only make a new resource with the create keyword. The create keyword can only ever be used inside the contract. This means you, as the developer, can control when they are made. This is not true for structs, since structs can be created outside the contract in structs and transactions.
//To move resources around you must use the <- “move” operator. In Cadence, you cannot simply use the = to put a resource somewhere. You MUST use the <- “move operator” to explicity “move” the resource around.
//You use the destroy keyword to destroy a resource (we will see this later)