access(all) contract Art { //we defined a new contract named Contract Art 

    // this will act as an 'id' for
    // new art pieces
    access(all) var totalArtPieces: 
    access(all) var artPieces: {Int: ArtPiece} //We defined a dictionary named artPieces that maps an ‘id’ to an ArtPiece struct with that ‘id’

    access(all) struct ArtPiece { //We defined a new Struct called ArtPiece that contains 4 fields
        access(all) let id: Int
        access(all) let name: String
        access(all) let artLink: String
        access(all) let hoursWorkedOn: Int

        init(id: Int, name: String, artLink: String, hoursWorkedOn: Int) {
            self.id = id
            self.name = name
            self.artLink = artLink
            self.hoursWorkedOn = hoursWorkedOn
        }
    }

    access(all) fun uploadArt(name: String, artLink: String, hoursWorkedOn: Int) { //creating a function for adding a new ID.... 
        let id: Int = Art.totalArtPieces
        let newArtPiece = ArtPiece(id: id, name: name, artLink: artLink, hoursWorkedOn: hoursWorkedOn)
        // store the new art piece, mapped to its `id`
        self.artPieces[id] = newArtPiece
        // increment the amount of art pieces by one
        Art.totalArtPieces = Art.totalArtPieces + 1
    }

    init() {
        self.totalArtPieces = 0
        self.artPieces = {}
    }
}