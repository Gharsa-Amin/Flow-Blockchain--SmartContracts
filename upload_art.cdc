import Art from "./Art.cdc"

transaction(name: String, artLink: String, hoursWorkedOn: Int) {

    prepare(signer: &Account) {}

    execute {
        Art.uploadArt(name: name, artLink: artLink, hoursWorkedOn: hoursWorkedOn)
        log("We're done.")
    }
}