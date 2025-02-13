access(all) contract Art {

    // this will act as an 'id' for
    // new art pieces
    access(all) var totalArtPieces: Int
    access(all) var artPieces: {Int: ArtPiece}

    access(all) struct ArtPiece {
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

    access(all) fun uploadArt(name: String, artLink: String, hoursWorkedOn: Int) {
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