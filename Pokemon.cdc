access(all) contract Pokeman {
    // Renaming resource to avoid conflict
    access(all) resource PokemanResource {
        access(all) let name: String 

        init() {
            self.name = "Pikachu"
        }
    }
}
