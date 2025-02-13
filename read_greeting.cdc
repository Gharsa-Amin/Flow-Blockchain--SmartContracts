import HelloWorld from "./HelloWorld.cdc"

access(all) fun main(): String {
    return HelloWorld.greeting
}