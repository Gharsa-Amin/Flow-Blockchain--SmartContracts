access(all) contract Game {
// will track how many Pokemon
    // have been created
    access(all) var totalPokemonCreated: Int

// create a new dictionary that stores
    // Pokemon in the contract
    access(all) let storedPokemon: @{UInt64: Pokemon}

    // PokemonDetails
    // Description: Holds all of the static details
    // of the Pokemon. Useful as an easy container.
    
    access(all) struct PokemonDetails {
         access(all) let id: UInt64
        access(all) let name: String
        access(all) let dateCreated: UFix64
        // fire, water, electric...
        access(all) let type: String

        init(id: UInt64, name: String, dateCreated: UFix64, type: String) {
            self.id = id
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
                id: self.uuid,
                name: name,
                dateCreated: currentTime,
                type: type
            )
            self.xp = 0
            // increment the totalPokemonCreated by 1
            // every time a new resource is created
            Game.totalPokemonCreated = Game.totalPokemonCreated + 1
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
 // storePokemon
    // Description: Pass in a Pokemon resource and
    // save it to the contract, mapped by its 'id'
    access(all) fun storePokemon(pokemon: @Pokemon) {
        self.storedPokemon[pokemon.details.id] <-! pokemon
    }
// getIDs
    // Returns: An array of all the
    // Pokemon 'id's stored in the contract
    access(all) fun getIDs(): [UInt64] {
        return self.storedPokemon.keys
    }

    // getPokemonDetails
    // Returns: The details of the Pokemon with
    // 'id' == id. Returns nil if none found.
    access(all) fun getPokemonDetails(id: UInt64): PokemonDetails? {
        return self.storedPokemon[id]?.details
    }


    // / don't forget to initialize
    // our variable!
    init() {
        self.totalPokemonCreated = 0
         self.storedPokemon <- {}
}

}
//Resources in Cadence use the @ symbol in front of their type to say, “this is a resource.” For example: @Pokemon.
//You can only make a new resource with the create keyword. The create keyword can only ever be used inside the contract. This means you, as the developer, can control when they are made. This is not true for structs, since structs can be created outside the contract in structs and transactions.
//To move resources around you must use the <- “move” operator. In Cadence, you cannot simply use the = to put a resource somewhere. You MUST use the <- “move operator” to explicity “move” the resource around.
//You use the destroy keyword to destroy a resource (we will see this later)
//We added a new totalPokemonCreated contract state variable and initialized it to 0 in our contract init function
// Incremented totalPokemonCreated everytime a new Pokemon resource is created. 
// Even though storedPokemon isn’t a resource itself, it is a dictionary that stores resources and thus must be treated like one. That is why we must use <- on this line: self.storedPokemon <- {}
// When defining a dictionary that contains resources, the @ symbol must be out front. Ex. @{UInt64: Pokemon} … NOT {UInt64: @Pokemon}
// Inside the storePokemon function, we use this operator: <-!. This is called the “force-move operator”. Cadence requires us to use this with dictionaries because it will abort the program if a Pokemon at the specific id already exists. This is protecting us from accidentally overwriting a Pokemon in the dictionary.